-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- add more things to the ensure_installed table protecting against community packs modifying it
    -- for _, config in pairs(require("nvim-treesitter.parsers").get_parser_configs()) do
    -- config.install_info.url = string.gsub(config.install_info.url, "https://github.com/", "https://hub.yzuu.cf/")
    -- end

    opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
      "lua",
      "vim",
      -- add more arguments for adding more treesitter parsers
      "c",
      "cpp",
      "ruby",
      "json",
      "toml",
      "vue",
      "bash",
      "go",
      "proto",
    })

    opts.sync_install = false
    opts.auto_install = true
    opts.indent = { enable = true }
    opts.highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    }
  end,
}
