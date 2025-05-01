return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			require("cmp").setup({
				sources = {
					{ name = "nvim_lsp" },
				},
			})

			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilites = capabilites,
			})
			lspconfig.ts_ls.setup({
				capabilites = capabilites,
			})
			lspconfig.html.setup({
				capabilites = capabilites,
			})
			lspconfig.cmake.setup({
				capabilites = capabilites,
			})
			lspconfig.clangd.setup({
				capabilites = capabilites,
			})
			lspconfig.ast_grep.setup({
				capabilites = capabilites,
			})
			lspconfig.jsonls.setup({
				capabilites = capabilites,
			})
			lspconfig.bashls.setup({
				capabilites = capabilites,
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
