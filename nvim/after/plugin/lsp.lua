local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({ 
	'tsserver',
	'eslint',
	'sumneko_lua',
	'rust_analyzer',
})

local cmp = require('cmp') 
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({ 
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-y>'] = cmp.mapping.confirm({ select = true }), 
	["<C-Space>"] = cmp.mapping.complete(),
})
vim.lsp.handlers["textDocument/publishDiagnostics"] = function(_, _, result)
  if not (result and result.diagnostics) then return end
  local bufnr = result.uri:match("^file://(%d+)")
  if not bufnr then return end
  bufnr = tonumber(bufnr)
  local diagnostics = vim.lsp.util.diagnostics_by_buf[bufnr]
  for _, diagnostic in ipairs(diagnostics) do
    if diagnostic.severity == 1 then
      diagnostic.hint = vim.fn.matchadd("LspErrorUnderline", diagnostic.message, bufnr)
    end
  end
end

lsp.set_preferences({
	sign_icons = { } 
}) 
lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})
lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  if client.name == "eslint" then
      vim.cmd.LspStop('eslint')
      return
  end

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
  vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
  vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end)
lsp.setup()
