local lsp = vim.lsp
local lspconfig = require "lspconfig"

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true


local on_attach = function(client)
    -- require'completion'.on_attach(client)
    print("'" .. client.name .. "' server attached")
end
-- lspconfig.tsserver.setup{on_attach = on_attach, capabilities = capabilities}
lspconfig.tsserver.setup {
    on_attach = on_attach,
    capabilities = {
        textDocument = {
            completion = {
                completionItem = {
                    snippetSupport = true
                }
            }
        }
    }
}

