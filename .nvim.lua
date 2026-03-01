-- Project-local LSP config (nvim 0.11+)

vim.lsp.config('ts_ls', {
  cmd = { 'typescript-language-server', '--stdio' },
  filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
  root_markers = { 'package.json', 'tsconfig.json', '.git' },
  settings = {
    typescript = {
      inlayHints = {
        includeInlayParameterNameHints = 'all',
        includeInlayReturnTypeHints = true,
        includeInlayVariableTypeHints = true,
      },
    },
    javascript = {
      inlayHints = {
        includeInlayParameterNameHints = 'all',
        includeInlayReturnTypeHints = true,
      },
    },
  },
})
vim.lsp.enable('ts_ls')

vim.lsp.config('eslint', {
  cmd = { 'vscode-eslint-language-server', '--stdio' },
  filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
  root_markers = { '.eslintrc.js', '.eslintrc.json', '.eslintrc.cjs', 'package.json', '.git' },
})
vim.lsp.enable('eslint')

vim.lsp.config('jsonls', {
  cmd = { 'vscode-json-language-server', '--stdio' },
  filetypes = { 'json', 'jsonc' },
})
vim.lsp.enable('jsonls')

-- Format on save
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = { '*.ts', '*.tsx', '*.js', '*.jsx' },
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

-- Show diagnostics float on cursor hold
vim.api.nvim_create_autocmd('CursorHold', {
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false })
  end,
})

vim.notify('LSP: ts_ls + eslint + jsonls loaded', vim.log.levels.INFO)
