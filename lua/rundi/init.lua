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

    vim.cmd([[command! Rundi :luado require("rundi").Rundi()]])
    vim.cmd([[command! -nargs=* RundiSetFlag :luado require("rundi").RundiSetFlag(<f-args>)]])
    vim.cmd([[command! -nargs=* RundiSetConfig :luado require("rundi").RundiSetConfig(<f-args>)]])
end

local function Rundi()
    local filetype = vim.bo.filetype
    local options = config.autocompile[filetype]

    if options then
        local compiler_args = options.compiler_args and (" " .. options.compiler_args) or ""
        local output_flag = options.output_format and (" -o " .. options.output_format) or ""
        local execute_flag = options.output_format and (" && ./" .. options.output_format) or ""
        local input_file = ' "%"'

        vim.cmd("split")
        vim.cmd("te " .. options.compiler .. compiler_args .. input_file .. output_flag .. execute_flag)
        vim.cmd("startinsert")
    else
        print("Autocompile options not found for this filetype")
    end
end

local function RundiSetFlag(flags)
    local filetype = vim.bo.filetype
    local options = config.autocompile[filetype]

    if options then
        options.compiler_args = flags
    else
        print("Autocompile options not found for this filetype")
    end
end

local function RundiSetConfig(new_config)
    local chunks = vim.fn.split(config_str, "=")
    local key = chunks[1]
    local value = chunks[2]

    if config[key] ~= nil then
        config[key] = value
end

return {
	setup = setup,
    Rundi = Rundi,
    RundiSetFlag = RundiSetFlag,
    RundiSetConfig = RundiSetConfig
}
