local cmp = require'cmp'
cmp.setup({
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' }
  },
  mapping = cmp.mapping.preset.insert({
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  })
})

