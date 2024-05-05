return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("bufferline").setup({
			options = {
				diagnostics = "nvim_lsp",
				show_buffer_icons = true,
				separator_style = "slant",
				diagnostics_indicator = function(count, level)
					local icon = level:match("error") and " " or ""
					return " " .. icon .. count
				end,
				indicator = {
					style = "underline",
				},
				offsets = {
					{
						filetype = "neo-tree",
						text = "Neo Tree",
						text_align = "center",
						separator = false,
					},
				},
				highlights = {
					indicator_selected = {
						sp = "#f5bde6",
						fg = "#f5bde6",
						bg = "#f5bde6",
					},
					buffer_selected = {
						sp = "#f5bde6",
						fg = "#f5bde6",
						bg = "#f5bde6",
					},
				},
			},
		})
	end,
}
