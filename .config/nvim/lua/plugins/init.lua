local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Базовые плагины
  { "nvim-lua/plenary.nvim" },                    
  { "nvim-tree/nvim-tree.lua" },                  
  { "folke/tokyonight.nvim" },                    
  { "nvim-lualine/lualine.nvim" },                
--  {"smoka7/multicursors.nvim"  }, 
  {"mg979/vim-visual-multi"},
  -- Поиск
  { "nvim-telescope/telescope.nvim" },           
  { "nvim-telescope/telescope-fzf-native.nvim" },

  -- LSP + Автодополнение
  { "neovim/nvim-lspconfig" },                   
  { "williamboman/mason.nvim" },                 
  { "williamboman/mason-lspconfig.nvim" },       
  { "hrsh7th/nvim-cmp" },                        
  { "hrsh7th/cmp-nvim-lsp" },                    
  { "L3MON4D3/LuaSnip" },                        


  { "nvim-treesitter/nvim-treesitter",build = ":TSUpdate" },


  -- themes
  { "folke/tokyonight.nvim" },      
  { "ellisonleao/gruvbox.nvim" },   
  { "rebelot/kanagawa.nvim" },      
  { "navarasu/onedark.nvim" },      
  { "catppuccin/nvim", name = "catppuccin" }, 

  -- Python-специфичные плагины
  { "Vimjas/vim-python-pep8-indent" },            
  { "jeetsukumaran/vim-pythonsense" },            
  { "michaeljsmith/vim-indent-object" },          


  -- javascript
  {"windwp/nvim-ts-autotag"},

  -- Дополнительно
  { "lewis6991/gitsigns.nvim" },                 
  { "akinsho/toggleterm.nvim" },                 
  {  "norcalli/nvim-colorizer.lua" },

    --{ "github/copilot.vim" },
    { "nvim-lua/plenary.nvim", branch = "master"},
    -- { "CopilotC-Nvim/CopilotChat.nvim" },
    --
    --
    --
   
   --{
   --  "CopilotC-Nvim/CopilotChat.nvim",
   --  dependencies = {
   --    { "nvim-lua/plenary.nvim", branch = "master" },
   --  },
   --  build = "make tiktoken",
   --  opts = {
   --    -- See Configuration section for options
   --  },
   --},

    {"RRethy/nvim-base16"},





    {
    "yetone/avante.nvim",
        build = "make",
        dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
}
--}
})
