local M = {}

M.base_30 = {
  white = "#A9B7C6",
  darker_black = "#2B2B2B",
  black = "#2B2B2B", --  nvim bg
  black2 = "#313335",
  one_bg = "#3A3A3A", -- real bg of the theme
  one_bg2 = "#464646",
  one_bg3 = "#4F4F4F",
  grey = "#606366",
  grey_fg = "#707070",
  grey_fg2 = "#7F7F7F",
  light_grey = "#8E8E8E",
  red = "#CC7832",
  baby_pink = "#FF6B6B",
  pink = "#FF79C6",
  line = "#313335", -- for lines like vertsplit
  green = "#6A8759",
  vibrant_green = "#8FBC8F",
  blue = "#6897BB",
  nord_blue = "#81A1C1",
  yellow = "#FFC66D",
  sun = "#FFCB6B",
  purple = "#9876AA",
  dark_purple = "#BD93F9",
  teal = "#519ABA",
  orange = "#FFB86C",
  cyan = "#89DDFF",
  statusline_bg = "#2B2B2B",
  lightbg = "#3A3A3A",
  pmenu_bg = "#FF79C6",
  folder_bg = "#81A1C1",
}

M.base_16 = {
  base00 = "#2B2B2B",
  base01 = "#313335",
  base02 = "#464646",
  base03 = "#606366",
  base04 = "#707070",
  base05 = "#A9B7C6",
  base06 = "#B0BEC5",
  base07 = "#FFFFFF",
  base08 = "#CC7832",
  base09 = "#FFB86C",
  base0A = "#FFC66D",
  base0B = "#6A8759",
  base0C = "#89DDFF",
  base0D = "#6897BB",
  base0E = "#9876AA",
  base0F = "#FF5555",
}

M.polish_hl = {
  treesitter = {
    ["@comment"] = { fg = M.base_30.grey_fg, italic = true },
    ["@keyword"] = { fg = M.base_30.red, bold = true },
    ["@keyword.function"] = { fg = M.base_30.orange },
    ["@conditional"] = { fg = M.base_30.red, bold = true },
    ["@repeat"] = { fg = M.base_30.red, bold = true },
    ["@function"] = { fg = M.base_30.yellow },
    ["@method"] = { fg = M.base_30.yellow },
    ["@constructor"] = { fg = M.base_30.vibrant_green },
    ["@parameter"] = { fg = M.base_30.orange },
    ["@variable"] = { fg = M.base_30.white },
    ["@variable.builtin"] = { fg = M.base_30.purple, italic = true },
    ["@type"] = { fg = M.base_30.teal },
    ["@type.qualifier"] = { fg = M.base_30.orange },
    ["@constant"] = { fg = M.base_30.orange },
    ["@number"] = { fg = M.base_30.blue },
    ["@boolean"] = { fg = M.base_30.blue },
    ["@string"] = { fg = M.base_30.green },
    ["@character"] = { fg = M.base_30.green },
    ["@attribute"] = { fg = M.base_30.cyan },
    ["@namespace"] = { fg = M.base_30.purple },
    ["@punctuation.delimiter"] = { fg = M.base_30.white },
    ["@punctuation.bracket"] = { fg = M.base_30.orange },
    ["@punctuation.special"] = { fg = M.base_30.cyan },
    ["@tag"] = { fg = M.base_30.blue },
    ["@tag.attribute"] = { fg = M.base_30.orange },
    ["@tag.delimiter"] = { fg = M.base_30.white },
    ["@text"] = { fg = M.base_30.white },
    ["@operator"] = { fg = M.base_30.white },
  },
}

M.type = "dark"

return M
