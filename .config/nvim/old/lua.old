return {
  -- Менеджер плагинов
  {
    "folke/lazy.nvim",
    priority = 1000,
  },

  -- Цветовая схема
  { 
    "catppuccin/nvim", 
    name = "catppuccin",
    config = function()
      vim.cmd.colorscheme("catppuccin-mocha")
    end
  },

  -- Файловый менеджер
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup()
      vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>')
    end
  },

  -- Автодополнение (LSP + snippets)
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
    },
    config = function()
      -- Конфиг CMP (допишите под свои нужды)
    end
  },

  -- LSP (языковые серверы)
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("lspconfig").pyright.setup{}  -- Пример для Python
    end
  },

  -- Подсветка синтаксиса
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  }
}
