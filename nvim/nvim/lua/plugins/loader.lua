local original_list = require("plugins.list")

for index, element in ipairs(original_list) do
  local plugin_name = string.match(element, "^.*/(.*)$")        -- extract the string after /
  local plugin_name = string.gsub(plugin_name, "%.nvim$", "")   -- remove potential ".nvim" string
  local plugin_name = string.gsub(plugin_name, "%.vim$", "")    -- remove potential ".vim"  string
  local loader_file = debug.getinfo(1, 'S').source:sub(2)       -- get the current file name
  local path_loader = vim.loop.fs_realpath(loader_file)         -- get absolute path of the current file name
  local parent_dir  = path_loader:match("(.*/)")                -- get the parent directory
  local file_path   = parent_dir..plugin_name..".lua"           -- create the absolute path of the potential plugin file
  local file_exist  = os.execute("test -e "..file_path)         -- get return code of existing verification absolute path

  if file_exist == 0 then               -- IF plugin_name is an existing file in lua/plugins/<name> THEN
    require("plugins."..plugin_name)    -- load the plugin file
  end
  --   require(plugin_name).setup()             -- load the plugin itself
  --   print("Plugin file "..plugin_name..".lua not found")
  -- end
end
