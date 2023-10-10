# randi.nvim

[![GitHub stars](https://img.shields.io/github/stars/s3dman/rundi.nvim)](https://github.com/s3dman/rundi.nvim/stargazers)
[![GitHub issues](https://img.shields.io/github/issues/s3dman/rundi.nvim)](https://github.com/s3dman/rundi.nvim/issues)
[![GitHub license](https://img.shields.io/github/license/s3dman/rundi.nvim)](https://github.com/s3dman/rundi.nvim/blob/main/LICENSE)

randi.nvim is a Neovim plugin that makes it easy to generate compile command mappings right within Neovim. It provides a simple interface to generate mappings for various filetypes and workflows.

## Installation

You can install randi.nvim using your preferred plugin manager for Neovim. Here are examples using popular plugin managers:

### Using vim-plug

1. Add the following line to your Neovim configuration file (`init.lua` for Lua-based configurations or `init.vim` for Vimscript configurations):

```lua
Plug 's3dman/rundi.nvim'
```
   
2. Reload your Neovim configuration or restart Neovim.
3. Run :PlugInstall in Neovim to install the plugin.


### Using packer.nvim
1. Add the following line to your Neovim configuration file (init.lua for Lua-based configurations):

```lua
use 's3dman/rundi.nvim'
```
2. Reload your Neovim configuration or restart Neovim.
3. Run :PackerInstall in Neovim to install the plugin.

## Configuration
randi.nvim offers several configuration options to customize its behavior. You can override these options in your Neovim configuration.

Available Configuration Options
1. autocompile
Description of the first configuration option.

Example configuration to set option_name_1:
```lua
local randi = require'randi'

randi.setup({
  option_name_1 = "value_1",
})
```

## Usage
Describe how to use the plugin once it's installed and configured. Include code examples or usage scenarios to help users get started.

## License
This plugin is licensed under the MIT License. See the LICENSE file for details.

## Issues and Contributions
If you encounter any issues or have suggestions for improvements, please open an issue on the GitHub repository.

Contributions in the form of pull requests are welcome and greatly appreciated.
