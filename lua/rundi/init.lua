local config = {
  autocompile = {
    python = {
      compiler = "python3",
    },
    cpp = {
      compiler = "g++",
      compiler_args = "",
      output_format = "%:t:r",
    },
    c = {
      compiler = "gcc",
      compiler_args = "",
      output_format = "%:t:r",
    },
    rust = {
      compiler = "rustc",
      compiler_args = "",
      output_format = "%:t:r",
    },
  },
  silent = true,
  keymap = "<C-c>",
  terminal_split = true,
  split_direction = "top", 
  persist_viewport = true,
}

local previous_buffer = 0

local function setup_autocompile(filetype, options)
  local ac = config.autocompile[filetype]
  if ac then
    local silent_option = config.silent and "<silent>" or ""
    local compiler_args = options.compiler_args and (" " .. options.compiler_args) or ""
    local output_flag = options.output_format and (" -o " .. options.output_format) or ""
    local execute_flag = options.output_format and (" && ./" .. options.output_format) or ""
    local input_file = ' "%"'
    local keymap = " " .. config.keymap

    if config.split_direction == "fullscreen" then
      -- Run :term in fullscreen mode
      vim.cmd([[ autocmd FileType ]] .. filetype .. [[ nnoremap <buffer> ]] .. silent_option .. keymap .. [[ :term ]] .. options.compiler .. compiler_args .. input_file .. output_flag .. execute_flag .. [[<CR>]])
      return
    end

    local split_cmd = "split"
    if config.terminal_split then
      if config.split_direction == "bottom" then
        split_cmd = "splitbelow"
      elseif config.split_direction == "left" then
        split_cmd = "vsplit"
      elseif config.split_direction == "right" then
        split_cmd = "vsplitright"
      end

      -- Save the current buffer number before opening the terminal
      local current_buffer = vim.fn.bufnr("%")

      vim.cmd([[ autocmd FileType ]] .. filetype .. [[ nnoremap <buffer> ]] .. silent_option .. keymap .. [[ :]] .. split_cmd .. [[<CR>:te ]] .. options.compiler .. compiler_args .. input_file .. output_flag .. execute_flag .. [[<CR>i]])

      if config.persist_viewport and previous_buffer ~= 0 then
        -- Switch back to the previous buffer
        vim.cmd("execute 'buffer ' .. " .. previous_buffer)
      end

      -- Update the previous buffer to the current buffer
      previous_buffer = current_buffer
    end
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

