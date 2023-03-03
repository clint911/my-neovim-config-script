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
