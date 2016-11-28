# Default Keybindings

## Default Keybidnings in Normal mode

|  Keys | Description |
|-------|-------------|
| <kbd>i</kbd> | Enters insert mode. |
| <kbd>h</kbd>, <kbd>j</kbd>, <kbd>k</kbd>, <kbd>l</kbd> | Mosves the cursor
left, down, up, right. |
| <kbd>/</kbd>search<kbd>Enter</kbd> | Moves the cursor to the location of the
next occurence of "search" in the file. |
| <kbd>?</kbd>search<kbd>Enter</kbd> | Like <kbd>/</kbd>, but searches 
backwards. |
| <kbd>f</kdb>character | Moves the cursor to the next occurrence of the 
character on the current line. |
| <kbd>F</kdb>character | Like <kbd>f</kbd>, but searches backwards. |
| <kbd>%</kbd> | Jumps between the nearest (), [] or {} characters on the line.
|

## Default Keybindings Insert mode

|  Keys | Description |
|-------|-------------|
| <kbd>Esc</kbd> | Leaves insert mode. |

# Custom Keybindings

<kbd>Space</kbd> is configured as the vim Leader command.

## Custom Keybindings in Normal mode

|  Keys | Description |
|-------|-------------|
| <kbd>Leader</kbd> <kbd>u</kbd> | Opens UltiSnips editing file |
| <kbd>Enter</kbd> | Insers a new line after the current line |
| <kbd>Leader</kbd> <kbd>h</kbd>, <kbd>j</kbd>, <kbd>k</kbd>, <kbd>l</kbd> |
Moves around panes. If we can't move, we create a new window. |
| <kbd>Leader</kbd> <kbd>H</kbd>, <kbd>J</kbd>, <kbd>K</kbd>, <kbd>L</kbd> |
Swaps two panes defined by the movement. |
| <kbd>Leader</kbd> <kbd>1</kbd>, ..., <kbd>9</kbd> | Opens buffer index 1,
..., 9. |
| <kbd>Leader</kbd> <kbd>+</kbd>, <kbd>-</kbd> | Iterates forwards/backwards
through the buffer list. |
| <kbd>Ctrl</kbd>+<kbd>Space</kbd> | Toggles NERDTree. |

## Custom Keybindings in Insert mode

|  Keys | Description |
|-------|-------------|
| <kbd>Ctrl</kbd>+<kbd>q</kbd> | Expands UltiSnips snippet if no completion
menu is provided. |
| <kbd>Tab</kbd>, <kbd>Shift</kbd>+<kbd>Tab</kbd> | Iterates forwards/backwards
through the completion menu or the UltiSnips variables when present. |
