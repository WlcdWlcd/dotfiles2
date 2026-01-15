-- Настройка pyright
-- local lspconfig = require("lspconfig")

lsp = vim.lsp.config

lsp.pyright={
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
  on_attach = function(client, bufnr)
    -- Бинды только для Python
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "Go to definition" })
  end,
}

-- Для ruff-lsp (если используете)
lsp.ruff = {
  on_attach = function(client, bufnr)
    -- Отключаем дублирующие возможности с pyright
    client.server_capabilities.hoverProvider = false
    

  end,
}


vim.lsp.enable({ "pyright", "ruff" })
-- Настройка gopls
lsp.gopls = {
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,  --- Показывать неиспользуемые параметры
      },
      staticcheck = true,     --- Включить staticcheck (аналог линтера)
      env = {                 --- Переменные окружения (если нужны)
        GO111MODULE = "on",
        GOPATH = os.getenv("GOPATH"),
      },
    },
  },
  on_attach = function(client, bufnr)
    -- Бинды для Go
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "Go to definition" })
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "Show documentation" })
  end,
}



-- javascript

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "ts_ls" },
})
lsp.ts_ls = {}

