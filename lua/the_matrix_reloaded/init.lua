local util = require("the_matrix_reloaded.util")
local theme = require("the_matrix_reloaded.theme")

local M = {}

function M.colorscheme()
  util.load(theme.setup())
end

return M
