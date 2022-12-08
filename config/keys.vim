" highlighting
nnoremap <silent> <C-u>         <Cmd>nohl<CR>

" inverse tab
inoremap          <S-Tab>       <C-d>

" cc shortcut
nnoremap <silent> <C-c>         cc

" dd shortcut
nnoremap <silent> <C-d>         dd

" 1/2 page scrolling
nnoremap <silent> <C-S-j>       <C-d>zz
nnoremap <silent> <C-S-k>       <C-u>zz

" full copy and replace shortcuts
nnoremap          gc            <Cmd>%y+<CR>
nnoremap <silent> gv            <Cmd>%d<CR>"+P<CR>

" rust keybinds
nnoremap          <leader>rr    <Cmd>!cargo run<CR>
nnoremap          <leader>rt    <Cmd>!cargo test<CR>

" latex keybinds
function! OpenPdf()
    let filename = expand('%:p:r') . '.pdf'
    execute 'silent !' . filename
endfunction

nnoremap          <leader>lc    <Cmd>TexlabBuild<CR>
nnoremap <silent> <leader>lv    <Cmd>call OpenPdf()<CR>

" python keybinds
nnoremap <silent> <leader>p     <Cmd>!python %:p<CR>

" nvimtree
nnoremap <silent> <C-n>         <Cmd>NvimTreeFocus<CR> <Cmd>NvimTreeRefresh<CR>

" telescope keys
nnoremap <silent> <C-f>         <Cmd>Telescope find_files<CR>
nnoremap <silent> <leader>ff    <Cmd>Telescope buffers<CR>
nnoremap <silent> <leader>fd    <Cmd>Telescope help_tags<CR>

" window navigation
nnoremap <silent> <C-h> 	    <Cmd>wincmd h<CR>
nnoremap <silent> <C-j> 	    <Cmd>wincmd j<CR>
nnoremap <silent> <C-k> 	    <Cmd>wincmd k<CR>
nnoremap <silent> <C-l> 	    <Cmd>wincmd l<CR>

" tab navigation
nnoremap <silent> <A-h> 	    <Cmd>BufferPrevious<CR>
nnoremap <silent> <A-l> 	    <Cmd>BufferNext<CR>

nnoremap <silent> <A-j> 	    <Cmd>BufferMovePrevious<CR>
nnoremap <silent> <A-k> 	    <Cmd>BufferMoveNext<CR>

nnoremap <silent> <A-1> 	    <Cmd>BufferGoto 1<CR>
nnoremap <silent> <A-2> 	    <Cmd>BufferGoto 2<CR>
nnoremap <silent> <A-3> 	    <Cmd>BufferGoto 3<CR>
nnoremap <silent> <A-4> 	    <Cmd>BufferGoto 4<CR>
nnoremap <silent> <A-5> 	    <Cmd>BufferGoto 5<CR>
nnoremap <silent> <A-6> 	    <Cmd>BufferGoto 6<CR>
nnoremap <silent> <A-7> 	    <Cmd>BufferGoto 7<CR>
nnoremap <silent> <A-8> 	    <Cmd>BufferGoto 8<CR>
nnoremap <silent> <A-9> 	    <Cmd>BufferGoto 9<CR>

nnoremap <silent> <A-d> 	    <Cmd>BufferClose<CR>
