local util = require("the_matrix_reloaded.util")
local theme = require("the_matrix_reloaded.theme")

local M = {}

function M.colorscheme()
  require("matrix_reloaded.util").load(require("matrix_reloaded.theme").setup())
  
  -- Cargar integración con Lualine si está instalado
  if package.loaded["lualine"] then
    require("matrix_reloaded.lualine").setup()
  end
end

-- Opcional: Comando para recargar
vim.cmd([[ command! MatrixReloaded lua require("matrix_reloaded").colorscheme() ]])

return M