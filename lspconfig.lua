function on_attach(client, bufnr)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
  vim.keymap.set("n", "<Space>gd", vim.lsp.buf.definition, { buffer = bufnr })
  vim.keymap.set("n", "<Space>gr", require("telescope.builtin").lsp_references, { buffer = bufnr })
  vim.keymap.set("n", "<Space>gi", vim.lsp.buf.implementation, { buffer = bufnr })
  vim.keymap.set("n", "<Space>ca", vim.lsp.buf.code_action, { buffer = bufnr })
  vim.keymap.set("n", "<Space>rn", vim.lsp.buf.rename, { buffer = bufnr })
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig").lua_ls.setup { on_attach = on_attach, capabilities = capabilities }
require("lspconfig").clangd.setup { on_attach = on_attach, capabilities = capabilities }
require("lspconfig").pyright.setup { on_attach = on_attach, capabilities = capabilities }
require("lspconfig").cssls.setup { on_attach = on_attach, capabilities = capabilities }
require("lspconfig").tsserver.setup { on_attach = on_attach, capabilities = capabilities }
require("lspconfig").bashls.setup { on_attach = on_attach, capabilities = capabilities }
require("lspconfig").rust_analyzer.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    ["rust-analyzer"] = {
      checkOnSave = {
        command = "clippy"
      }
    }
  }
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    -- Enable update diagnostics in insert mode
    update_in_insert = true,
  }
)

local signs = {
  Error = "",
  Warn = "",
  Hint = "",
  Info = "ℹ️"
}

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
