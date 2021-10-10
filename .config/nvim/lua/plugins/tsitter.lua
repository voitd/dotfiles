require "nvim-treesitter.configs".setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  --  context_commentstring = {
  --  enable = true,
  --  enable_autocmd = true
  --  },
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = true -- <= THIS LINE is the magic!

    -- disable = {"vue", "js", "jsx"}
  },
  indent = {
    enable = true
    -- disable = {"vue"}
  },
  autotag = {enable = true}
  -- rainbow = {enable = true, extended_mode = true,},-- false will disable the whole extensio
  --  matchup = {
  --  enable = true,              -- mandatory, false will disable the whole extension
  --  },
}
