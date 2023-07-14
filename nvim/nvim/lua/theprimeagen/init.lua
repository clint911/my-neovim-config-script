require("theprimeagen.remap")
require("theprimeagen.set")

local augroup = vim.api.nvim_create_augroup
local ThePrimeagenGroup = augroup('ThePrimeagen', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})
local lspconfig = require("lspconfig")
lspconfig.solidity.setup({
  cmd = { "nomicfoundation-solidity-language-server", "--stdio" },
  filetypes = { "solidity" },
  root_dir = require("lspconfig.util").find_git_ancestor,
  single_file_support = true,
})

function R(name)
  require("plenary.reload").reload_module(name)
end

autocmd('TextYankPost', {
  group = yank_group,
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 40,
    })
  end,
})

autocmd({ "BufWritePre" }, {
  group = ThePrimeagenGroup,
  pattern = "*",
  command = "%s/\\s\\+$//e",
})
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 2
vim.g.netrw_winsize = 25

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    update_in_insert = true, r
  }
)
vim.diagnostic.config({ virtual_text = true })
vim.diagnostic.config({
  virtual_text = {
    -- source = "always",  -- Or "if_many"
    prefix = '●', -- Could be '■', '▎', 'x'
  },
  severity_sort = true,
  float = {
    source = "always", -- Or "if_many"
  },
})
