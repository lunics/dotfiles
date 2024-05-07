-- https://github.com/gerazov/toggle-bool.nvim
local status_ok, toggle_bool = pcall(require, "toggle-bool")
if not status_ok then
  print("toggle-bool not loaded, return : "..tostring(status_ok))
  return
end

local setup = {
  mapping = "<leader>tt",
  additional_toggles = {
    Yes = 'No',
    On = 'Off',
    ["0"] = "1",
    Enable = 'Disable',
    Enabled = 'Disabled',
    First = 'Last',
    Before = 'After',
    Persistent = 'Ephemeral',
    Internal = 'External',
    Ingress = 'Egress',
    Allow = 'Deny',
    All = 'None',
  },
}

toggle_bool.setup(setup)
