local autocmd = vim.api.nvim_create_autocmd
autocmd({ "BufWinEnter" }, {
	pattern = { "*" },
	command = "silent! loadview",
})
autocmd({ "BufWinLeave" }, {
	pattern = { "*" },
	command = "silent! mkview",
})

-- Prose settings for documents: soft wrap, one sentence per line
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown", "typst" },
	callback = function(ev)
		local o = vim.opt_local
		-- Disable code-style indentation
		o.smartindent = false
		o.indentexpr = ""
		o.autoindent = true -- Keep indentation of the previous line (useful for lists)

		-- Soft wrap instead of hard wrap, so diffs stay one sentence per line
		o.wrap = true
		o.linebreak = true
		o.breakindent = true
		o.textwidth = 0
		o.colorcolumn = ""
		o.formatoptions = "tcqjn" -- n: recognise numbered lists when formatting

		o.spell = true
		-- fr first so `zg` adds words to spell/fr.utf-8.add; frapos is Vim's official
		-- French dictionary, which accepts the straight apostrophe (l'espèce) that
		-- fr.utf-8.spl rejects (it only knows l’espèce)
		o.spelllang = { "fr", "frapos", "en" }
		o.number = false
		o.relativenumber = false
		o.conceallevel = 2 -- lets markview hide markup cleanly

		-- Move by visual line on wrapped text, but keep counts (5j) on real lines
		local map = function(lhs, rhs)
			vim.keymap.set({ "n", "x" }, lhs, function()
				return vim.v.count == 0 and rhs or lhs
			end, { buffer = ev.buf, expr = true })
		end
		map("j", "gj")
		map("k", "gk")
	end,
})
