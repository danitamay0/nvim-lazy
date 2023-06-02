-- configuration

local subdir = "dani"
local config_files = {
  "settings",
  "lazy",
  "keymaps",
}

for _ , file  in ipairs(config_files ) do
  require(subdir .. "." .. file)
end



