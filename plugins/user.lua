-- TODO Test

return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  --
  -- {
  --   "sonph/onehalf",
  --   lazy = false,
  --   name = "sonph",
  --   rtp = "vim/",
  --   config = function()
  --     vim.api.nvim_set_option("background", "light")
  --     vim.cmd("colorscheme onehalflight")
  --   end,
  -- },
  --
  -- colorscheme
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
  },
  {
    "lunacookies/vim-colors-xcode",
    lazy = false,
    -- priority = 1000,
    -- config = function()
    -- vim.cmd
    -- end
  },
  {
    "CodeGradox/onehalf-lush",
    lazy = false,
    -- priority = 1000,
    -- config = function()
    -- vim.api.nvim_set_option("background", "light")
    -- vim.cmd "colorscheme onehalf-lush"
    -- end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    event = "User AstroFile",
    cmd = { "TodoQuickFix" },
    keys = {
      { "<leader>fT", "<cmd>TodoTelescope<cr>", desc = "Open TODOs in Telescope" },
    },
  },
}
