# randi.nvim

[![GitHub stars](https://img.shields.io/github/stars/s3dman/rundi.nvim)](https://github.com/s3dman/rundi.nvim/stargazers)
[![GitHub issues](https://img.shields.io/github/issues/s3dman/rundi.nvim)](https://github.com/s3dman/rundi.nvim/issues)
[![GitHub license](https://img.shields.io/github/license/s3dman/rundi.nvim)](https://github.com/s3dman/rundi.nvim/blob/main/LICENSE)

randi.nvim is a Neovim plugin that enhances your random number generation capabilities right within Neovim. It provides a simple interface to generate random numbers in various formats.

## Installation

You can install randi.nvim using your preferred plugin manager for Neovim. Here are examples using popular plugin managers:

### Using vim-plug

1. Add the following line to your Neovim configuration file (`init.lua` for Lua-based configurations or `init.vim` for Vimscript configurations):

   ```lua
	Plug 's3dman/rundi.nvim'
	use 's3dman/rundi.nvim'
	
local randi = require'randi'

randi.setup({
  option_name_1 = "value_1",
})
