if os.getenv("TMUX") then
  vim.g.clipboard = {
  	name = "tmux",
  	copy = {
      ["+"] = "tmux set-buffer -w",
      ["*"] = "tmux set-buffer -w",
  	},
  	paste = {
      ["+"] = "tmux save-buffer -",
      ["*"] = "tmux save-buffer -",
  	},
  	cache_enabled = 0,
  }
end
