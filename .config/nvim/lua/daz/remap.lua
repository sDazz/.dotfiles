local nnoremap = require("daz.keymap").nnoremap
local vnoremap = require("daz.keymap").vnoremap
local inoremap = require("daz.keymap").inoremap
local snoremap = require("daz.keymap").snoremap


nnoremap("<leader>pv", "<cmd>Ex<CR>")
nnoremap("<leader>o", "o <Esc>")
nnoremap("<leader>O", "O <Esc>")

--Telescope shortcuts
nnoremap("<leader>pf", "<cmd>Telescope find_files<CR>")
nnoremap("<leader>pg", "<cmd>Telescope live_grep<CR>")
nnoremap("<leader>pb", "<cmd>Telescope buffers<CR>")
nnoremap("<leader>ph", "<cmd>Telescope help_tags<CR>")

--Yank to clipboard
vnoremap("<leader>y", "\"+y")
nnoremap("<leader>yy", "\"+yy")

--?
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")
