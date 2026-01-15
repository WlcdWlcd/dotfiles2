vim.opt.title = true
vim.opt.titlestring = ""

local SECRET_PATTERNS = {
  "^%.env$",          -- .env
  "^%.env%..+$",      -- .env.local / .env.prod
  "%.pem$",           -- ключи
  "%.key$",           -- приватные ключи
  "%.secret$",        -- любые *.secret
}

local SECRET_TITLE = "SECRET_DATA" 

local function tab_has_secret_env()
  for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
    local buf = vim.api.nvim_win_get_buf(win)
    local name = vim.api.nvim_buf_get_name(buf)
    local filename = vim.fn.fnamemodify(name, ":t")

    for _, pattern in ipairs(SECRET_PATTERNS) do
        if filename:match(pattern) then
            return true
        end
    end
  end
  return false
end

function _G._secret_env_status()
  if vim.g.secret_env_active then
    return " 🔒 SECRET"
  end
  return ""
end

local function update_title()
  local title = "nvim"

  local secret = tab_has_secret_env()
  
  vim.g.secret_env_active = secret
  
if secret then
    title = SECRET_TITLE
  else
    local name = vim.api.nvim_buf_get_name(0)
    if name ~= "" then
      title = "nvim:" .. vim.fn.fnamemodify(name, ":t")
    end
  end
  vim.opt.statusline = "%f %=%{v:lua._secret_env_status()}"
  vim.opt.titlestring = title
end

vim.api.nvim_create_autocmd(
  {
    "BufEnter",
    "BufWinEnter",
    "WinEnter",
    "WinClosed",
    "BufDelete",
    "BufFilePost",
  },
    {callback = update_title}
)


