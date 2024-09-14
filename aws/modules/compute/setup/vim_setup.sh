# message
echo ==\>setting up vim...

# creating .vim and .vimrc 
echo init config...
mkdir -m 755 -p ./.vim
mkdir -p ~/.vim/ftdetect
touch ./.vimrc
touch ~/.vim/ftdetect/solidity.vim

# color setting
echo color setting...
sudo git clone https://github.com/tomasr/molokai && mv molokai/colors ./.vim && rm -r -f molokai 

# installing plugin manager for vim 
echo installing plugin manager...
sudo git clone https://github.com/VundleVim/Vundle.vim.git /home/vagrant/.vim/bundle/Vundle.vim
sudo chown -R vagrant:vagrant .vim

# writing to .vim file
echo writing to .vim file...
echo autocmd BufRead,BufNewFile *.sol set filetype=solidity >> ./.vim/ftdetect/solidity.vim

# writing to .vimrc file
echo writing to .vimrc file...
echo \
"\" plugin setup 
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'tomlion/vim-solidity'
call vundle#end()
filetype plugin indent on    

\" basic vim config
colorscheme molokai
set bg=dark
set t_Co=256
set showmatch 
set matchtime=3
autocmd GUIEnter * set vb t_vb=
autocmd VimEnter * set vb t_vb=
syntax enable
set number 
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4

\" jedi-vim config
let g:jedi#auto_completion_popup = 1
let g:jedi#auto_completion_start_timeout = 50
let g:jedi#auto_completion_enable_snippets = 1
let g:jedi#auto_completion_popup_width = 80
let g:jedi#show_call_signatures = 80
imap <C-Space> <Plug>(jedi-completion)

\"vim-solidity
Plugin 'tomlion/vim-solidity'

\" installing plugin
autocmd VimEnter * if !&runtimepath =~# '\.vim/bundle/Vundle.vim' | PluginInstall | endif" \
>> ./.vimrc

echo ==\>vim setup completed.
