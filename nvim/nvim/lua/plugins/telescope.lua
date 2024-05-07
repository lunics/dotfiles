-- https://github.com/nvim-telescope/telescope.nvim
-- https://github.com/nvim-telescope/telescope.nvim/wiki/Extension
-- local status_ok, telescope = pcall(require, "telescope")
-- if not status_ok then
--   return
-- end
local telescope = require "telescope"
local actions   = require "telescope.actions"

local setup = {
  defaults = {
    prompt_prefix           = " ",
    selection_caret         = " ",
    entry_prefix            = " ",
    initial_mode            = "insert",
    selection_strategy      = "reset",
	  scroll_strategy         = "limit",
    sorting_strategy        = "ascending",
    layout_strategy         = "vertical",
		results_title           = false,
    file_sorter             = require("telescope.sorters").get_fuzzy_file,
    file_ignore_patterns    = { "node_modules" },
    generic_sorter          = require("telescope.sorters").get_generic_fuzzy_sorter,
		path_display            = { "smart" },     -- smart, absolute, truncate
    dynamic_preview_title   = true,
    winblend                = 0,
    border                  = {},
    borderchars             = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons          = true,
    use_less                = true,
    -- set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    set_env                 = { ["COLORTERM"] = "" },
    file_previewer          = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer          = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer        = require("telescope.previewers").vim_buffer_qflist.new,
    buffer_previewer_maker  = require("telescope.previewers").buffer_previewer_maker,
    layout_config = {
      width          = 0.87,
      height         = 0.80,
    },
    --   horizontal = {
    --     prompt_position = "bottom",
    --     preview_width   = 0.55,
    --     results_width   = 0.8 },
    --   vertical = {
    --     mirror = false },
    --   preview_cutoff = 120,
    -- },
    mappings = {
      i = {
        ["<Esc>"] = actions.close, -- don't go into normal mode, just close
        ["<C-j>"] = actions.move_selection_next, -- scroll the list with <c-j>
        ["<C-k>"] = actions.move_selection_previous, -- scroll the list with <c-k>
        -- ["<C-\\->"] = actions.select_horizontal, -- open selection in new horizantal split
        -- ["<C-\\|>"] = actions.select_vertical, -- open selection in new vertical split
        ["<C-t>"] = actions.select_tab, -- open selection in new tab
        ["<C-y>"] = actions.preview_scrolling_up,
        ["<C-e>"] = actions.preview_scrolling_down,
        ["<C-h>"] = "which_key"
      },
    },
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--trim",
    },
  },
  pickers = {
    find_files = {
      find_command = {
        "fd", "--type", "f", "--hidden", "--strip-cwd-prefix"
      }
    }
  },
  extensions = {
    fzf = {
      fuzzy     = true,
      case_mode = "smart_case",
      override_generic_sorter = true,
      override_file_sorter = true,
    },
  }
}

telescope.setup(setup)
telescope.load_extension("fzf")
-- telescope.load_extension("env")
-- telescope.load_extension("frecency")
-- telescope.load_extension("live_grep_args")
-- telescope.load_extension("neoclip")
-- telescope.load_extension("notify")
-- telescope.load_extension("projects")
-- telescope.load_extension("undo")
require("keymaps.telescope").fct()
