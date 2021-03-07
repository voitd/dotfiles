local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

local on_attach = function(client, server)
  -- require'completion'.on_attach(client)
  -- let efm server handles linting and formatting stuff
  if server == "efm" then
    client.resolved_capabilities.document_formatting = true
  else
    client.resolved_capabilities.document_formatting = false
  end

  -- client.resolved_capabilities.document_formatting = true
  print("'" .. client.name .. "' server attached")
end

lspconfig.vuels.setup {
  on_attach = on_attach,
  filetypes = {"vue"},
  root_dir = lspconfig.util.root_pattern("package.json", "vue.config.js"),
  init_options = {
    config = {
      css = {},
      emmet = {},
      html = {
        suggest = {}
      },
      javascript = {
        format = {}
      },
      stylusSupremacy = {},
      typescript = {
        format = {}
      },
      vetur = {
        completion = {
          autoImport = true,
          tagCasing = "kebab"
          -- useScaffoldSnippets = false,
          -- scaffoldSnippetSource = ""
        },
        -- format = {
        --   defaultFormatter = {
        --     html = "prettier",
        --     pug = "prettier",
        --     css = "none",
        --     postcss = "prettier",
        --     scss = "prettier",
        --     less = "prettier",
        --     stylus = "stylus-supremacy",
        --     js = "prettier",
        --     ts = "prettier",
        --     sass = "sass-formatter"
        --   }
        -- },
        validation = {
          template = true,
          style = true,
          script = true,
          templateProps = true
        }
      }
    }
  }
}
