-- Create cache dir and data dirs
local cache_dir = "$CACHE/nvim/"

local data_dir = {
	cache_dir .. "backup",
	cache_dir .. "session",
	cache_dir .. "swap",
	cache_dir .. "tags",
	cache_dir .. "undo",
}

-- Only check whether cache_dir exists, this would be enough.
if vim.fn.isdirectory(cache_dir) == 0 then
	os.execute("mkdir -p " .. cache_dir)
	for _, v in pairs(data_dir) do
		if vim.fn.isdirectory(v) == 0 then
			os.execute("mkdir -p " .. v)
		end
	end
end
