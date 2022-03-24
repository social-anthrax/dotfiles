local map = vim.api.nvim_set_keymap
options =   { noremap = true}

map('n', '<C-p>', ':Telescope lsp_dynamic_workspace_symbols<CR>', options)
map('n', '<C-n>', ':NvimTreeToggle<CR>', options)            -- open/close
