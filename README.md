# 🌀 The Matrix Reloaded Theme

![banner](images/banner_img.png)

The Matrix Reloaded theme is inspired by the [the-matrix.nvim](https://github.com/luisiacc/the-matrix.nvim) theme. Reloaded version with enhanced features and integrations.

## ✨ Features

### Core Features
- Full support for **TreeSitter** syntax highlighting with language-specific optimizations
- Integrated **Lualine** theme with Matrix-style indicators and custom separators
- Optimized for modern Neovim plugins and LSP ecosystem
- Multiple background variants (medium/dark)
- Transparent mode support
- Customizable styles for syntax elements
- Comprehensive diff highlighting
- Enhanced terminal integration
- Support for multiple file types including:
  - HTML/CSS
  - Markdown
  - PHP
  - Python
  - JavaScript
  - Rust
  - And more...

### Plugin Support
- **LSP & Diagnostics**
  - coc.nvim
  - lspsaga.nvim
  - trouble.nvim
  - nvim-cmp
- **Git Integration**
  - gitsigns.nvim
  - neogit
  - git-messenger.vim
- **Navigation & Search**
  - telescope.nvim
  - nvim-tree.lua
  - hop.nvim
  - lightspeed.nvim
  - vim-sneak
- **UI Components**
  - lualine.nvim
  - bufferline.nvim
  - dashboard.nvim
  - which-key.nvim
  - indent-blankline.nvim
- **Startup & Utilities**
  - vim-startify
  - EasyMotion
  - CocExplorer

## 🚀 Installation

### Using [Lazy.nvim](https://github.com/folke/lazy.nvim)
```lua
{
  "salvarsa/salvarsa-the-matrix-reloaded.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd([[colorscheme the_matrix_reloaded]])
  end
}
```

### Using Vim-Plug
```vim
Plug 'salvarsa/salvarsa-the-matrix-reloaded.nvim'
colorscheme the_matrix_reloaded
```

## ⚙️ Configuration

> ❗️ Configuration must be set **BEFORE** loading the color scheme

### Basic Options
| Option               | Default     | Description                                   |
|----------------------|-------------|-----------------------------------------------|
| `background_color`   | `medium`    | Background variant: `medium` or `dark`        |
| `transparent_mode`   | `false`     | Enable transparent background                 |
| `comment_style`      | `italic`    | Style for comments (see `:h attr-list`)       |
| `keyword_style`      | `italic`    | Style for keywords                            |
| `string_style`       | `nocombine` | Style for string literals                     |
| `function_style`     | `bold`      | Style for function declarations               |
| `variable_style`     | `NONE`      | Style for variables                           |
| `highlights`         | `{}`        | Custom highlight overrides                    |
| `color_overrides`    | `{}`        | Custom color palette modifications            |

### Basic Setup
```lua
-- Lua configuration example
vim.g.the_matrix_reloaded = {
  transparent_mode = true,
  telescope_theme = true,
  function_style = "NONE",
  keyword_style = "italic",
  color_overrides = {
    green0 = "#00ff00",
    background = "#0a0a0a"
  }
}
vim.cmd([[colorscheme the_matrix_reloaded]])
```

```vim
" VimScript configuration example
let g:the_matrix_reloaded_transparent_mode = 1
let g:the_matrix_reloaded_telescope_theme = 1
colorscheme the_matrix_reloaded
```

### Advanced Customization
```lua
-- Custom highlights using color palette
local colors = require("the_matrix_reloaded.colors").config()
vim.g.the_matrix_reloaded_highlights = {
  Normal = { fg = colors.green05, bg = colors.dark },
  LualineModeNormal = { fg = colors.dark, bg = colors.green0, style = "bold" }
}
```

## 🖥️ Terminal Integration

### Recommended Telescope Configuration
```lua
require('telescope').setup({
  defaults = {
    borderchars = {
      prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
      results = { " " },
      preview = { " " },
    },
  }
})
```

### Lualine Configuration
The theme includes a custom Lualine configuration with:
- Matrix-style indicators
- Custom separators
- File path display
- Git integration
- Diagnostics
- Encoding and file type information

## 🎨 Color Palette

The theme features a carefully crafted color palette with:
- Multiple shades of green for the Matrix aesthetic
- Contrasting foreground and background colors
- Special colors for syntax highlighting
- Customizable color overrides

## 📜 License
MIT © [salvarsa](LICENSE)

