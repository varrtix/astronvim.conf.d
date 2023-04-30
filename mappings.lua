local utils = require "astronvim.utils"
local is_available = utils.is_available

-- table <i> ==> Insert mode --
-- table <n> ==> Normal mode --
-- table <v> ==> Stay in indent mode --
-- table <t> ==> Terminal --
local maps = { i = {}, n = {}, v = {}, t = {} }

local sections = {
  C_x = { desc = "󰚀 Control" }
}

if not vim.g.icons_enabled then vim.tbl_map(function(opts) opts.desc = opts.desc:gsub("^.* ", "") end, sections) end

-- Normal mode --
maps.n["<C-x>"] = sections.C_x

-- Terminal --
if is_available "toggleterm.nvim" then
  maps.n["<C-`>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" }
  maps.t["<C-`>"] = maps.n["<C-`>"]
end

return maps
