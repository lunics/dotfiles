local M = {}

function M.fct()
  local builtin = require('telescope.builtin')
  local map     = vim.keymap.set
  map('n', '<leader>ff', builtin.find_files)
  map('n', '<leader>fg', builtin.live_grep)
  map('n', '<leader>fb', builtin.buffers)
  map('n', '<leader>fh', builtin.help_tags)
  map("n", "<leader>fs", builtin.git_files)
  map("n", "<leader>fo", builtin.oldfiles)
  -- map("n", "<leader>fn", "<cmd>Telescope node_modules list<cr>")
  -- map("n", "<leader>fr", "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>")
end

return M
