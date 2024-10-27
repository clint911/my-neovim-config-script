return { "stevanmilic/nvim-lspimport", 
config = function() 
   --- auto import keymap
   vim.keymap.set("n", "<leader>a", require("lspimport").import, { noremap = true }) 
end
}
