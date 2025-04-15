local util = require("the_matrix_reloaded.util")
local theme = require("the_matrix_reloaded.theme")

local M = {}

function M.set()
  require("the_matrix_reloaded.util").load(require("the_matrix_reloaded.theme").setup())
  vim.cmd("colorscheme the_matrix_reloaded")
--end
  
  -- Cargar integración con Lualine si está instalado
  if package.loaded["lualine"] then
    require("the_matrix_reloaded.lualine").setup()
  end
end

-- Alias para compatibilidad
M.colorscheme = M.set

-- Opcional: Comando para recargar
vim.cmd([[ command! MatrixReloaded lua require("the_matrix_reloaded").set() ]])

return M