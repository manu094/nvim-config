local autocmd = vim.api.nvim_create_autocmd
autocmd({"BufWinEnter"}, {
  pattern = {"*"},
  command = "silent! loadview"
})
autocmd({"BufWinLeave"}, {
  pattern = {"*"},
  command = "silent! mkview"
})
