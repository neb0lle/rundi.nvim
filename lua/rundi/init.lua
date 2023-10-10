-- Default configuration options
local config = {
  autocompile = {},
  silent = true,
  keymap = "<C-c>",
}

local function setup_autocompile(filetype, options)
  local ac = config.autocompile[filetype]
  if ac then
    local silent_option = config.silent and "<silent>" or ""
    local compiler_args = options.compiler_args and (" " .. options.compiler_args) or ""
    local output_flag = options.output_format and (" -o " .. options.output_format) or ""
    local execute_flag = options.output_format and (" && ./" .. options.output_format) or ""
    local input_file = ' "%"'
	local keymap = " " .. config.keymap
    vim.cmd([[ autocmd FileType ]] .. filetype .. [[ nnoremap <buffer> ]] .. silent_option .. keymap .. [[ :split<CR>:te ]] .. options.compiler .. compiler_args .. input_file .. output_flag .. execute_flag .. [[<CR>i]])
  end
end

local function setup(user_config)
  for key, value in pairs(user_config) do
    if config[key] ~= nil then
      config[key] = value
    end
  end

  for filetype, options in pairs(config.autocompile) do
    setup_autocompile(filetype, options)
  end
end

return {
  setup = setup,
}