-- Project-local LSP config for pnpm monorepo (nvim 0.11+)

vim.lsp.config('ts_ls', {
  cmd = { 'typescript-language-server', '--stdio' },
  filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
  -- In a monorepo, root at the workspace root (where pnpm-workspace.yaml lives)
  root_markers = { 'pnpm-workspace.yaml', 'package.json', '.git' },
  settings = {
    typescript = {
      inlayHints = {
        includeInlayParameterNameHints = 'all',
        includeInlayReturnTypeHints = true,
        includeInlayVariableTypeHints = true,
      },
    },
    -- Helps ts_ls find packages across workspace packages
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
    -- Look for eslint config at workspace root
    workingDirectory = { mode = 'auto' },
  },
})
vim.lsp.enable('eslint')

vim.lsp.config('jsonls', {
  cmd = { 'vscode-json-language-server', '--stdio' },
  filetypes = { 'json', 'jsonc' },
  settings = {
    json = {
      -- Validate package.json files
      schemas = {
        { fileMatch = { 'package.json' }, url = 'https://json.schemastore.org/package.json' },
        { fileMatch = { 'tsconfig.json', 'tsconfig.*.json' }, url = 'https://json.schemastore.org/tsconfig.json' },
      },
    },
  },
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

vim.notify('LSP: ts_ls (monorepo) + eslint + jsonls loaded', vim.log.levels.INFO)
