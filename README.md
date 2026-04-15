# neovim

## Setup

```sh
# clone this config
git clone https://github.com/yandy/neovim-config.git ~/.config/nvim

# install neccessary tools/packages
sudo pacman -S neovim wl-clipboard luarocks lldb lazygit tree-sitter-grammars

# invoke nvim and wait for install completion
nvim
```
## usage

#### basic

**mode switch**
`i` enter insert mode before cursor
`a` enter insert mode after cursor
`v` enter visual mode
`V` enter line selection visual mode
`<c-q>` enter block visual mode
`v(block)`, `I`, multi lines insertion

**edit**
`[Visual]~` swap cursor character(for normal mode)/highlighted text(for visual mode) upper/lower case
`[Visual]r{w}` change cursor character(for normal mode)/highlighted text(for visual mode) to `w`
`{Visual}["x]y` Yank the highlighted text [into register x]
`{Visual}gc` toggle comment on highlighted text

**folding**
`zR` open all folds
`zM` close all folds
`za` toggle fold

**navigation**
`h`/`j`/`k`/`l` left/down/up/right
`:{count}` go to line {count}.
`{count}%` Go to {count} percentage in the file
`gg` begin of current buffer
`G` end of current buffer
`0` begin of line
`$` end of line
`^` first non-blank of line
`<c-f>`/`<c-b>` page down/up
`<c-d>`/`<c-u>` half page down/up
`e`/`b` [count] forward/backward word
`}`/`{` [count] paragraphs forward/backward
`]]`/`[[` [count] sections forward/backward
`<c-o>` Go to [count] Older cursor position in jump list
`<c-i>` Go to [count] newer cursor position in jump list
`]b` next buffer
`[b` prev buffer
`<c-w>w` cycle window
`<c-w>h`/`<c-w>j`/`<c-w>k`/`<c-w>l` switch to left/down/up/right window

#### snacks

`n` `<a-h>` toggle hidden files
`n` `<a-i>` toggle ignored files

**picker**

**explorer**

#### cmp

<c-n> select next
<c-p> select previous
<c-y> select and accept
<c-e> cancle/hidden
<c-f> scroll documentation down
<c-b> scroll documentation up

## reference

cmd :options
cmd :help dap-launch.json

[snacks reference](https://github.com/folke/snacks.nvim/blob/main/docs/explorer.md)
