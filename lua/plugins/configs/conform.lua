local config = function()
	local conform = require("conform")

	conform.setup({
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "black" },
			go = { "goimports", "gofmt" },
			svelte = { { "prettierd", "prettier" } },
			astro = { { "prettierd", "prettier" } },
			vue = { { "prettierd", "prettier" } },
			javascript = { { "prettierd", "prettier" } },
			typescript = { { "prettierd", "prettier" } },
			javascriptreact = { { "prettierd", "prettier" } },
			typescriptreact = { { "prettierd", "prettier" } },
			json = { { "prettierd", "prettier" } },
			graphql = { { "prettierd", "prettier" } },
			java = { "google-java-format" },
			kotlin = { "ktlint" },
			ruby = { "standardrb" },
			markdown = { { "prettierd", "prettier" } },
			erb = { "htmlbeautifier" },
			html = { "prettier" },
			bash = { "beautysh" },
			proto = { "buf" },
			rust = { "rustfmt" },
			yaml = { "yamlfix" },
			toml = { "taplo" },
			css = { { "prettierd", "prettier" } },
			scss = { { "prettierd", "prettier" } },
			php = { "php-cs-fixer" },
		},
		stop_after_first = true,
	})

	conform.formatters.prettier = {
		prepend_args = { "--prose-wrap", "always" },
	}

	vim.keymap.set({ "n", "v" }, "<leader>l", function()
		conform.format({
			lsp_fallback = true,
			async = false,
			timeout_ms = 1000,
		})
	end, { desc = "Format file or range (in visual mode)" })
end

return config
