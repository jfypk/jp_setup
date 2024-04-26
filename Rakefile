require 'rake'
require 'fileutils'
require 'English'
require File.join(File.dirname(__FILE__), 'bin', 'other', 'vundle')

desc 'Hook our dotfiles into system-standard positions.'
task install: %i[submodule_init submodules] do
  puts
  puts '======================================================'
  puts 'Installing setup.'
  puts '======================================================'
  puts

  install_homebrew if RUBY_PLATFORM.downcase.include?('darwin')

  # this has all the runcoms from this directory.
  install_files(Dir.glob('git/*')) if want_to_install?('git configs (color, aliases)')
  install_files(Dir.glob('ctags/*')) if want_to_install?('ctags config (better js/ruby support)')
  install_files(Dir.glob('tmux/*')) if want_to_install?('tmux config')
  install_files(Dir.glob('vimify/*')) if want_to_install?('vimification of command line tools')
  if want_to_install?('vim configuration (highly recommended)')
    install_files(Dir.glob('{vim,vimrc}'))
  end

  Rake::Task['install_prezto'].execute

  if want_to_install?('neovim, lunarvim, and fonts')
    install_nvim
    install_lvim
    install_fonts
  end

  success_msg('installed')
end

task :install_prezto do
  install_prezto if want_to_install?('zsh enhancements & prezto')
end

desc 'Updates the installation'
task :update do
  Rake::Task['install'].execute
end

task :submodule_init do
  run %( git submodule update --init --recursive ) unless ENV['SKIP_SUBMODULES']
end

desc 'Init and update submodules.'
task :submodules do
  unless ENV['SKIP_SUBMODULES']
    puts '======================================================'
    puts 'Downloading submodules...please wait'
    puts '======================================================'

    run %(
      cd $HOME/.jp_setup
      git submodule update --recursive
      git clean -df
    )
    puts
  end
end

task default: 'install'

private

def run(cmd)
  puts "[Running] #{cmd}"
  `#{cmd}` unless ENV['DEBUG']
end

def install_homebrew
  run %(which brew)
  unless $CHILD_STATUS.success?
    puts '======================================================'
    puts "Installing Homebrew, the OSX package manager...If it's"
    puts 'already installed, this will do nothing.'
    puts '======================================================'
    run %{bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"}
  end

  puts
  puts
  puts '======================================================'
  puts 'Updating Homebrew.'
  puts '======================================================'
  run %(brew update)
  puts
  puts
  puts '======================================================'
  puts 'Installing Homebrew packages...There may be some warnings.'
  puts '======================================================'
  run %(brew install zsh ctags git hub tmux reattach-to-user-namespace the_silver_searcher ghi fontconfig fzf)
  puts
  puts
end

def install_fonts
  puts '======================================================'
  puts 'Installing patched fonts for Powerline/Lightline.'
  puts '======================================================'
  run %( cp -f $HOME/.jp_setup/fonts/* $HOME/Library/Fonts ) if RUBY_PLATFORM.downcase.include?('darwin')
  if RUBY_PLATFORM.downcase.include?('linux')
    run %( mkdir -p ~/.fonts && cp ~/.jp_setup/fonts/* ~/.fonts && fc-cache -vf ~/.fonts )
  end
  run %( mkdir -p ~/.local/share/fonts && ln -nfs "$HOME/.jp_setup/fonts" "$HOME/.local/share/fonts" )
  puts
end

def install_nvim
  puts
  puts 'installing neovim'
  run %(brew install neovim)
  puts
  puts 'symlinking neovim'

  run %( ln -nfs "$HOME/.jp_setup/nvim" "$HOME/.local/share" )
  run %( ln -nfs "$HOME/.jp_setup/nvim/config" "$HOME/.config/nvim" )
end

def install_lvim
  puts
  puts 'installing lunarvim'
  run %(LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh))
  puts
  puts 'symlinking lunarvim'

  run %( ln -nfs "$HOME/.jp_setup/lunarvim/" "$HOME/.local/share" )
  run %( ln -nfs "$HOME/.jp_setup/lunarvim/config" "$HOME/.config/lvim" )
end

def install_prezto
  puts
  puts 'Installing ZSH Enhancements...'

  run %( ln -nfs "$HOME/.jp_setup/zsh/zshrc" "$HOME/.zshrc" )

  run %(
    cd $HOME/.jp_setup/zsh/zsh
    git clone https://github.com/ohmyzsh/ohmyzsh.git
  )

  run %(
    cd $HOME/.jp_setup/zsh/zsh/ohmyzsh/custom/plugins
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
    git clone https://github.com/zsh-users/zsh-autosuggestions.git
    cp $HOME/.jp_setup/zsh/cobalt2.zsh-theme $HOME/.jp_setup/zsh/zsh/ohmyzsh/custom/themes
  )

  if "#{ENV['SHELL']}".include? 'zsh'
    puts 'Zsh is already configured as your shell of choice. Restart your session to load the new settings'
  else
    puts 'Setting zsh as your default shell'
    if File.exist?('/usr/local/bin/zsh')
      if File.readlines('/private/etc/shells').grep('/usr/local/bin/zsh').empty?
        puts 'Adding zsh to standard shell list'
        run %( echo "/usr/local/bin/zsh" | sudo tee -a /private/etc/shells )
      end
      run %( chsh -s /usr/local/bin/zsh )
    else
      run %( chsh -s /bin/zsh )
    end
  end
end

def want_to_install?(section)
  puts "Would you like to install configuration files for: #{section}? [y]es, [n]o"
  $stdin.gets.chomp == 'y'
end

def install_files(files, method = :symlink)
  files.each do |f|
    file = f.split('/').last
    source = "#{ENV['PWD']}/#{f}"
    target = "#{ENV['HOME']}/.#{file}"

    puts "======================#{file}=============================="
    puts "Source: #{source}"
    puts "Target: #{target}"

    if File.exist?(target) && (!File.symlink?(target) || (File.symlink?(target) && File.readlink(target) != source))
      puts "[Overwriting] #{target}...leaving original at #{target}.backup..."
      run %( mv "$HOME/.#{file}" "$HOME/.#{file}.backup" )
    end

    if method == :symlink
      run %( ln -nfs "#{source}" "#{target}" )
    else
      run %( cp -f "#{source}" "#{target}" )
    end

    puts '=========================================================='
    puts
  end
end

def success_msg(action)
  puts "Setup has been #{action}. Please restart your terminal and vim."
end
