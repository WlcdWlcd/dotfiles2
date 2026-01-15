require("nvim-treesitter.configs").setup({
  -- Основная фича: подсветка
  highlight = {
    enable = true,
    disable = {},  -- Не отключаем ни для каких языков
    additional_vim_regex_highlighting = false,  -- КРИТИЧНО: выключаем старую подсветку Vim
  },

  -- Автоустановка парсеров
  ensure_installed = {
    "python", "lua", "go", "javascript", "typescript",
    "bash", "json", "yaml", "markdown", "vim", "vimdoc"
  },

  -- Дополнительные фичи
  indent = { enable = true },          -- Умные отступы
  incremental_selection = { enable = true }, -- Постепенное выделение кода
  autotag = { enable = true }
})


