-- set colorscheme to nightfly with protected call in case it isn't installed
local status, _ = pcall(vim.cmd, "colorscheme nightfly")
if not status then
  -- print("Colorscheme not found!") -- print error if colorscheme not installed
  return
end

-- enable color synthax for hyprland config files using nvim-treesitter
vim.filetype.add({
  pattern = { [".*/hyprland%.conf"] = "hyprlang" },
})
