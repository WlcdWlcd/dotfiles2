-- generated.lua
-- Safe override: UI only, syntax comes from theme

local c = {
  bg      = '{{colors.background.default.hex}}',
  fg      = '{{colors.on_surface.default.hex}}',

  surface = '{{colors.surface_container_low.default.hex}}',
  overlay = '{{colors.surface_container.default.hex}}',

  border  = '{{colors.outline_variant.default.hex}}',
  muted   = '{{colors.on_surface_variant.default.hex}}',

  accent  = '{{colors.primary.default.hex}}',
  error   = '{{colors.error.default.hex}}',
}

local hl = function(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- ===============================
-- Base UI
-- ===============================
hl('Normal',       { bg = c.bg, fg = c.fg })
hl('NormalFloat',  { bg = c.surface, fg = c.fg })
hl('FloatBorder',  { fg = c.border, bg = c.surface })

hl('CursorLine',   { bg = c.overlay })
hl('CursorLineNr', { fg = c.accent, bold = true })

hl('LineNr',       { fg = c.muted })

hl('Visual',       { bg = c.overlay })
hl('Search',       { bg = c.accent, fg = c.bg })
hl('IncSearch',    { bg = c.accent, fg = c.bg, bold = true })

-- ===============================
-- Statusline / splits
-- ===============================
hl('StatusLine',   { bg = c.surface, fg = c.fg })
hl('StatusLineNC', { bg = c.surface, fg = c.muted })
hl('VertSplit',    { fg = c.border })

-- ===============================
-- Diagnostics (не синтаксис)
-- ===============================
hl('DiagnosticError', { fg = c.error })
hl('DiagnosticWarn',  { fg = c.accent })
hl('DiagnosticInfo',  { fg = c.accent })
hl('DiagnosticHint',  { fg = c.muted })

-- ===============================
-- Treesitter LINKS (важно)
-- ===============================
local links = {
  '@keyword',
  '@type',
  '@function',
  '@method',
  '@string',
  '@number',
  '@boolean',
  '@operator',
  '@variable',
  '@constant',
  '@comment',
}

for _, group in ipairs(links) do
  vim.api.nvim_set_hl(0, group, { link = group:gsub('@', '') })
end

