

## Setup

```sh
# clone this config
git clone https://github.com/yandy/neovim-config.git ~/.config/nvim

# install neccessary tools/packages

bun add -g typescript-language-server typescript @tailwindcss/language-server
uv tool install basedpyright
sudo pacman -S neovim lazygit wl-clipboard luarocks tree-sitter-grammars lua-language-server

# invoke nvim and wait for install completion

```
## usage

#### basic

**mode switch**
`n`, `i` enter insert mode before cursor
`n`, `a` enter insert mode after cursor
`n`, `v` enter visual mode
`n`, `V` enter line selection visual mode
`n`, `<c-q>` enter block visual mode
`v(block)`, `I`, multi lines insertion

**edit**
`n, v`, `~` toggle upper/lower case
`n, v`, `r` change every character to

**folding**
`n`, `zR` open all folds
`n`, `zM` close all folds
`n`, `za` toggle fold

**navigation**
`n`, `gg` begin of current buffer
`n`, `G` end of current buffer
`n`, `0` begin of line
`n`, `$` end of line
`n`, `^` first character of line
`n`, `h`/`j`/`k`/`l` left/down/up/right
`n`, `<c-f>`/`<c-b>` page down/up
`n`, `<c-d>`/`<c-u>` half page down/up

#### snacks

`n` `<a-h>` toggle hidden files
`n` `<a-i>` toggle ignored files

**explorer**


#### cmp

<c-n> select next
<c-p> select previous
<c-y> select and accept
<c-e> cancle/hidden
<c-f> scroll documentation down
<c-b> scroll documentation up


## reference

cmd  :options

[snacks reference](https://github.com/folke/snacks.nvim/blob/main/docs/explorer.md)
