if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

return {
  {
    "folke/lazy.nvim",
    opts = {
      git = {
        url_format = string.gsub(
          require("lazy.core.config").defaults.git.url_format,
          "https://github.com/",
          "https://hub.yzuu.cf/"
        ),
      },
    },
  },
}
