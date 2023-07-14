require 'nvim-treesitter.configs'.setup {
  -- rainbow highlight
  -- A list of parser names, or "all"
  ensure_installed = { "c", "javascript", "typescript", "lua", "rust", "cpp", "python", "cmake" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (for "all")

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
