vim.lsp.config('ts_ls', {
  cmd = { 'typescript-language-server', '--stdio' },
  filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
  root_markers = { 'pnpm-workspace.yaml', 'package.json', '.git' },
  settings = {
    typescript = {
      inlayHints = {
        includeInlayParameterNameHints = 'all',
        includeInlayReturnTypeHints = true,
        includeInlayVariableTypeHints = true,
      },
    },
    preferences = {
      importModuleSpecifier = 'non-relative',
    },
  },
})
vim.lsp.enable('ts_ls')

vim.lsp.config('eslint', {
  cmd = { 'vscode-eslint-language-server', '--stdio' },
  filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
  root_markers = { 'pnpm-workspace.yaml', '.eslintrc.js', '.eslintrc.json', 'package.json', '.git' },
  settings = {
    workingDirectory = { mode = 'auto' },
  },
})
vim.lsp.enable('eslint')

vim.lsp.config('jsonls', {
  cmd = { 'vscode-json-language-server', '--stdio' },
  filetypes = { 'json', 'jsonc' },
})
vim.lsp.enable('jsonls')

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = { '*.ts', '*.tsx', '*.js', '*.jsx' },
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})
