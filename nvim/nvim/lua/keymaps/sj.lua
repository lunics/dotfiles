local M = {}

function M.fct(sj)
  local map = vim.keymap.set
  map({ 'n', 'o', 'x' }, 's',         sj.run)
  map({ 'n', 'o', 'x' }, "<A-,>",     sj.prev_match)
  map({ 'n', 'o', 'x' }, "<A-;>",     sj.next_match)
  map({ 'n', 'o', 'x' }, "<leader>s", sj.redo)
end

return M
