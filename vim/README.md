# Vim

## Default Keybindings

### Default Keybidnings in Normal mode

* `i`: Enters insert mode.
* `h`, `j`, `k`, `l`: Moves the cursor left, down, up, right.
* `/` `search` `Enter`: Moves the cursor to the location of the next occurence
  of "search" in the file.
* `?` `search` `Enter`: Like `/`, but searches backwards.
* `f` `character`: Moves the cursor to the next occurrence of the character
  on the current line.
* `F` `character`: Like `f`, but searches backwards.
* `%`: Jumps between the nearest (), [] or {} characters on the line.

### Default Keybindings Insert mode

* `Esc`: Leaves insert mode.

## Custom Keybindings

`Space` is configured as the vim Leader command.

### Custom Keybindings in Normal mode

* `Leader` `u`: Opens UltiSnips editing file.
* `Enter`: Insers a new line after the current line.
* `Leader` `h`, `j`, `k`, `l`: Moves around panes. If we can't move, we create
  a new window.
* `Leader` `H`, `J`, `K`, `L`: Swaps two panes defined by the movement.
* `Leader` `1`, ..., `9`: Opens buffer index 1, ..., 9.
* `Leader` `+`, `-`: Iterates forwards/backwards through the buffer list.
* `Ctrl`+`Space`: Toggles NERDTree.

### Custom Keybindings in Insert mode

* `Ctrl`+`q`: Expands UltiSnips snippet if no completion menu is provided.
* `Tab`, `Shift`+`Tab`: Iterates forwards/backwards through the completion
  menu or the UltiSnips variables when present.
