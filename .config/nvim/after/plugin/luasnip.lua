local ls = require("luasnip")

require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/lua/daz/snippets"})

ls.config.set_config({
  history = true, -- keep around lastt snippet local to jump back
  updateevents = "TextChanged,TextChangedI",
  enable_autosnippets = true,
  ext_opts = {
    [require("luasnip.util.types").choiceNode] = {
      active = {
      },
    },
  },
})
-- KeyMaps
--vim.keymap.set({"i", "s"}, "<a-p>", function()
--  if ls.expand_or_jumpable() then
--    ls.expand()
--  end
--end)
--
--vim.keymap.set({"i","s"},"<a-j>",function()
--  if ls.choice_active() then
--    ls.change_choice(1)
--  end
--end)
--
--vim.keymap.set({ "i", "s" }, "<a-h>", function()
--  if ls.choice_active() then
--    ls.change_choice(-1)
--  end
--end)
