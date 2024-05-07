local map      = vim.keymap.set
local noremap1 = { noremap = true }
local noremap2 = { noremap = true, silent = true }
local noremap3 = { noremap = true, silent = true, nowait = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- vim.api.nvim_set_keymap("n", " ", "", { noremap = true }) ?
-- vim.api.nvim_set_keymap("x", " ", "", { noremap = true })
map({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })    -- disable space in normal and visual mode
map("n", "<C-k>",       "<C-y>")                 -- scroll up   in normal mode    KO
map("n", "<C-j>",       "<C-e>")                 -- scroll down in normal mode    KO
map("i", "<C-k>",       "<C-x><C-y>", noremap1)  -- scroll up   in insert mode
map("i", "<C-j>",       "<C-x><C-e>", noremap1)  -- scroll dowb in insert mode
map("n", "<PageUp>"  ,  "<C-y>")                 -- PageUp   = scroll up   1 line
map("n", "<PageDown>",  "<C-e>")                 -- PageDown = scroll down 1 line
map("i", "<PageUp>"  ,  "<C-x><C-y>", noremap1)  -- //
map("i", "<PageDown>",  "<C-x><C-e>", noremap1)  -- //
--map("n", "<C-q>",       ":qa <CR>")            -- replaced by simple q
map("i", "<C-q>",       "<Esc> :qa <CR>")
map("n", "<leader>q",   "q")                     -- remap recording @q             KO voir noremap
map("n", "q",           ":qa <CR>")              -- disable default recording key
map("n", "&",           ":bp <CR>")              -- go to previous buffer
map("n", "é",           ":bn <CR>")              -- go to next buffer
map("n", "<C-w>",       ":bd <CR> zz")           -- close buffer
map("i", "<C-w> <Esc>", ":bd <CR> zz")           -- close buffer
map("i", "<Esc>", "<Esc>`^", noremap)            -- prevent the cursor moving back on leaving insert mode
map("n", "<C-o>",       ":tabe# <CR>")           -- reopen previously closed buffer
map("i", "<C-BS>",      "<Esc>cvb")              -- ctrl + backspace = remove word in insert mode
map("n", "U",           ":redo <CR>")            -- shift U = redo
map({'i','n','v'}, "<Up>"   , "<Nop>", noremap1) -- disable Up arrow in all modes
map({'i','n','v'}, "<Down>" , "<Nop>", noremap1) -- //
map({'i','n','v'}, "<Left>" , "<Nop>", noremap1) -- //
map({'i','n','v'}, "<Right>", "<Nop>", noremap1) -- //

-- KO
-- vim.keymap.del({"n", "i"}, '<C-z>')
-- vim.keymap.del({"n", "i"}, '<C-p>')
-- vim.keymap.del("n", '<S-j>')  -- disable shift j
-- vim.keymap.del("n", '<S-k>')  -- disable shitt k
map({"n", "i"}, "<C-z>", "<Nop>", noremap)  -- disable ctrl z
map({"n"}, "<C-p>", "<Nop>", noremap)       -- disable ctrl p
map("n", "<S-j>", "<Nop>", noremap)         -- disable shift j
map("n", "<S-k>", "<Nop>", noremap)         -- disable shift k

map("n", "<S-l>", ":bnext<CR>")            -- shift l = next buffer
map("n", "<S-h>", ":bprevious<CR>")        -- shift h = previous buffer

-- Remap for dealing with word wrap
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

---- Move text up and down
--map("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
--map("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

map("i", "jk", "<ESC>")                     -- press jk fast to exit insert mode
map("i", "kj", "<ESC>")                     -- press kj fast to exit insert mode

map("n", "<leader>nh", ":nohl<CR>")         -- clear search highlights
map("n", "x", '"_x')                        -- delete single character without copying into register
map("n", "<leader>+", "<C-a>")              -- increment
map("n", "<leader>-", "<C-x>")              -- decrement

-- window management
map("n", "<leader>sv", "<C-w>v")            -- split window vertically
map("n", "<leader>sh", "<C-w>s")            -- split window horizontally
map("n", "<leader>se", "<C-w>=")            -- make split windows equal width & height
map("n", "<leader>sx", ":close<CR>")        -- close current split window

-- tab management
map("n", "<leader>to", ":tabnew<CR>")       -- open new tab
map("n", "<leader>tx", ":tabclose<CR>")     -- close current tab
map("n", "<leader>tn", ":tabn<CR>")         -- go to next tab
map("n", "<leader>tp", ":tabp<CR>")         -- go to previous tab

-- Visual --
map("v", "<", "<gv")   -- Stay in indent mode ?
map("v", ">", ">gv")   -- ?

-- Move text up and down
map("v", "<A-j>", ":m .+1<CR>==")
map("v", "<A-k>", ":m .-2<CR>==")
map("v", "p", '"_dP')

-- Visual Block --
map("x", "J", ":move '>+1<CR>gv-gv", opts)   -- Move text down
map("x", "K", ":move '<-2<CR>gv-gv", opts)   -- Move text up
map("x", "<A-j>", ":move '>+1<CR>gv-gv", opts) -- ?
map("x", "<A-k>", ":move '<-2<CR>gv-gv", opts) -- ?

-- Terminal --
---- Better terminal navigation
-- map("t", "<C-h>", "<C-\\><C-N><C-w>h")
-- map("t", "<C-j>", "<C-\\><C-N><C-w>j")
-- map("t", "<C-k>", "<C-\\><C-N><C-w>k")
-- map("t", "<C-l>", "<C-\\><C-N><C-w>l")


-- TODO
-- Normal mode
-- Source current file
-- map("n", "<C-o>", "<cmd>so %<cr>", { noremap = true })   -- ## already mapped
-- Save in normal mode
map("n", "<C-s>", "<cmd>write<cr>", { noremap = true })
-- Force save for files need sudo
map("n", "<C-S-s>", "<cmd>execute 'silent! write !sudo tee % >/dev/null' <bar> edit!<cr>", { noremap = true })
-- Increment/decrement
map("n", "+", "<C-a>", opts)
map("n", "-", "<C-x>", opts)
-- Select all
map("n", "<C-a>", "gg<S-v>G", opts)

--- Buffer keymap (A buffer is in-memory text of a file.)
-- Move one buffer(window) right
-- map("n", "<C-L>", "<C-W><C-L>", opts)
-- Move one buffer(window) left
-- map("n", "<C-H>", "<C-W><C-H>", opts)
-- Move one buffer(window) up
-- map("n", "<C-K>", "<C-W><C-K>", opts)
-- Move one buffer(window) down
-- map("n", "<C-J>", "<C-W><C-J>", opts)

--- Window keymap (A windows is a viewport on a buffer.)
-- map("n", "<C-j>", "<C-w>j", opts) -- to bottom window
-- map("n", "<C-k>", "<C-w>k", opts) -- to top window
-- map("n", "<C-h>", "<C-w>h", opts) -- to left window
-- map("n", "<C-l>", "<C-w>l", opts) -- to right window

--- Tab keymap (A tab page is a collection of windows.)
-- Create a new tab
map("n", "tn", "<cmd>tabnew<cr>", opts)
-- Move to next tab
map("n", "tk", "<cmd>tabnext<cr>", opts)
-- Move to previous tab
map("n", "tj", "<cmd>tabprevious<cr>", opts)
-- Only keep current tab
map("n", "to", "<cmd>tabonly<cr>", opts)

-- NOTE: Keep things in paste register after paste it when visual selecting things to replace.
-- useful keymaps to replace text after copying thing, @ThePrimeagen
map("x", "<leader><leader>p", '"_dP', opts)
map("n", "x", '"_x', opts)
map("n", "X", '"_X', opts)

-- Move selected lines Up/Down with auto-indent, @ThePrimeagen
map("v", "J", ":m '>+1<cr>gv=gv")
map("v", "K", ":m '<-2<cr>gv=gv")

-- Keep cursor inplace if below line being append to current line when moving, @ThePrimeagen
map("n", "J", "mzJ`z")

-- Do nothing when press "Q", @ThePrimeagen
map("n", "Q", "<nop>")

-- start replacment mode of current word, @ThePrimeagen
map("n", "<leader><leader>s", "<cmd>%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- chmod +x current file, @ThePrimeagen
map("n", "<leader><leader>x", "<cmd>!chmod +x %<cr>")

-- Save in insert mode
map("i", "<C-s>", "<esc>:w<cr>", {})

-- Blink cursor
local timer = vim.loop.new_timer()
local blink = function()
	local cnt, blink_times = 0, 8

	timer:start(
		0,
		100,
		vim.schedule_wrap(function()
			vim.cmd("set cursorcolumn! cursorline!")

			cnt = cnt + 1
			if cnt == blink_times then
				timer:stop()
			end
		end)
	)
end
map("n", "<leader>cb", blink)

-- Make Ascii art font
map("n", "<leader>aA", "<cmd>.!toilet -w 200 -f standard<cr>", opts)
map("n", "<leader>aa", "<cmd>.!toilet -w 200 -f small<cr>", opts)
-- Make Ascii border
map("n", "<leader>ab", "<cmd>.!toilet -f term -F border<cr>", opts)
-- ┌────┐
-- │test│
-- └────┘

-- search and highlight
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)
map("n", "*", "*zzzv", opts)
map("n", "#", "#zzzv", opts)
map("n", "<esc>", "<cmd>noh<cr>", opts)





--------------------------
------ Plugin Keybinds
--------------------------

------ vim-maximizer
----keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

------ nvim-tree
----keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer

------ telescope
----keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
----keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
----keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
----keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
----keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

------ telescope git commands (not on youtube nvim video)
----keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
----keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
----keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
----keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

------ restart lsp server (not on youtube nvim video)
----keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary
