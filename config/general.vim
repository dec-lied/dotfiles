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
endif


" numbers
set number
set relativenumber

" set noshowmode " (hide -- INSERT -- bc lightline)
set showmode

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
set whichwrap+=<,>,[,]

" misc
set hidden

" history keeping
set noswapfile
set nobackup
set undodir="~/AppData/Local/nvim-data/undodir/"
set undofile

" prescroll
set scrolloff=10

" colorscheme
syntax on
colorscheme duskfox
let g:lightline = { "colorscheme" : "duskfox" }
