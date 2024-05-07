-- https://github.com/vim-airline/vim-airline
local status_ok, vimairline = pcall(require, "vim-airline")
if not status_ok then
  print("vim-airline not loaded, return : "..tostring(status_ok))
  return
end

local tabline = vim.g.airline.extensions.tabline()

local setup = {
  tabline = {
    enabled           = 1,    -- enable airline tabline
    show_close_button = 0,    -- remove 'X' at the end of the tabline
    tabs_label        = {},   -- can put text here like BUFFERS to denote buffers (I clear it so nothing is shown)
    buffers_label     = {},   -- can put text here like TABS to denote tabs (I clear it so nothing is shown)
    fnamemod          = ":t", -- disable file paths in the tab
    show_tab_count    = 0,    -- dont show tab numbers on the right
    show_buffers      = 1,    -- dont show buffers in the tabline
    tab_min_count     = 1,    -- minimum of 1 tabs needed to display the tabline
    show_splits       = 0,    -- disables the buffer name that displays on the right of the tabline
    show_tab_nr       = 0,    -- disable tab numbers
    show_tab_type     = 0     -- disables the weird ornage arrow on the tabline
  }
}

vimairline.setup(setup)
vim.g.airline_enabled(0)      -- disable vim-airline status line
