" startup commands
autocmd VimEnter * cd ~/
autocmd VimEnter * Neotree action=focus dir=~/

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
    ensure_installed = { "c", "cpp", "vim", "lua", "rust", "java", "python" },
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
--  nvim-neo-tree/neo-tree.nvim  --
-- -- -- -- -- -- -- -- -- -- -- --

require 'neo-tree'.setup
{
    popup_border_style = "rounded",

    sources = 
    {
        "filesystem",
        "buffers",
        "git_status"
    },
    
    source_selector = 
    {
        winbar = true
    },

    filesystem = 
    {
        filtered_items =
        {
            visible = true,
            hide_dotfiles = false,
            hide_gitignored = false
        }
    },

    hijack_netrw_behavior = "open_default"
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

-- -- -- -- -- -- -- -- -- -- --
--  simrat39/rust-tools.nvim  --
-- -- -- -- -- -- -- -- -- -- --

local opts =
{
    tools =
    {
        -- automatically call RustReloadWorkspace when writing to a Cargo.toml file.
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
            highlight = "Comment",
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
