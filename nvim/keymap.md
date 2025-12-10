# Neovim keymap

| Keymap | Description |
|:------ |:----------- |
| `<leader>?` | Show keymaps |



## Navigation

### Window navigation

| Keymap | Description |
|:------ |:----------- |
| `<leader>wh` | Window: Focus left |
| `<leader>wj` | Window: Focus down |
| `<leader>wk` | Window: Focus up |
| `<leader>wl` | Window: Focus right |
| `<leader>wH` | Window: Swap left |
| `<leader>wJ` | Window: Swap down |
| `<leader>wK` | Window: Swap up |
| `<leader>wL` | Window: Swap right |


### Buffer/File

| Keymap | Description |
|:------ |:----------- |
| `<leader>_` | Find open buffers |
| `<leader>hh` | Harpoon: Find harpooned files |
| `<leader>hJ` | Harpoon: Set file J |
| `<leader>hj` | Harpoon: Open file J |
| `<leader>hK` | Harpoon: Set file K |
| `<leader>hk` | Harpoon: Open file K |
| `<leader>hL` | Harpoon: Set file L |
| `<leader>hl` | Harpoon: Open file L |




## Code

The `<leader>c` prefix is reserved for code related keymaps. These will vary somewhat between LSPs.

| LSP | Keymap | Description |
|:--- |:------ |:----------- |
|  | `<leader>cf` | **F**ormat document (insert mode) or selection (visual mode) |
|  | `<leader>cd` | **D**ebug - Add breakpoint |
|  | `<leader>cD` | **D**ebug - Run |
|  | `<leader>cx` | Trouble - Show problems in buffer |
|  | `<leader>cX` | Trouble - Send problems to quickfix list |
| `c_sharp` | `<leader>cb` | C# - **B**uild project |
| `c_sharp` | `<leader>cB` | C# - **B**uild solution |


| Keymap | Description |
|:------ |:----------- |
| `gd` | **G**o to **D**efinition |
| `gi` | **G**o to **I**mplementation |
| `gc` | Comment selection (visual mode) |
| `gcc` | Comment selection (visual block mode) |
| `gsn` | Go to next sibling |
| `gsN` | Go to previous sibling |




## Git

The `<leader>g` prefix is reserved for Git keymaps.

| Keymap | Description |
|:------ |:----------- |
| `<leader>g` |  |
| `<leader>g` |  |
| `<leader>g` |  |
| `<leader>g` |  |
| `<leader>g` |  |
| `<leader>g` |  |



## Project specific

The `<leader>p` prefix is reserved for project specific keymaps. These will vary depending on where the current file is located.


### iCORE (`~/Development/projects/apto-as/icore/`)

| Keymap | Description |
|:------ |:----------- |
| `<leader>pra` | **P**roject: **R**esources - **A**dd |
| `<leader>pre` | **P**roject: **R**esources - **E**dit |
| `<leader>pma` | **P**roject: **M**essages - **A**dd |
| `<leader>pme` | **P**roject: **M**essages - **E**dit |
| `<leader>pdm` | **P**roject: **D**atabase - Generate **M**igration from schema model script |


### Support (`~/Development/projects/apto-as/support/`)




