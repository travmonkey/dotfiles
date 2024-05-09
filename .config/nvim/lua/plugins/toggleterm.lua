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

		function Lazygit_toggle()
			lazygit:toggle()
		end
	end,
}
