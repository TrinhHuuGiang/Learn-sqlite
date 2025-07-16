# VI text editor
- lessons about `vi` or `vim`:
    - First install `vim` on Ubuntu `sudo apt install vim`
    - Then type `vimtutor`
    - Default open with mode `Normal mode`:
        - Type `ESC` if want open `Normal mode`
            - Using for start a special command
        - Type `i` if want go to `Insert content mode`
            - Using when edit content
        - Type `v` if want go to `Visual mode`
            - Using when select a block content

- Normal operations:
    1. [Move cursor](#1-move-cursor)
    2. [Exit without save](#2-exit-without-save)
    3. [Delete, replace a character](#3-delete-replace-a-character)
    4. [Append new text to location](#4-append-new-text-to-location)
    5. [Save all newest text to file](#5-save-all-newest-text-to-file)

- Text block operations:
    1. [Delete (cut) text](#1-delete-cut-text)
    2. [Put cut content](#2-put-cut-content)
    3. [Copy and paste (put)](#3-copy-and-paste-put)

<br><hr><br>

# Normal operations
### 1. Move cursor
- Sure in `Normal mode` by type `ESC`
- (h, j, k, l) == (left, down, up, right)
---
### 2. Exit without save
- Sure in `Normal mode`
- type `:q!`
    - On keyboard `:` is `Shift + ;`
---
### 3. Delete, replace a character
- Sure in `Normal mode`
- Move cursor on to character will be deleted
    - Type `x` to delete
    - Hole `x` to delete continuously
    - Restore characters by `u` == undo
- Move cursor on to character will be replaced
    - Type `r` and type a new character to replace 
---
### 4. Append new text to location
- Sure in `Normal mode`
- Move cursor on to character will be append the right
    - Type `a` to append new text next the right
---
### 5. Save all newest text to file
- Sure in `Normal mode`
- Type `:w` to write all content was modified
    - Combine `:wq` if quit

<br><hr><br>

# Text block operations:
### 1. Delete (cut) text
- In `Normal mode` move cursor on start character will cut (Delete)
- Sure go to `Visual mode`
    - Type command `v` when at `Normal mode`
- Now move cursor on to end character will cut (Delete)
    - Tips: hole `Shift` + move will choose faster
- Type `x` to cut
---
### 2. Put cut content
- First cut content want to paste
- Go to `Normal mode` and move cursor on to character what to put
    - Type `p` will put the right
    - Type `Shift+P` or `P` will put the left
---
### 3. Copy and paste (put)
- Similar with cut and put but replace `x` by `y` to copy