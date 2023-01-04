local F = {}

local function bind(op, outer_opts)
    outer_opts = outer_opts or {noremap = true}
    return function(lhs, rhs, opts)
        opts = vim.tbl_extend("force",
            outer_opts,
            opts or {}
        )
        vim.keymap.set(op, lhs, rhs, opts)
    end
end

F.nmap = bind("n", {noremap = false})
F.nnoremap = bind("n")
F.vnoremap = bind("v")
F.xnoremap = bind("x")
F.inoremap = bind("i")

return F

