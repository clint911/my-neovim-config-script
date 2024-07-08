return {
  {
      "folke/trouble.nvim",
      config = function()
          require("trouble").setup({
              icons = true,
          })

          vim.keymap.set("n", "<leader>tt", function()
              require("trouble").toggle()
          end)

          vim.keymap.set("n", "[t", function()
              require("trouble").next({skip_groups = true, jump = true});
          end)

          vim.keymap.set("n", "]t", function()
              require("trouble").previous({skip_groups = true, jump = true});
          end)
         vim.keymap.set("n", "<C-t>", function() require("trouble").toggle("quickfix") end)
 vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end)
      end
  },
}
