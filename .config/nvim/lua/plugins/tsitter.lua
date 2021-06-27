require "nvim-treesitter.configs".setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  -- context_commentstring = {
  --   enable = true,
  --   config = {
  --     vue = {
  --       style_element = "// %s"
  --     }
  --   }
  -- },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true, -- <= THIS LINE is the magic!
    disable = {"vue"}
  },
  indent = {
    enable = true,
    disable = {"vue"}
  }
  -- autotag = {enable = true}
  -- rainbow = {enable = true, extended_mode = true,},-- false will disable the whole extensio
}
