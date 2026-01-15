local map = vim.keymap.set

----- Telescope
---map("n", "<Leader>ff", "<cmd>Telescope find_files<cr>")
---map("n", "<Leader>fg", "<cmd>Telescope live_grep<cr>")
---
---
----- LSP
---map("n", "gd", vim.lsp.buf.definition) -- Переход к определению
---map("n", "K", vim.lsp.buf.hover)       -- Документация


-- NvimTree
map("n", "<Leader>e", "<cmd>NvimTreeToggle<cr>")


-- LSP
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Show documentation' })
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code action' })
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Rename symbol' })


vim.keymap.set('n', '<Leader>d', vim.diagnostic.open_float, { desc = 'Показать ошибку под курсором' })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Предыдущая ошибка' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Следующая ошибка' })
vim.keymap.set('n', '<Leader>q', vim.diagnostic.setloclist, { desc = 'Показать все ошибки' })

-- Основные
vim.keymap.set("n", "<Leader>gi", "<cmd>GoImport<cr>", { desc = "Optimize imports" })
vim.keymap.set("n", "<Leader>gt", "<cmd>GoTest<cr>", { desc = "Run tests" })
vim.keymap.set("n", "<Leader>gd", "<cmd>GoDebug<cr>", { desc = "Debug" })



-- Telescope
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { desc = 'Find files' })
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { desc = 'Find text' })
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { desc = 'Find buffers' })

-- Git
vim.keymap.set('n', ']c', '<cmd>Gitsigns next_hunk<cr>', { desc = 'Next git change' })
vim.keymap.set('n', '[c', '<cmd>Gitsigns prev_hunk<cr>', { desc = 'Prev git change' })
vim.keymap.set('n', '<leader>gb', '<cmd>Gitsigns blame_line<cr>', { desc = 'Git blame' })

-- ToggleTerm
vim.keymap.set('n', '<C-\\>', '<cmd>ToggleTerm<cr>', { desc = 'Toggle terminal' })

-- Snippets (настройка в cmp.lua)
local luasnip = require('luasnip')
local cmp = require('cmp')
cmp.setup({
  mapping = {
    ['<Tab>'] = cmp.mapping(function(fallback)
      if luasnip.expandable() then
        luasnip.expand()
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
})


vim.keymap.set({'n', 'x'}, '<C-d>', '<Plug>(VM-Find-Under)', {remap = true})
