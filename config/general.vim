" neovide
if exists("g:neovide")
    set guifont=Cascadia_Code_PL:h13

    let g:neovide_scale_factor = 0.75
    let g:neovide_fullscreen = v:false
    let g:neovide_cursor_trail_size = 0.0625
    let g:neovide_cursor_animation_length = 0.05

    function Neovide_fullscreen()
        if g:neovide_fullscreen == v:true
            let g:neovide_fullscreen = v:false
        else
            let g:neovide_fullscreen = v:true
        endif
    endfunction

    map <F11> <Cmd>call Neovide_fullscreen()<CR>
    let g:loaded_netrw       = 1
    let g:loaded_netrwPlugin = 1
endif


" numbers
set number
set relativenumber

" set noshowmode " (hide -- INSERT -- bc lightline)
set showmode

" block cursor
set guicursor=a:block
set guicursor+=i:blinkon500-blinkwait500-blinkoff500

" tab settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

" highlight settings
set hlsearch
set incsearch

" wrap settings
set nowrap

" misc
set hidden
let g:tex_flavor = 'latex'

" history keeping
set noswapfile
set nobackup
set undodir="~/AppData/Local/nvim-data/undodir/"
set undofile

" prescroll
set scrolloff=20

" colorscheme
syntax on
set background=dark
colorscheme oxocarbon
let g:lightline = { "colorscheme" : "oxocarbon" }
