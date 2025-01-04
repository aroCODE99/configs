vim.api.nvim_create_autocmd("FileType", {
    pattern = "java",
    callback = function()
        vim.api.nvim_buf_set_keymap(
            0,
            "n",
            "<F5>",
            ":w<cr>:!cd %:p:h && javac %:t && java %:t:r<cr>",
            { noremap = true, silent = true }
        )
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "c",
    callback = function()
        vim.api.nvim_buf_set_keymap(
            0,
            "n",
            "<F5>",
            ":w<cr>:!cd %:p:h && gcc %:t -o %:t:r && ./%:t:r<cr>",
            { noremap = true, silent = true }
        )
    end,
})
-- Pane and window Navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true }) -- Navigate Left
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true }) -- Navigate Down
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true }) -- Navigate Up
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true }) -- Navigate Right

--resizing keymaps
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { noremap = true, silent = true })             -- Increase height
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { noremap = true, silent = true })           -- Decrease height
vim.keymap.set("n", "<C-Left>", ":vertical resize +2<CR>", { noremap = true, silent = true })  -- Increase width
vim.keymap.set("n", "<C-Right>", ":vertical resize -2<CR>", { noremap = true, silent = true }) -- Decrease width

-- Indenting in Visual Mode
vim.keymap.set("v", "<Tab>", ">gv", { silent = true, noremap = true })
vim.keymap.set("v", "<S-Tab>", "<gv", { silent = true, noremap = true })

-- move selected lines up and down
vim.api.nvim_set_keymap("v", "<C-k>", ":move '<-2<cr>gv=gv", { noremap = true })
vim.api.nvim_set_keymap("v", "<C-j>", ":move '>+1<cr>gv=gv", { noremap = true })

vim.keymap.set("n", "<Esc>", ":noh<CR>", { noremap = true, silent = true })

--Quiting the currentBuffer
vim.keymap.set("n", "<leader>q", ":q<CR>", { noremap = true, silent = true })

--NVIM grep keymaps
vim.keymap.set("n", "<leader>fg", ":copen | :silent :grep ")
vim.keymap.set("n", "]q", ":cnext<CR>")
vim.keymap.set("n", "[q", ":cprev<CR>")

--mapping for git workflow
-- vim.api.nvim_set_keymap("n", "<leader>q", ":DiffviewClose<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>gd", ":Gdiffsplit<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>do", ":DiffviewOpen<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>dh", ":DiffviewFileHistory<CR>", { noremap = true, silent = true })

-- this open's up the diagnostic for the curr-line.
vim.keymap.set("n", "<leader>ds", ":lua vim.diagnostic.open_float()<CR>");
vim.keymap.set("n", "<leader>p", '"+p"', { noremap = true, silent = true })
vim.keymap.set("v", "<leader>p", '"+p"', { noremap = true, silent = true })

-- Copy to system clipboard
vim.keymap.set('n', '<C-y>', '"+y', { noremap = true, silent = true })  -- Normal mode
vim.keymap.set('v', '<C-y>', '"+y', { noremap = true, silent = true })  -- Visual mode
