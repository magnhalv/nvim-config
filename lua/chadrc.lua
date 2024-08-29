-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "darkcula",
}

M.ui = {
  theme = "darcula",

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

M.options = {
  relativenumber = true, -- Always show relative line numbers
  number = true, -- Also show the absolute number for the current line
}

return M
