vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    -- Меняем ТОЛЬКО фон
    vim.api.nvim_set_hl(0, 'Normal', { bg = '#171216' })

    vim.api.nvim_set_hl(0, 'CursorLine', {
      bg = '#201a1e',
    })

    vim.api.nvim_set_hl(0, 'Visual', {
      bg = '#241e22',
    })

    vim.api.nvim_set_hl(0, 'NormalFloat', {
      bg = '#241e22',
    })

    vim.api.nvim_set_hl(0, 'FloatBorder', {
      bg = '#241e22',
      fg = '#4e444b',
    })
  end,
})

