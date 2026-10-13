vim.pack.add({"https://github.com/Django0033/lonelog.nvim"})

require("lonelog").setup({
  use_telescope = "auto",         -- "auto" | true | false
  sidebar = { width = 50 },
  float = { border = "rounded", height = 0.4, width = 0.6 },
  oracle = { 
    default_table = "fate", 
    persist_chaos = true, 
    custom_tables = require("custom.plugins.lonelog_cpr_tables"),
  },
  dice = { max_dice = 100, max_sides = 1000 },
  prompt_for_scene_context = true,
  keymaps = { },
  highlight = {
    lonelogAction = { fg = "#ff6600", bold = true },
  },
  campaign = {
    default_ruleset = "",
    default_genre = "",
    default_player = "",
  },
  addons = {
    combat = false,
    dungeon = false,
    resources = false,
  },
})
