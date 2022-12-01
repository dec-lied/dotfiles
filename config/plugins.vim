" startup commands
autocmd VimEnter * cd ~/
autocmd VimEnter * :NvimTreeFocus

lua << EOF

-- -- -- -- -- -- -- -- -- --
--  windwp/nvim-autopairs  --
-- -- -- -- -- -- -- -- -- --

require'nvim-autopairs'.setup {}

-- -- -- -- -- -- -- --
-- j-hui/fidget.nvim --
-- -- -- -- -- -- -- --

require"fidget".setup{}

-- -- -- -- -- -- -- -- -- -- -- -- -- --
--   nvim-treesitter/nvim-treesitter   --
-- -- -- -- -- -- -- -- -- -- -- -- -- --

require'nvim-treesitter.configs'.setup
{
    ensure_installed = { "c", "cpp", "vim", "lua", "rust", "java", "python" }, -- latex handled by texlab
    sync_install = false,
    auto_install = false,

    highlight =
    {
        enable = true
    }
}

-- -- -- -- -- -- -- -- --
--  romgrk/barbar.nvim  --
-- -- -- -- -- -- -- -- --

vim.g.bufferline = 
{
    animation = false,
    closable = false,
    icons = true
}

-- -- -- -- -- -- -- -- -- -- -- --
-- nvim-telescope/telescope.nvim --
-- -- -- -- -- -- -- -- -- -- -- --

require 'telescope'.setup
{
    defaults = 
    {
        file_ignore_patterns = { ".git" }
    }
}

-- -- -- -- -- -- -- -- -- -- -- --
--    nvim-tree/nvim-tree.lua    --
-- -- -- -- -- -- -- -- -- -- -- --

require'nvim-tree'.setup
{
    open_on_setup = true,
    sync_root_with_cwd = true, -- actions { change_dir { global } } may have conflicts if this is enabled

    view =
    {
       adaptive_size = true,
       relativenumber = true,
       signcolumn = "no",

       mappings =
       {
            list =
            {
               { key = "<BS>",  action = "dir_up" },
               { key = ".",     action = "cd"}
            },
       },
    },
    renderer =
    {
       symlink_destination = false,

       icons = 
       {
            show =
            {
                git = false
            }
        }
    },
    filesystem_watchers =
    {
        enable = false,
    },
    update_focused_file =
    {
        enable = true
    },
    actions = 
    {
        change_dir = 
        {
            enable = true,
            global = true
        }
    }
}

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
--    lukas-reineke/indent-blankline.nvim    --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

require'indent_blankline'.setup
{
    show_current_context = true,
}

-- -- -- -- -- -- -- --
-- general lsp setup -- 
-- -- -- -- -- -- -- --

local on_attach = function(client, bufnr)
    vim.keymap.set('n', '<leader>a', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', '<leader>s', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', '<leader>d', vim.lsp.buf.declaration, bufopts)
end

local lsp_flags =
{
    debounce_text_changes = 150,
}

local servers = { 'clangd', 'pyright', 'texlab' }

for _, server in pairs(servers) do
    require'lspconfig'[server].setup
    {
        on_attach = on_attach,
        lsp_flags = lsp_flags
    }
end

-- -- -- -- -- -- -- -- --
--   clangd lsp setup   --
-- -- -- -- -- -- -- -- --

-- -- -- -- -- -- -- --
-- pyright lsp setup --
-- -- -- -- -- -- -- --

-- -- -- -- -- -- -- --
--  latex lsp setup  --
-- -- -- -- -- -- -- --

-- -- -- -- -- -- --
-- rust lsp setup --
-- -- -- -- -- -- --

require'lspconfig'.rust_analyzer.setup
{
    on_attach = on_attach,
    
    settings =
    {
        ["rust-analyzer"] =
        {
            inlayHints = 
            {
                bindingModeHints = true
            },
            cargo =
            {
                autoreload = true
            },
            checkOnSave =
            {
                command = "clippy"
            }
        }
    }
}

-- -- -- -- -- -- -- -- --
--   hrsh7th/nvim-cmp   --
-- -- -- -- -- -- -- -- --

local cmp = require'cmp'
cmp.setup
{
    snippet =
    {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    mapping = 
    {
        ['<C-S-f>'] = cmp.mapping.scroll_docs(-4),
        ['<C-S-d>'] = cmp.mapping.scroll_docs(4),
        ['<Tab>'] = cmp.mapping.confirm (
        {
           behavior = cmp.ConfirmBehavior.Replace,
           select = true,
        }),
        ['<Up>'] = cmp.mapping.select_prev_item(),
        ['<Down>'] = cmp.mapping.select_next_item(),
    },
    sources =
    {
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
        { name = 'path' },
        { name = 'buffer' },
        { name = 'nvim_lsp_signature_help' },
    },
}

EOF
