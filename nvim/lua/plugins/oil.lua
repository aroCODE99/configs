return {
    "stevearc/oil.nvim",
    opts = {},
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("oil").setup({
            default_file_explorer = true,
            delete_to_trash = false,
            skip_confirm_for_simple_edits = true,
            view_options = {
                show_hidden = true,
                natural_order = true,
                is_always_hidden = function(name, _)
                    return name == ".." or name == ".git" or name:match("%.class$")
                end,
            },
            win_options = {
                wrap = true,
                winblend = 0,
            },
            use_default_keymaps = true,
        })
        vim.api.nvim_set_keymap("n", "<Tab>", ":Oil<CR>", { noremap = true, silent = true })
    end,
}
