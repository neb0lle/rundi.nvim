-- Default configuration options
local config = {
  autocompile = {},
  silent = true,
}

-- Function to set up autocompile for a specific file type
local function setup_autocompile(filetype)
  local compile_command = config.autocompile[filetype]
  if compile_command then
    local silent_option = config.silent and " :silent" or ""
    vim.cmd([[
      autocmd FileType ]] .. filetype .. [[ nnoremap <buffer> <C-c> :split<CR>:te ]] .. compile_command .. [[<CR>i]])
  end
end

-- Function to allow users to override configuration options
local function setup(user_config)
  for key, value in pairs(user_config) do
    if config[key] ~= nil then
      config[key] = value
    end
  end

  -- Automatically set up autocompile for default file types after configuration changes
  for filetype, _ in pairs(config.autocompile) do
    setup_autocompile(filetype)
  end
end

-- Export setup function and configuration for use in user's nvim config
return {
  setup = setup,
}