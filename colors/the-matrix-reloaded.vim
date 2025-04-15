if exists('g:colors_name')
  hi clear
endif

lua << EOF
package.loaded['the_matrix_reloaded'] = nil
package.loaded['the_matrix_reloaded.colors'] = nil
package.loaded['the_matrix_reloaded.config'] = nil
package.loaded['the_matrix_reloaded.theme'] = nil
package.loaded['the_matrix_reloaded.util'] = nil
package.loaded['the_matrix_reloaded.lualine'] = nil

require('the_matrix_reloaded').set()
EOF

let g:colors_name = 'the_matrix_reloaded' 
colorscheme the_matrix_reloaded