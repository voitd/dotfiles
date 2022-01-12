require("commented").setup(
  {
    prefer_block_comment = false,
    keybindings = {n = "gc", v = "gc", nl = "gc"},
    hooks = {
      before_comment = require("ts_context_commentstring.internal").update_commentstring
    }
  }
)
