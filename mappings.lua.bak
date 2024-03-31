local utils = require "astronvim.utils"
local is_available = utils.is_available

-- table <i> ==> Insert mode --
-- table <n> ==> Normal mode --
-- table <v> ==> Stay in indent mode --
-- table <t> ==> Terminal --
local maps = { i = {}, n = {}, v = {}, t = {} }

local sections = {
  C_x = { desc = "󰚀 eXtreme" },
  C_c = { desc = "󰘧 Control" }
}

if not vim.g.icons_enabled then vim.tbl_map(function(opts) opts.desc = opts.desc:gsub("^.* ", "") end, sections) end

vim.api.nvim_set_keymap('', '<C-c>', '<Nop>', { noremap = true, silent = true })

-- Normal mode --
maps.n["<C-x>"] = sections.C_x
maps.n["<C-x>c"] = { "<cmd>qa<cr>", desc = "Quit" }

maps.n["<C-c>"] = sections.C_c

-- Insert mode --


-- Comment --
if is_available "Comment.nvim" then
  local comment_map = { cmd = "<C-c>/", desc = "Toggle comment line" }
  maps.n[comment_map.cmd] = {
    function() require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1) end,
    desc = comment_map.desc
  }
  maps.v[comment_map.cmd] = {
    "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
    desc = comment_map.desc
  }
end

-- Terminal --
if is_available "toggleterm.nvim" then
  maps.n["<C-`>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" }
  maps.t["<C-`>"] = maps.n["<C-`>"]
end

-- Telescope --
if is_available "telescope.nvim" then
  maps.n["<C-x>?"] = { function() require("telescope.builtin").help_tags() end, desc = "Find help" }
  -- maps.n["<leader>?"]
end

return maps
