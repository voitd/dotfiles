<p align="center">
  <br>
  <img width="1360" alt="nvim" src="https://user-images.githubusercontent.com/60138143/109387824-345cd680-790c-11eb-8ccb-8f77a669d514.png">
  <br>
  <a href="https://www.apple.com/ru/macos/big-sur/"><b>macOS</b></a> &bull; <a href="https://neovim.io"><b>NeoVim</b></a> &bull; <a     href="https://sw.kovidgoyal.net/kitty/"><b>Kitty</b></a> &bull; <a href="https://fishshell.com"><b>Fish</b></a> &bull; <a href="https://github.com/tmux">   <b>Tmux</b></a></br> 
  <a href="https://rubjo.github.io/victor-mono"><b>Victor Mono Nerd</b></a> &bull; <a href="https://manytricks.com/moom/"><b>Moom</b></a> &bull; <a href="https://github.com/equt/paper.vim"><b>Paper</b></a>
 <br><br>
  <img src="https://user-images.githubusercontent.com/60138143/91989761-8fd15180-ed39-11ea-8a83-645f92507c2d.png" width="120" title="My dotfiles">
  <br>
</p>

<!-- ### 🖥 Screenshots -->


<!-- ### ⚙️ Configuration

- OS : macOS (11.0) Big Sur
- Editor: [NeoVim](https://neovim.io)
- Terminal: [Kitty](https://sw.kovidgoyal.net/kitty/)
- Shell: [Fish](https://fishshell.com)
- Multiplexer : [tmux](https://github.com/tmux/tmux) - Fonts: [JetBrainsMono Nerd](https://github.com/JetBrains/JetBrainsMono)
- Fonts: [Victor Mono Nerd](https://rubjo.github.io/victor-mono)
- Windows manager: [Moom](https://manytricks.com/moom/).
- Vim main theme: [Rigel](https://rigel.netlify.app) -->

### 📦 Setting Up a New Machine

To set up a new machine to use your version controlled config files, all you need to do is to clone the repository on your new machine telling git that it is a bare repository:

```bash
git clone --separate-git-dir=$HOME/dotfiles https://github.com/voitd/dotfiles.git
```

However, some programs create default config files, so this might fail if git finds an existing config file in your \$HOME. In that case, a simple solution is to clone to a temporary directory,
and then delete it once you are done:

```bash
git clone --separate-git-dir=$HOME/dotfiles https://github.com/voitd/dotfiles.git tmpdotfiles
rsync --recursive --verbose --exclude '.git' tmpdotfiles/ $HOME/
rm -r tmpdotfiles
```

There you go. No symlink mess.

### 📩 Git commit types

The aliases will just print out the contents of the commit types file into my terminal.

```bash
alias commit-types='cat ~/dotfiles/.gitmessage'
alias ct='cat ~/dotfiles/.gitmessage'
```

Then just set globally on your git to use above file as template for all your commit with the command:

```bash
git config --global commit.template ~/.gitmessage
```

And voilà....any time you send commit message on your repo git will pick up that file and you will never forgot about your commit types!
