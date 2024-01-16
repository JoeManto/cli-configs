require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "clangd" }
})

local on_attach = function(_,_)
	vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
	vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
	vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
end

require("lspconfig").lua_ls.setup {
	on_attach = on_attach
}

require("lspconfig").clangd.setup {
	on_attach = on_attach
}

local swift_lsp = vim.api.nvim_create_augroup("swift_lsp", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
 	pattern = { "swift" },
 	callback = function()
 		local root_dir = vim.fs.dirname(vim.fs.find({
 			"Package.swift",
 			".git",
 		}, { upward = true })[1])
 		local client = vim.lsp.start({
 			name = "sourcekit-lsp",
 			cmd = { "sourcekit-lsp" },
 			root_dir = root_dir,
 		})
 		vim.lsp.buf_attach_client(0, client)
 	end,
 	group = swift_lsp,
})
