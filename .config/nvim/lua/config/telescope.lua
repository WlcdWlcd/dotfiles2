local telescope = require("telescope")
telescope.setup({
  defaults = {
    file_ignore_patterns = { "venv", "__pycache__" },  --- Игнорируем папки Python
  },
})

-- Подключение fzf для ускорения поиска
---telescope.load_extension("fzf")
