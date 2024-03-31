return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- add more things to the ensure_installed table protecting against community packs modifying it
    opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
      "c",
      "cpp",
      "lua",
      "vim",
      "ruby",
      "json",
      "toml",
      "vue",
      "bash",
      "go",
      "proto",
    })

    -- for _, config in pairs(require("nvim-treesitter.parsers").get_parser_configs()) do
      -- config.install_info.url = string.gsub(config.install_info.url, "https://github.com/", "https://hub.yzuu.cf/")
    -- end

    opts.sync_install = false
    opts.auto_install = true
    opts.indent = { enable = true }
    opts.highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    }
  end,
}
