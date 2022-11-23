" highlighting
nnoremap <silent> <C-u>         <Cmd>nohl<CR>

" inverse tab
inoremap          <S-Tab>       <C-d>

" insta newly edit current line
nnoremap <silent> <C-c>         cc

" full copy and replace shortcuts
nnoremap          gc            <Cmd>%y+<CR>
nnoremap <silent> gv            <Cmd>%d<CR>"+P<CR>

" rust keybinds
nnoremap <silent> <leader>re    <Cmd>lua vim.lsp.buf.hover()<CR>
nnoremap          <leader>rr    :!cargo run<CR>

" neo-tree
nnoremap <silent> <C-n>         :Neotree action=focus reveal=true<CR>

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
