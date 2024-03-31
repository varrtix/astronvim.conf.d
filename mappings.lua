-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
local utils = require "astronvim.utils"
local is_available = utils.is_available

-- first key is the mode
--
-- second key is the lefthand side of the map

-- navigate buffer tabs with `H` and `L`
-- L = {
--   function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
--   desc = "Next buffer",
-- },
-- H = {
--   function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
--   desc = "Previous buffer",
-- },

-- table <i> ==> Insert mode --
-- table <n> ==> Normal mode --
-- table <v> ==> Stay in indent mode --
-- table <t> ==> Terminal --
local maps = { i = {}, n = {}, v = {}, t = {} }

local sections = {
  C_x = { desc = "󰚀 eXtreme" },
  C_c = { desc = "󰘧 Control" },
}

if not vim.g.icons_enabled then vim.tbl_map(function(opts) opts.desc = opts.desc:gsub("^.* ", "") end, sections) end

vim.api.nvim_set_keymap("", "<C-c>", "<Nop>", { noremap = true, silent = true })

-- Normal mode --
maps.n["<C-x>"] = sections.C_x
maps.n["<C-x>c"] = { "<cmd>qa<cr>", desc = "Quit" }

maps.n["<C-c>"] = sections.C_c
-- mappings seen under group name "Buffer"
maps.n["<leader>bD"] = {
  function()
    require("astronvim.utils.status").heirline.buffer_picker(
      function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
    )
  end,
  desc = "Pick to close",
}
-- tables with the `name` key will be registered with which-key if it's installed
-- this is useful for naming menus
maps.n["<leader>b"] = { name = "Buffers" }
-- quick save
-- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
--
-- ["<leader>bg"] = {
--   function() require("rest-nvim").run(true) end,
--   desc = "Run on RestNvim",
-- },

-- Insert mode --

-- Comment --
if is_available "Comment.nvim" then
  local comment_map = { cmd = "<C-c>/", desc = "Toggle comment line" }
  maps.n[comment_map.cmd] = {
    function() require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1) end,
    desc = comment_map.desc,
  }
  maps.v[comment_map.cmd] = {
    "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
    desc = comment_map.desc,
  }
end

-- Terminal --
if is_available "toggleterm.nvim" then
  maps.n["<C-`>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" }
  maps.t["<C-`>"] = maps.n["<C-`>"]
end
-- setting a mapping to false will disable it
-- ["<esc>"] = false,

-- Telescope --
if is_available "telescope.nvim" then
  maps.n["<C-x>?"] = { function() require("telescope.builtin").help_tags() end, desc = "Find help" }
  -- maps.n["<leader>?"]
end

return maps
