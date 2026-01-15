vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    -- Меняем ТОЛЬКО фон
    vim.api.nvim_set_hl(0, 'Normal', { bg = '{{colors.background.default.hex}}' })

    vim.api.nvim_set_hl(0, 'CursorLine', {
      bg = '{{colors.surface_container_low.default.hex}}',
    })

    vim.api.nvim_set_hl(0, 'Visual', {
      bg = '{{colors.surface_container.default.hex}}',
    })

    vim.api.nvim_set_hl(0, 'NormalFloat', {
      bg = '{{colors.surface_container.default.hex}}',
    })

    vim.api.nvim_set_hl(0, 'FloatBorder', {
      bg = '{{colors.surface_container.default.hex}}',
      fg = '{{colors.outline_variant.default.hex}}',
    })
  end,
})

