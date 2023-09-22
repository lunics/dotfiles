# Nvim config files in Lua

Real repo location [here](https://git.sr.ht/~lunics/nvim)

*Work in progress*

## Summary
- [Installation](https://git.sr.ht/~lunics/nvim#installation)
- [Plugins](https://git.sr.ht/~lunics/nvim#plugins)
- [Key bindings](https://git.sr.ht/~lunics/nvim#key-bindings)

## Installation

## Plugins
|                                 |                                                       |
|---------------------------------|-------------------------------------------------------|
| nvim-lualine/lualine.nvim       | enable status and buffers line                        |
| akinsho/bufferline.nvim         |                                                       |
| woosaaahh/sj.nvim               | to jump to letters                                    |
| Pocco81/auto-save.nvim          | auto save files                                       |
| nvim-treesitter/nvim-treesitter | color syntax, needed by fzf-lua and telescope         |
| ibhagwan/fzf-lua                | bad, list absolute path with preview hiding file name |
| tpope/vim-commentary            |                                                       |
| tpope/vim-surround              | add characters like "" or {} around patterns          |
| tpope/vim-obsession             |                                                       |

## Key bindings
*leader key = space*

|                   |                                    |
|-------------------|------------------------------------|
| **Normal**        |                                    |
| ctrl w            | close current buffer               |
| q                 | save and quit nvim                 |
| s                 | jump to targeted letter            |
| shift h/l         | go to previous/next buffer         |
| &/é               | go to previous/next buffer (fr)    |
| leader to         | open new tab                       |
| **Normal/Insert** |                                    |
| ctrl j/k          | scroll up/down                     |
| ctrl s            | save current file                  |
| **Insert**        |                                    |
| jk or kj          | esc insert mode to normal mode     |
| **Visual**        |                                    |
| alt j/k           | move text up/down                  |
