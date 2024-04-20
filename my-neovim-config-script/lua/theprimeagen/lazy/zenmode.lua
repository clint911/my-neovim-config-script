return {
    "folke/zen-mode.nvim",
    config = function()
        vim.keymap.set("n", "<leader>zz", function()
            require("zen-mode").setup {
                window = {
--                    width = 90,
                      width = 300,
                    options = { }
                },
            }
            require("zen-mode").toggle()
            vim.wo.wrap = true
            vim.wo.number = true
            vim.wo.rnu = true
            vim.opt.colorcolumn = "0"
            ColorMyPencils()
        end)

    end
}
