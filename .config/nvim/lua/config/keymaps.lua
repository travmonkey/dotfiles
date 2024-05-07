local opts = { noremap = true, silent = true }

-- local term_opts = { silent = true }

-- Shorten the function name
local keymap = vim.keymap.set

-- Map space as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize window with arrow keys
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Showing line numbers
keymap("n", "<leader>n", "<cmd>set nu!<CR>", opts)
keymap("n", "<leader>rn", ":set rnu!<CR>", opts)

-- Use JK in insert/terminal mode to trigger Escape
keymap("i", "jk", "<Esc>", opts)
keymap("t", "jk", "<C-\\><C-n><Cmd>ToggleTerm<CR>", opts)

-----------------------------
--  */ -- bufferline -- /*
-----------------------------

-- Move to previous / next
keymap("n", "<tab>", "<Cmd>BufferLineCycleNext<CR>", opts)
keymap("n", "<S-tab>", "<Cmd>BufferLineCyclePrev<CR>", opts)

-- Goto buffer in position
keymap("n", "<C-1>", "<Cmd>BufferGoto 1<CR>", opts)
keymap("n", "<C-2>", "<Cmd>BufferGoto 2<CR>", opts)
keymap("n", "<C-3>", "<Cmd>BufferGoto 3<CR>", opts)
keymap("n", "<C-4>", "<Cmd>BufferGoto 4<CR>", opts)
keymap("n", "<C-5>", "<Cmd>BufferGoto 5<CR>", opts)
keymap("n", "<C-6>", "<Cmd>BufferGoto 6<CR>", opts)
keymap("n", "<C-7>", "<Cmd>BufferGoto 7<CR>", opts)
keymap("n", "<C-8>", "<Cmd>BufferGoto 8<CR>", opts)
keymap("n", "<C-9>", "<Cmd>BufferGoto 9<CR>", opts)

-- Select Tab
keymap("n", "<leader>p", "<Cmd>BufferLinePick<CR>", opts)

-- Close buffer
keymap("n", "<leader>x", "<Cmd>BufferLineClose<CR>", opts)

-----------------------------
--  */ -- neo-tree -- /*
-----------------------------

-- Opening Neotree to the left / Close it with q
keymap("n", "<leader>e", ":Neotree filesystem reveal left<CR>")

-----------------------------
--  */ -- lsp-config -- /*
-----------------------------

keymap("n", "K", vim.lsp.buf.hover, {})
keymap("n", "gd", vim.lsp.buf.definition, {})
keymap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

-----------------------------
--  */ -- terminal -- /*
-----------------------------

keymap("t", "<Esc>", "<C-\\><C-n>", opts)
keymap("n", "<leader>t", "<Cmd>ToggleTerm<CR>i", opts)
keymap("n", "<leader>gt", "<Cmd>lua Lazygit_toggle()<CR>", opts)

-----------------------------
-- */ Comments -- /*
-----------------------------

keymap("n", "<leader>_", "gcc", opts)

-----------------------------
