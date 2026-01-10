local autocmd = vim.api.nvim_create_autocmd
autocmd({ "BufWinEnter" }, {
	pattern = { "*" },
	command = "silent! loadview",
})
autocmd({ "BufWinLeave" }, {
	pattern = { "*" },
	command = "silent! mkview",
})

-- Change formatting behaviour for text files
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		-- Disable code-style indentation
		vim.opt_local.smartindent = false
		vim.opt_local.cindent = false
		vim.opt_local.indentexpr = ""
        -- Add automatic formatting to indent as text is typed
        vim.opt_local.formatoptions = "tcqla"

		-- specific options for prose
		vim.opt_local.autoindent = true -- Keep indentation of the previous line (useful for lists)
	end,
})
