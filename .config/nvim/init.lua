-- Загрузка lazy.nvim
require("plugins.init")

-- Базовые настройки
require("core.options")
require("core.keymaps")
require("core.autocmds")
require("core.secret-env")

-- Настройки плагинов
require("config.telescope")
require("config.nvim-tree")
require("config.toggleterm")
require("config.lsp")
require("config.py_completes")
require("config.tree-sitter")
require("config.Avante")
-- require("config.multicursor")
--require("plugins.CopilotChat")
-- ... остальные конфиги

--require("scripts.source_matugen")
