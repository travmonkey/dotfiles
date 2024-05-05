return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({})
		local Terminal = require("toggleterm.terminal").Terminal
		local lazygit = Terminal:new({
			cmd = "lazygit",
			hidden = true,
      display_name = "git",
      direction = "float",
		})

    function Set_neotree_terminal()
      local neotree = require "neo-tree"
      local nvimtree_view = require "neo-tree.view"
    end
		function Lazygit_toggle()
			lazygit:toggle()
		end
	end,
}
