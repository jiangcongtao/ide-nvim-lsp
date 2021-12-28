# Use stow to manage dotfile (.vim, .vimrc etc .files)

## Example Usage
Assume the directory `~/setup-vim/ide-nvim-lua/` has all nvim and `dot-*` file configuration

### Stow the configuration
```
cd ~/setup-vim

stow -S --dotfiles ide-nvim-lsp
stow -R --dotfiles ide-nvim-lsp

#or

stow -S -d ~/setup-vim -t ~/ ide-nvim-lsp

```

#### Unstow/delete the previously stowed configurations
```
stow -D --dotfiles ide-nvim-lsp
```

## install dependencies
```
asdf install nodejs 14.18.0
asdf global nodejs 14.18.0
npm install -g neovim yarn
```

## Key Mappings
## NeoVIM for javascript and typescript development
```
npm install -g typescript typescript-language-server eslint prettier
```

## Tips

Get long diagnosics message show in popup window 
```
:lua vim.lsp.diagnostic.show_line_diagnostics()
```

### Normal mode
```
SHIFT + y: yank to the end of line in normal mode
SHIFT + d: delete to the end of line in normal mode
SHIFT + c: change to the end of line in normal mode
```

### Insert mode
```
CTRL + w : delete word before cursor
CTRL + u : delete to the beginning of the line
```
