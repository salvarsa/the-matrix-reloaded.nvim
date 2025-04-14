lua << EOF
package.loaded['the_matrix_reloaded'] = nil
package.loaded['the_matrix_reloaded.colors'] = nil
package.loaded['the_matrix_reloaded.config'] = nil
package.loaded['the_matrix_reloaded.theme'] = nil
package.loaded['the_matrix_reloaded.util'] = nil
package.loaded['the_matrix_reloaded.lualine'] = nil

require('the_matrix_reloaded').set()
vim.cmd("colorscheme the_matrix_reloaded") 
EOF