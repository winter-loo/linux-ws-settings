#!/bin/bash -e

std_path_config=$HOME/.config/nvim
std_path_data=$HOME/.local/share/nvim

[ -d $std_path_config ] || cp -r neovim $std_path_config
[ -d $std_path_data ] || mkdir -p $std_path_data

pkgm=$(command -v apt || command -v yum)
[ -z $(command -v rg) ] && sudo $pkgm install -y ripgrep
[ -z $(command -v fdfind) ] && sudo $pkgm install -y fd-find && ln -s `which fdfind` ~/.local/bin/fd
[ -z $(command -v bear) ] && sudo $pkgm install -y bear

if [ ! -d $std_path_data/lazy/lazy.nvim ]; then
  git clone --filter=blob:none --branch=stable https://github.com/folke/lazy.nvim.git $HOME/.local/share/nvim/lazy/lazy.nvim
fi

phome=$std_path_data/lazy
plugins=(
  'christoomey/vim-tmux-navigator'
  'nvim-lua/plenary.nvim'
  'nvim-telescope/telescope.nvim'
  'nvim-treesitter/nvim-treesitter'
)

for ((i=0;i<${#plugins[@]};i++)); do
  repo=${plugins[$i]}
  plugin=${repo##*/}
  echo "plugin ${repo}"
  if [ ! -d "$phome/$plugin" ]; then
    echo -en "\033[32;1mgit clone $repo now\033[0m"
    git clone https://github.com/$repo.git $phome/$plugin
  fi
done
