local cmp = require('cmp')

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- Для сниппетов
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(),    -- Ручной вызов
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Подтвердить выбор
    ['<Tab>'] = cmp.mapping.select_next_item(), -- Листать варианты
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },    -- LSP-источник
    { name = 'luasnip' },     -- Сниппеты
    { name = 'buffer' },      -- Текст из буфера
    { name = 'path' },        -- Пути к файлам
  }),
})
