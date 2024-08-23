-- Define the directory containing the plugins
local plugins_dir = "plugins"

-- Define the list of filenames to be required
local file_name_list = {
    -- Install common deps first
    "common-dep",

    "lsp-config",
    "gitsigns",
    "mini",
    "tokyonight",
    "tree-sitter",
}

-- Require each file from the plugins directory
for _, file_name in ipairs(file_name_list) do
    local file_path = plugins_dir .. "." .. file_name
    require(file_path)
end
