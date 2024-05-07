local M = {}

function M.fct(fzflua)
  local map = vim.keymap.set
  -- map("n", "<Leader><Leader>", fzflua.files)
  map("n", "'",           fzflua.files)
  map("n", "\"",          fzflua.buffers)
  map("n", "<Leader>h",   fzflua.live_grep_resume)
  map("n", "<Leader>sh",  fzflua.help_tags)
  map("n", "<Leader>sm",  fzflua.keymaps)
  map("n", "<Leader>sl",  fzflua.highlights)
end

return M
