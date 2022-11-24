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

-- -- -- -- -- -- -- -- --
--   clangd lsp setup   --
-- -- -- -- -- -- -- -- --

require'lspconfig'.clangd.setup{}

-- -- -- -- -- -- -- --
-- pyright lsp setup --
-- -- -- -- -- -- -- --

require'lspconfig'.pyright.setup{}

-- -- -- -- -- -- -- --
--  latex lsp setup  --
-- -- -- -- -- -- -- --

require'lspconfig'.texlab.setup{}

local opts =
{
    tools =
    {
        -- automatically call RustReloadWorkspace when writing to cargo.toml
        reload_workspace_from_cargo_toml = true,

        inlay_hints =
        {
            auto = true,
            only_current_line = false,
            show_parameter_hints = true,
            parameter_hints_prefix = "<- ",
            other_hints_prefix = "=> ",
            max_len_align = false,
            max_len_align_padding = 1,
            right_align = false,
            right_align_padding = 7,
            highlight = "Commnt",
        },

        hover_actions =
        {
            border =
            {
                { "╭", "FloatBorder" },
                { "─", "FloatBorder" },
                { "╮", "FloatBorder" },
                { "│", "FloatBorder" },
                { "╯", "FloatBorder" },
                { "─", "FloatBorder" },
                { "╰", "FloatBorder" },
                { "│", "FloatBorder" },
             },
             max_width = nil,
             max_height = nil,
             auto_focus = false,
        },
  },

    server =
    {
        settings =
        {
            ["rust-analyzer"] =
            {
                assist =
                {
                    importEnforceGranularity = true,
                    importPrefix = "crate"
                },
                cargo =
                {
                    allFeatures = true
                },
            },
            inlayHints =
            {
                lifetimeElisionHints =
                {
                    enable = true,
                    useParameterNames = true
                },
            },
        },
        flags = 
        {
            debounce_text_changes = 150
        }
    },
}

require'rust-tools'.setup(opts)

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
        ['<C-a>'] = cmp.mapping.scroll_docs(-4),
        ['<C-s>'] = cmp.mapping.scroll_docs(4),
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
