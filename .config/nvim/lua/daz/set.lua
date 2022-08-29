vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.smartindent = true
vim.opt.scrolloff=8
vim.opt.signcolumn = "yes"

vim.opt.wrap = false
vim.g.mapleader = ' '

vim.g.netrw_keepdir = 0

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

vim.api.nvim_create_autocmd({ "BufNewFile" }, {
  pattern = { "*" },
  command = [[setlocal formatoptions-=cro]],
})
vim.api.nvim_create_autocmd({ "BufRead" }, {
  pattern = { "*" },
  command = [[setlocal formatoptions-=cro]],
})
