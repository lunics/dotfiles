-- Disable builtin plugins
local g = vim.g

local disabled_built_ins = {
  "2html_plugin",         -- Do not load tohtml.vim
  "getscript",
  "getscriptPlugin",
  "logipat",

  "gzip",
  "tar",
  "tarPlugin",
  "zip",
  "zipPlugin",
  "vimball",
  "vimballPlugin",

  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",

  "matchit",              -- no need with vim-matchup
  "matchparen",           -- no need with vim-matchup

  "sql_completion",
  "rrhelper",
  "spellfile_plugin",     -- Do not load spell files
  "tutor",
  "rplugin",
  "synmenu",              -- syntax menu
  "optwin",
  "compiler",
  "bugreport",
  "ftplugin",
  "tohtml",
  "remote_plugins",       -- can be disabled if no need of python rtp
  "syntax_completion",    -- Do not load native syntax completion
}

for _, plugin in pairs(disabled_built_ins) do
   g["loaded_" .. plugin] = 1
end

-- disable menu loading
g.did_install_default_menus = 1   -- start with did_install_ instead of loaded_ so can't be in the for loop
g.did_install_syntax_menu = 1
