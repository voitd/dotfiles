require'rooter'.setup {
    echo = false,
    patterns = { -- the patterns to find
      '.git',    -- same as patterns passed to nvim_lsp.util.root_pattern(patterns...)
      'package.json',
    },
    non_project_files = "current"
  }
