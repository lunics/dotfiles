-- https://github.com/ibhagwan/fzf-lua
-- https://github.com/ibhagwan/fzf-lua#customization
-- https://github.com/ibhagwan/fzf-lua/wiki/Advanced

local fzflua  = require "fzf-lua"
local actions = require "fzf-lua.actions"

local setup = {
  winopts = {
    fullscreen  = false,
    height      = 0.6,
    width       = 1,
    row         = 1,
    border      = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },   -- 'none', 'single', 'double', 'thicc' or 'rounded' (default)
    preview = {
      layout      = "horizontal",
      title       = false,
      delay       = 0,
      scrollbar   = false,
      scrollchars = { "▎", "" },
    },
  },
  keymap = {
    builtin = {},
    fzf = {
      -- ["tab"] = "down",
      -- ["btab"] = "up",
      ["ctrl-e"] = "preview-page-down",
      ["ctrl-u"] = "preview-page-up",
    },
  },
  -- actions = {
  --   files = {
  --     ["default"] = actions.file_edit,
  --   },
  --   buffers = {
  --     ["default"] = actions.buf_edit,
  --   },
  -- },
  files = {
    previewer     = "builtin",      -- false, bat (no colors)
    prompt        = " ",
    multiprocess  = true,       -- run command in a separate process
    git_icons     = false,      -- show git icons?
    file_icons    = false,      -- show file icons?
    color_icons   = true,       -- colorize file|git icons
    path_shorten  = 1,          -- 'true' or number, shorten path?
    cmd           = "/usr/bin/find ~/cloud -type f",   -- if commented auto-detect prioritizes `fd`:`rg`:`find`
    -- find_opts     = [[-type f -not -path '*/\.git/*' -printf '%P\n']],
    rg_opts       = "--color=never --files --hidden --follow -g '!.git'",
    fd_opts       = "--color=never --type f --hidden --follow --exclude .git",
    -- by default, cwd appears in the header only if {opts} contain a cwd
    -- parameter to a different folder than the current working directory
    -- uncomment if you wish to force display of the cwd as part of the
    -- query prompt string (fzf.vim style), header line or both
    -- show_cwd_prompt = true,
    -- show_cwd_header = true,
    -- fzf_opts = {}
    actions = {
      ["default"]     = actions.file_edit,
      ["ctrl-y"]      = function(selected) print(selected[1]) end,
    },
  },
  buffers = {
    previewer       = "builtin",    -- disable the builtin previewer?
    prompt          = "  ",
    file_icons      = false,        -- show file icons?
    color_icons     = true,         -- colorize file|git icons
    sort_lastused   = true,         -- sort buffers() by last used
    ignore_current_buffer = true,
    fzf_opts = {
      ["--tiebreak"] = "index",
      ['--layout']   = 'reverse-list',
      -- ['--border'] = false,
      -- ['--delimiter'] = ':',
      -- ['--preview'] = vim.fn.shellescape("cat {}"),
      -- ['--preview-window'] = 'nohidden,down,60%,border-top,+{3}+3/3,~3',
    },
    actions = {
      ["default"]   = actions.buf_edit,
      ["ctrl-s"]    = actions.buf_split,
      ["ctrl-v"]    = actions.buf_vsplit,
      ["ctrl-t"]    = actions.buf_tabedit,
      ["ctrl-x"]    = actions.buf_del,
    }
  },
  previewers = {
    cat = {
      cmd             = "cat",
      args            = "--number",
    },
    bat = {
      cmd             = "bat",
      args            = "--style=numbers,changes --color always",
      theme           = 'Coldark-Dark', -- bat preview theme (bat --list-themes)
      config          = nil,            -- nil uses $BAT_CONFIG_PATH
    },
    head = {
      cmd             = "head",
      args            = nil,
    },
    git_diff = {
      cmd_deleted     = "git diff --color HEAD --",
      cmd_modified    = "git diff --color HEAD",
      cmd_untracked   = "git diff --color --no-index /dev/null",
      -- uncomment if you wish to use git-delta as pager
      -- can also be set under 'git.status.preview_pager'
      -- pager        = "delta --width=$FZF_PREVIEW_COLUMNS",
    },
    man = {
      -- NOTE: remove the `-c` flag when using man-db
      -- replace with `man -P cat %s | col -bx` on OSX
      cmd             = "man -c %s | col -bx",
    },
    builtin = {
      syntax          = true,         -- preview syntax highlight?
      syntax_limit_l  = 0,            -- syntax limit (lines), 0=nolimit
      syntax_limit_b  = 1024*1024,    -- syntax limit (bytes), 0=nolimit
      limit_b         = 1024*1024*10, -- preview limit (bytes), 0=nolimit
      -- previewer treesitter options:
      -- enable specific filetypes with: `{ enable = { "lua" } }
      -- exclude specific filetypes with: `{ disable = { "lua" } }
      -- disable fully with: `{ enable = false }`
      treesitter      = { enable = true, disable = {} },
      -- By default, the main window dimensions are calculted as if the
      -- preview is visible, when hidden the main window will extend to
      -- full size. Set the below to "extend" to prevent the main window
      -- from being modified when toggling the preview.
      toggle_behavior = "default",
      -- preview extensions using a custom shell command:
      -- for example, use `viu` for image previews
      -- will do nothing if `viu` isn't executable
      extensions      = {
        -- neovim terminal only supports `viu` block output
        ["png"]       = { "viu", "-b" },
        ["svg"]       = { "chafa" },
        ["jpg"]       = { "ueberzug" },
      },
      -- if using `ueberzug` in the above extensions map
      -- set the default image scaler, possible scalers:
      --   false (none), "crop", "distort", "fit_contain",
      --   "contain", "forced_cover", "cover"
      -- https://github.com/seebye/ueberzug
      ueberzug_scaler = "cover",
    },
  },
}

fzflua.setup(setup)
require("keymaps.fzf-lua").fct(fzflua)
