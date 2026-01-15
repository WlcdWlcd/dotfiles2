local avante = require("avante")

-- =========================================================
-- MODELS (1 модель = 1 provider)
-- =========================================================
local PROVIDERS = {
  {
    name = "Phi-3 Mini (fast)",
    provider = "lm_phi3",
    model = "phi-3-mini-4k-instruct",
  },
  {
    name = "Phi-2 Q2",
    provider = "lm_phi2_q2",
    model = "phi-2@q2_k",
  },
  {
    name = "Phi-2 Q4",
    provider = "lm_phi2_q4",
    model = "phi-2@q4_k_m",
  },
  {
    name = "Qwen3 4B",
    provider = "lm_qwen3",
    model = "qwen/qwen3-4b-2507",
  },
  {
    name = "Qwen2.5 Coder 14B",
    provider = "lm_qwen_coder",
    model = "qwen/qwen2.5-coder-14b",
  },
  {
    name = "Qwen2.5 VL 7B",
    provider = "lm_qwen_vl",
    model = "qwen/qwen2.5-vl-7b",
  },
  {
    name = "StarCoder2 7B",
    provider = "lm_starcoder2",
    model = "starcoder2-7b",
  },
  {
    name = "Mistral 14B Reasoning",
    provider = "lm_mistral_reason",
    model = "mistralai/ministral-3-14b-reasoning",
  },
}

-- =========================================================
-- CURRENT PROVIDER
-- =========================================================
vim.g.avante_provider = vim.g.avante_provider or PROVIDERS[1].provider

-- =========================================================
-- AVANTE SETUP (ONLY ONCE)
-- =========================================================
avante.setup({
  provider = vim.g.avante_provider,

  system_prompt = [[
Ты ассистент в Neovim.
Отвечай ТОЛЬКО на русском языке.
Пиши технически точно, без воды.
Если вопрос про код — отвечай кратко и по делу.
]],

  providers = {
    -- ===== base provider (LM Studio OpenAI-compatible) =====
    openai = {
      endpoint = "http://192.168.0.113:6767/v1",
      api_key = "lm-studio",
      timeout = 30000,
      extra_request_body = {
        temperature = 0.2,
        max_tokens = 2048,
      },
    },

    -- ===== inherited providers =====
    lm_phi3 = {
      __inherited_from = "openai",
      model = "phi-3-mini-4k-instruct",
    },

    lm_phi2_q2 = {
      __inherited_from = "openai",
      model = "phi-2@q2_k",
    },

    lm_phi2_q4 = {
      __inherited_from = "openai",
      model = "phi-2@q4_k_m",
    },

    lm_qwen3 = {
      __inherited_from = "openai",
      model = "qwen/qwen3-4b-2507",
    },

    lm_qwen_coder = {
      __inherited_from = "openai",
      model = "qwen/qwen2.5-coder-14b",
    },

    lm_qwen_vl = {
      __inherited_from = "openai",
      model = "qwen/qwen2.5-vl-7b",
    },

    lm_starcoder2 = {
      __inherited_from = "openai",
      model = "starcoder2-7b",
    },

    lm_mistral_reason = {
      __inherited_from = "openai",
      model = "mistralai/ministral-3-14b-reasoning",
      extra_request_body = {
        temperature = 0.3,
        max_tokens = 4096,
      },
    },
  },

  behaviour = {
    auto_focus_sidebar = true,
    auto_suggestions = false,
    auto_apply_diff_after_generation = false,
  },

  mappings = {},
})

-- =========================================================
-- PROVIDER SELECTOR
-- =========================================================
local function select_provider()
  vim.ui.select(PROVIDERS, {
    prompt = "Select Avante model",
    format_item = function(item)
      return item.name .. " → " .. item.model
    end,
  }, function(choice)
    if not choice then return end

    vim.g.avante_provider = choice.provider
    vim.cmd("AvanteSwitchProvider " .. choice.provider)

    vim.notify(
      "Avante switched to: " .. choice.name,
      vim.log.levels.INFO
    )
  end)
end

-- =========================================================
-- KEYMAPS
-- =========================================================
vim.keymap.set("n", "<leader>aa", function()
  avante.ask()
end, { desc = "Avante Ask" })


vim.keymap.set("v", "<leader>ae", ":AvanteEdit<CR>", {
  desc = "Avante Edit (selection)",
})

vim.keymap.set("n", "<leader>at", function()
  avante.toggle()
end, { desc = "Avante Toggle" })

vim.keymap.set("n", "<leader>am", select_provider, { desc = "Avante Select Model" })
vim.api.nvim_create_user_command("AvanteModel", select_provider, {})

