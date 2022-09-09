local nnoremap = require("daz.keymap").nnoremap
local vnoremap = require("daz.keymap").vnoremap
local inoremap = require("daz.keymap").inoremap
local snoremap = require("daz.keymap").snoremap
local xnoremap = require("daz.keymap").xnoremap



nnoremap("<leader>pv", "<cmd>Ex<CR>")
nnoremap("<leader>o", "o <Esc>x")
nnoremap("<leader>O", "O <Esc>x")

--Telescope shortcuts
nnoremap("<leader>pf", "<cmd>Telescope find_files<CR>")
nnoremap("<leader>pg", "<cmd>Telescope live_grep<CR>")
nnoremap("<leader>pb", "<cmd>Telescope buffers<CR>")
nnoremap("<leader>ph", "<cmd>Telescope help_tags<CR>")

--Yank to clipboard
vnoremap("<leader>y", "\"+y")
nnoremap("<leader>y", "\"+y")
nnoremap("<leader>yy", "\"+yy")

--greatest remap ever????
nnoremap("<leader>p", "\"+p")
inoremap("<C-v>","<CS-v>")

nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")


vnoremap("K", ":m '<-2<CR>gv=gv")
vnoremap("J", ":m '>+1<CR>gv=gv")


