-- Default Option table
local opts = { noremap = true, silent = true }

-- Shorten the function name
local keymap = vim.keymap.set
-- Spagetti Keybind Declarations
local wk = require("which-key")

-- Map space as the leader key
-- NOTE: Also mapped in lazy.lua to allow me to change which key in this file
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
keymap("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
keymap("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
keymap("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })

-- Resize window with arrow keys
keymap("n", "<C-Up>", ":resize -2<CR>", { noremap = true, silent = true })
keymap("n", "<C-Down>", ":resize +2<CR>", { noremap = true, silent = true })
keymap("n", "<C-Left>", ":vertical resize -2<CR>", { noremap = true, silent = true })
keymap("n", "<C-Right>", ":vertical resize +2<CR>", { noremap = true, silent = true })

-- Splitting windows
keymap("n", "<leader>sv", "<C-w>v", vim.tbl_extend("keep", opts, { desc = "Vertical Split" }))
keymap("n", "<leader>sh", "<C-w>s", vim.tbl_extend("keep", opts, { desc = "Horizontal Split" }))
keymap("n", "<leader>se", "<C-w>=", vim.tbl_extend("keep", opts, { desc = "Equal Splits" }))
keymap("n", "<leader>sx", "<cmd>close<CR>", vim.tbl_extend("keep", opts, { desc = "Close Split" }))

-- Showing line numbers
keymap("n", "<leader>nn", "<cmd>set nu!<CR>", vim.tbl_extend("keep", opts, { desc = "Show Line Numbers" }))
keymap("n", "<leader>nr", ":set rnu!<CR>", vim.tbl_extend("keep", opts, { desc = "Show Relative Numbers" }))

-- Use JK in insert/terminal mode to trigger Escape
keymap("i", "jk", "<Esc>", vim.tbl_extend("keep", opts, { desc = "" }))
-- keymap("t", "jk", "<C-\\><C-n><Cmd>ToggleTerm<CR>", {noremap = true, silent = true, desc = ""})

-- Clear search highlights
keymap("n", "<leader>nh", ":nohl<CR>", vim.tbl_extend("keep", opts, { desc = "Clear Highlights" }))

-----------------------------
--  */ -- bufferline -- /*
-----------------------------

-- Move to previous / next
keymap("n", "<tab>", "<Cmd>BufferLineCycleNext<CR>", vim.tbl_extend("keep", opts, { desc = "" }))
keymap("n", "<S-tab>", "<Cmd>BufferLineCyclePrev<CR>", vim.tbl_extend("keep", opts, { desc = "" }))

-- Goto buffer in position
keymap("n", "<C-1>", "<Cmd>BufferGoto 1<CR>", vim.tbl_extend("keep", opts, { desc = "" }))
keymap("n", "<C-2>", "<Cmd>BufferGoto 2<CR>", vim.tbl_extend("keep", opts, { desc = "" }))
keymap("n", "<C-3>", "<Cmd>BufferGoto 3<CR>", vim.tbl_extend("keep", opts, { desc = "" }))
keymap("n", "<C-4>", "<Cmd>BufferGoto 4<CR>", vim.tbl_extend("keep", opts, { desc = "" }))
keymap("n", "<C-5>", "<Cmd>BufferGoto 5<CR>", vim.tbl_extend("keep", opts, { desc = "" }))
keymap("n", "<C-6>", "<Cmd>BufferGoto 6<CR>", vim.tbl_extend("keep", opts, { desc = "" }))
keymap("n", "<C-7>", "<Cmd>BufferGoto 7<CR>", vim.tbl_extend("keep", opts, { desc = "" }))
keymap("n", "<C-8>", "<Cmd>BufferGoto 8<CR>", vim.tbl_extend("keep", opts, { desc = "" }))
keymap("n", "<C-9>", "<Cmd>BufferGoto 9<CR>", vim.tbl_extend("keep", opts, { desc = "" }))

-- Select Tab
keymap("n", "<leader>p", "<Cmd>BufferLinePick<CR>", vim.tbl_extend("keep", opts, { desc = "Pick Tab" }))

-- Close buffer
keymap("n", "<leader>bx", ":bd<CR>", vim.tbl_extend("keep", opts, { desc = "Close Buffer" }))
keymap("n", "<leader>bw", ":bw<CR>", vim.tbl_extend("keep", opts, { desc = "Wipe Buffer:WARNING" }))

-----------------------------
--  */ -- Telescope -- /*
-----------------------------

local builtin = require("telescope.builtin")
keymap("n", "<leader>ff", builtin.find_files, vim.tbl_extend("keep", opts, { desc = "Find Files" }))
keymap("n", "<leader>fg", builtin.live_grep, vim.tbl_extend("keep", opts, { desc = "Grep Files" }))

-----------------------------
--  */ -- Chat-GPT -- /*
-----------------------------

local gpt_keybinds = {
	["+Chat GPT / AI"] = {
		-- Code Commands
		e = { "<Cmd>GpRewrite<CR>", "Rewrite Selected Code" },
		g = { "<Cmd>GpAppend<CR>", "Generate New Code" },
		-- Chat Commands
		n = { "<Cmd>GpChatNew vsplit<CR>", "New Chat" },
		f = { "<Cmd>GpChatFinder tabnew<CR>", "Search Chats" },
		t = { "<Cmd>GpChatToggle vsplit<CR>", "Toggle Chat" },
		r = { "<Cmd>GpChatRespond<CR>", "Ask For A Response" },
		-- Other
		ma = { "<Cmd>GpAgent<CR>", "Display Current Model" },
		mc = { "<Cmd>GpNextAgent<CR>", "Change Current Model (WARNING)" },
	},
}

-- Binding all the commands in both visual and normal mode
for mode, default in pairs({ n = "a", v = "a" }) do
	for name, category in pairs(gpt_keybinds) do
		for key, binding in pairs(category) do
			local command = binding[1]
			local description = binding[2]
			wk.register({
				[default] = {
					name = name,
					mode = mode,
					[key] = { command, description },
				},
			}, { prefix = "<leader>" })
		end
	end
end

-----------------------------
--  */ -- neo-tree -- /*
-----------------------------

-- Opening Neotree to the left / Close it with q
keymap("n", "<leader>e", ":Neotree filesystem reveal left<CR>")

-----------------------------
--  */ -- lsp-config -- /*
-----------------------------

keymap("n", "<leader>ck", vim.lsp.buf.hover, vim.tbl_extend("keep", opts, { desc = "Hover" }))
keymap("n", "<leader>cd", vim.lsp.buf.definition, vim.tbl_extend("keep", opts, { desc = "Definition" }))
keymap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, vim.tbl_extend("keep", opts, { desc = "Code Actions" }))

-----------------------------
--  */ -- terminal -- /*
-----------------------------

keymap("t", "<Esc>", "<C-\\><C-n>", vim.tbl_extend("keep", opts, { desc = "" }))
keymap("n", "<leader>t", "<Cmd>ToggleTerm<CR>", vim.tbl_extend("keep", opts, { desc = "Toggle Term" }))
keymap("n", "<leader>gt", "<Cmd>lua Lazygit_toggle()<CR>", vim.tbl_extend("keep", opts, { desc = "Open Git" }))

-----------------------------
-- */ -- Register Names for whichkey -- /*
-----------------------------

wk.register({
	am = {
		name = "Models",
		mode = { "n", "v" },
	},
	s = {
		name = "Splits",
	},
	g = {
		name = "Git",
		mode = "n",
	},
	n = {
		name = "Line Numbers",
	},
	f = {
		name = "Find",
	},
	c = {
		name = "LSP",
		mode = { "n", "v" },
	},
	b = {
		name = "Buffers",
	},
}, { prefix = "<leader>" })
