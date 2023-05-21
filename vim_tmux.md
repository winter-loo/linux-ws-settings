Requirements:
 - tmux 1.9 higher
 - vim 8+


```shell
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
cp tmux.conf ~/.tmux.conf
tmux
```

Inside tmux session, press `C-b I` to install tmux plugins.

For seamlessly moving between vim and tmux pane, run:

```shell
cp plain_vimrc ~/.vimrc
git clone https://github.com/christoomey/vim-tmux-navigator.git ~/.vim/pack/plugins/start/vim-tmux-navigator
```

Now, you can use `C-h/j/k/l` to move around
