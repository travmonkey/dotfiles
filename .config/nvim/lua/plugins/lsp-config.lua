return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				auto_install = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.tsserver.setup({
				capabilities = capabilities,
				filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
				cmd = { "typescript-language-server", "--stdio" },
			})
			lspconfig.basedpyright.setup({
				capabilities = capabilities,
			})
			lspconfig.bashls.setup({
				capabilities = capabilities,
			})
			lspconfig.sorbet.setup({
				capabilities = capabilities,
			})
      lspconfig.cssls.setup({
        capabilities = capabilities,
      })
		end,
	},
}
