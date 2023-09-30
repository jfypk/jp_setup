" ========================================
" Vim plugin configuration
" ========================================
"
" This file contains the list of plugin installed using vimplug plugin manager.
" Once you've updated the list of plugin, you can run vundle update by issuing
" the command :PluginInstall from within Vim

call plug#begin('~/.vim/plugged')

" ========== Vim improvements ============
Plug 'AndrewRadev/splitjoin.vim'
Plug 'Raimondi/delimitMate'
Plug 'briandoll/change-inside-surroundings.vim'
Plug 'godlygeek/tabular'
Plug 'tomtom/tcomment_vim'
Plug 'vim-scripts/camelcasemotion'
Plug 'vim-scripts/matchit.zip'
Plug 'Keithbsmiley/investigate.vim'
Plug 'chrisbra/NrrwRgn'
Plug 'christoomey/vim-tmux-navigator'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'bogado/file-line'
Plug 'mattn/webapi-vim'
Plug 'skwp/YankRing.vim'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-scripts/AnsiEsc.vim'
Plug 'vim-scripts/AutoTag'
Plug 'vim-scripts/lastpos.vim'
Plug 'vim-scripts/sudo.vim'
Plug 'goldfeld/ctrlr.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'vim-scripts/goyo.vim'
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'thaerkh/vim-workspace'
Plug 'junegunn/limelight.vim'
Plug 'soramugi/auto-ctags.vim'

" ========== Text Objects ==============
Plug 'austintaylor/vim-indentobject'
Plug 'bootleq/vim-textobj-rubysymbol'
Plug 'coderifous/textobj-word-column.vim'
Plug 'kana/vim-textobj-datetime'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-user'
Plug 'lucapette/vim-textobj-underscore'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'thinca/vim-textobj-function-javascript'
Plug 'wellle/targets.vim'

" ========== Search =====================
Plug 'justinmk/vim-sneak'
Plug 'rking/ag.vim'
Plug 'henrik/vim-indexed-search'
Plug 'nelstrom/vim-visual-star-search'
Plug 'skwp/greplace.vim'
Plug 'Lokaltog/vim-easymotion'

" ============= Ruby =====================
Plug 'ecomba/vim-ruby-refactoring'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-rvm'
Plug 'vim-ruby/vim-ruby'
Plug 'keith/rspec.vim'
Plug 'skwp/vim-spec-finder'
Plug 'ck3g/vim-change-hash-syntax'

" ============= Project =================
Plug 'preservim/nerdtree'
Plug 'JazzCore/ctrlp-cmatcher'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'xolox/vim-misc'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'jlanzarotta/bufexplorer' "replaced with telescope
Plug 'github/copilot.vim'
Plug 'nvim-lua/plenary.nvim'

" ============= Languages ================
Plug 'sheerun/vim-polyglot'
Plug 'honza/vim-snippets'
Plug 'jtratner/vim-flavored-markdown'
Plug 'vim-syntastic/syntastic'
Plug 'nelstrom/vim-markdown-preview'
Plug 'skwp/vim-html-escape'
Plug 'mxw/vim-jsx'
Plug 'jparise/vim-graphql'
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components'
" Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'dense-analysis/ale'

" ================== Git ================
Plug 'gregsexton/gitv'
Plug 'mattn/gist-vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'airblade/vim-gitgutter'
Plug 'ruanyl/vim-gh-line'
" Plug 'pwntester/octo.nvim'
Plug 'github/copilot.vim'

" ============= Appearance ===============
Plug 'chrisbra/color_highlight'
Plug 'skwp/vim-colors-solarized'
Plug 'dracula/vim', {'name':'dracula'}
Plug 'itchyny/lightline.vim'
Plug 'jby/tmux.vim'
Plug 'morhetz/gruvbox'
Plug 'chriskempson/base16-vim'

" Required for Gblame in terminal vim
Plug 'godlygeek/csapprox'

call plug#end()
