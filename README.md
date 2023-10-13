# rundi.nvim

rundi.nvim is a Neovim plugin that makes it easy to generate compile command mappings right within Neovim. It provides a simple interface to generate mappings for various filetypes and workflows.

## Installation

You can install rundi.nvim using your preferred plugin manager for Neovim. Here are examples using popular plugin managers:

### [vim-plug](https://github.com/junegunn/vim-plug)
```lua
Plug 's3dman/rundi.nvim'
```

### [packer.nvim](https://github.com/wbthomason/packer.nvim)
```lua
use 's3dman/rundi.nvim'
```

## Configuration
rundi.nvim offers several configuration options to customize its behavior. You can override these options in your Neovim configuration.

Available Configuration Options
- `autocompile` Configuration for each filetype.
	- `compiler` Compiler to be used.
	- `compiler_args` Compiler args to be passed.
	- `output_format` Filename modifier for output file. (See `:h %:p` for list of modifiers)
- `silent` Visibilty of rundi command.
- `keymap` Keymap for rundi.

Example configuration:
```lua
local rundi = require('rundi')

rundi.setup({
  autocompile = {
    python = {
      compiler = "python3",
	  compiler_args = "-i"
    },
    cpp = {
      compiler = "g++",
      compiler_args = "-std=c++14 -Wshadow -Wall -g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG",
      output_format = "%:t:r",
    },
    c = {
      compiler = "gcc",
      compiler_args = "-Wall -g",
      output_format = "%:t:r",
    },
  },
  silent = true,
  keymap = "<C-c>",
})
```

## Usage
Press `Ctrl + c` or whatever keymap that you configured.

## License
This plugin is licensed under the MIT License. See the LICENSE file for details.

## Author
- [Neville](https://github.com/s3dman)
