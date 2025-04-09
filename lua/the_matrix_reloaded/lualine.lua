local M = {}

function M.setup()
  local colors = require("matrix_reloaded.colors").config()
  local theme = require("matrix_reloaded.theme").lualine
  
  require("lualine").setup({
    options = {
        theme = "matrix_reloaded",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
      },
    -- sections = {
    --   lualine_a = { "mode" },
    --   lualine_b = { "branch", "diff", "diagnostics" },
    --   lualine_c = { "filename" },
    --   lualine_x = { "encoding", "fileformat", "filetype" },
    --   lualine_y = { "progress" },
    --   lualine_z = { "location" }
    -- }
    sections = {
        lualine_a = {
          {
            "mode",
            icon = "",
            separator = { right = "" }
          }
        },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = {
          {
            "filename",
            path = 1,  -- Muestra la ruta completa
            symbols = { modified = "  ", readonly = "  " }
          }
        },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = {
          {
            "location",
            icon = "",
            separator = { left = "" }
          }
        }
      }
  })
end

return M