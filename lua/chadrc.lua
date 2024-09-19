---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "doomchad",

  transparency = true,

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
}

return M
