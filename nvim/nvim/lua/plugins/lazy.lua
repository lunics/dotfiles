local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end

vim.opt.runtimepath:prepend(lazypath)

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, 'lazy')
if not status_ok then
  return
end

lazy.setup(
  require "plugins.list",
  {
    defaults         = { lazy        = false },
    install          = { colorscheme = { "tokyonight" } },
    checker          = {
      enabled     = false,  -- true= display permanent message at startup (Plugin Updates...)
      concurrency = nil,    -- set to 1 to check for updates very slowly
      notify      = true,   -- get a notification when new updates are found
      frequency   = 3600,   -- check for updates every hour
    },
    change_detection = {
      enabled = false,
      notify  = false
    },
    debug            = true
  }
)

local viewConfig = require("lazy.view.config")
viewConfig.keys.details = 'o'               -- enable o key when lazy menu is up to show details
viewConfig.commands.build.key_plugin = 'r'  -- // k
