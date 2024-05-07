-- " start vim-obsession plugin at startup  ## don't need
-- " autocmd VimEnter * Obsession

-- autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o       " Disables automatic commenting on newline:

-- " Runs a script that cleans out tex build files whenever I close out of a .tex file.
-- autocmd VimLeave *.tex !texclear %

-- " Ensure files are read as what I want:
-- let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
-- map <leader>v :VimwikiIndex
-- let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
-- autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
-- autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
-- autocmd BufRead,BufNewFile *.tex set filetype=tex

-- " Save file as sudo on files that require root permission
-- cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

-- " Enable Goyo by default for mutt writting
-- autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=80
-- autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo | set bg=light
-- autocmd BufRead,BufNewFile /tmp/neomutt* map ZZ :Goyo\|x!<CR>
-- autocmd BufRead,BufNewFile /tmp/neomutt* map ZQ :Goyo\|q!<CR>

-- " Automatically deletes all trailing whitespace on save.
-- autocmd BufWritePre * %s/\s\+$//e

-- " When shortcut files are updated, renew bash and ranger configs with new material:
-- autocmd BufWritePost files,directories !shortcuts
-- " Run xrdb whenever Xdefaults or Xresources are updated.
-- autocmd BufWritePost *Xresources,*Xdefaults !xrdb %
-- " Update binds when sxhkdrc is updated.
-- autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- General settings:
--------------------

-- Highlight on yank
augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
  group = 'YankHighlight',
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = '1000' })
  end
})

-- tpope/vim-commentary custom for .hcl and .hcl2 files
autocmd("Filetype", {
  pattern = { 'hcl', 'hcl2' },
  command = "setlocal commentstring=\\#\\ %s"
})

autocmd(
  "BufNewFile", {     -- header template for each new file .sh
    pattern = "*.sh",
    command = ":0r!echo \\\\#\\!/usr/bin/env bash"
  }
)

autocmd(
  "BufNewFile", {     -- header template for each new file .py
    pattern = "*.py",
    command = ":0r!echo \\\\#\\!/usr/bin/env python3"
  }
)

-- Remove whitespace on save
autocmd('BufWritePre', {
  pattern = '',
  command = ":%s/\\s\\+$//e"
})

-- Don't auto commenting new lines
autocmd('BufEnter', {
  pattern = '',
  command = 'set fo-=c fo-=r fo-=o'
})

-- Settings for filetypes:
--------------------------

-- Disable line length marker
augroup('setLineLength', { clear = true })
autocmd('Filetype', {
  group = 'setLineLength',
  pattern = { 'text', 'markdown', 'html', 'xhtml', 'javascript', 'typescript' },
  command = 'setlocal cc=0'
})

-- Set indentation to 2 spaces
augroup('setIndent', { clear = true })
autocmd('Filetype', {
  group = 'setIndent',
  pattern = { 'xml', 'html', 'xhtml', 'css', 'scss', 'javascript', 'typescript',
    'yaml', 'lua'
  },
  command = 'setlocal shiftwidth=2 tabstop=2'
})

-- Terminal settings:
---------------------

-- Open a Terminal on the right tab
autocmd('CmdlineEnter', {
  command = 'command! Term :botright vsplit term://$SHELL'
})

-- Enter insert mode when switching to terminal
autocmd('TermOpen', {
  command = 'setlocal listchars= nonumber norelativenumber nocursorline',
})

autocmd('TermOpen', {
  pattern = '',
  command = 'startinsert'
})

-- Close terminal buffer on process exit
autocmd('BufLeave', {
  pattern = 'term://*',
  command = 'stopinsert'
})
