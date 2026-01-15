require("nvim-tree").setup({
  view = {
    width = 30,  --- Ширина панели
  },
  filters = {
    exclude = { ".git", "node_modules", "__pycache__" },  --- Скрываем мусор
        dotfiles=true
  },
})
