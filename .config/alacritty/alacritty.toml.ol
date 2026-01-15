# ~/.config/alacritty/alacritty.toml

# ========================================================
# Window
# ========================================================
[window]
padding = { x = 8, y = 8 }
dynamic_padding = true
decorations = "full"
opacity = 0.9
startup_mode = "Windowed"

# ========================================================
# Font
# ========================================================
[font]
normal = { family = "JetBrains Mono", style = "Regular" }
bold   = { family = "JetBrains Mono", style = "Bold" }
italic = { family = "JetBrains Mono", style = "Italic" }
size = 12.0
offset = { x = 0, y = 0 }
glyph_offset = { x = 0, y = 0 }

# ========================================================
# Cursor
# ========================================================
[cursor]
style = "Beam"
#blinking = true

# ========================================================
# Colors (Kanagawa)
# ========================================================
[colors.primary]
background = "#1f1f28"
foreground = "#c8c093"

[colors.normal]
black   = "#16161d"
red     = "#ec5f67"
green   = "#98bb6c"
yellow  = "#fec418"
blue    = "#51afef"
magenta = "#c678dd"
cyan    = "#2ac3de"
white   = "#e0def4"

[colors.bright]
black   = "#65737e"
red     = "#ec5f67"
green   = "#9ece6a"
yellow  = "#f6c177"
blue    = "#51afef"
magenta = "#c678dd"
cyan    = "#2ac3de"
white   = "#eff0eb"

# ========================================================
# Scrolling
# ========================================================
[scrolling]
history = 10000
multiplier = 3

# ========================================================
# Key bindings
# ========================================================
[[key_bindings]]
key = "V"
mods = "Control|Shift"
action = "Paste"

[[key_bindings]]
key = "C"
mods = "Control|Shift"
action = "Copy"

[[key_bindings]]
key = "Return"
mods = "Control|Shift"
action = "SpawnNewInstance"

[[key_bindings]]
key = "PageUp"
mods = "Shift"
action = "ScrollPageUp"

[[key_bindings]]
key = "PageDown"
mods = "Shift"
action = "ScrollPageDown"

[[key_bindings]]
key = "Home"
mods = "Shift"
action = "ScrollToTop"

[[key_bindings]]
key = "End"
mods = "Shift"
action = "ScrollToBottom"

