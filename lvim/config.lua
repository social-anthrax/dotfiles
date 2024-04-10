-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
--

-- Keymapping
lvim.lsp.buffer_mappings.normal_mode['gh'] = lvim.lsp.buffer_mappings.normal_mode['gs']

-- Behaviour
lvim.format_on_save.enabled = true
lvim.builtin.which_key.mappings["e"] = { ":NvimTreeFocus<CR>", "Explorer" }

-- Linters
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    name = "clang_format",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespace
    -- options such as `--line-width 80` become either `{"--line-width", "80"}` or `{"--line-width=80"}`
    ---@usage only start in these filetypes, by default it will attach to all filetypes it supports
    filetypes = { "c", "cpp" },
  },
}


-- Plugins
lvim.plugins = {
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {}
  },
}
