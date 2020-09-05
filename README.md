<p align="center">
  <img src="https://user-images.githubusercontent.com/60138143/91989761-8fd15180-ed39-11ea-8a83-645f92507c2d.png" width="120" title="My dotfiles">
  <br>
</p>

![header-min](https://user-images.githubusercontent.com/60138143/92312584-cffb3300-efca-11ea-9e0c-5a0dffc3955c.png)

### 🖥 Screenshots

<details>
 <summary>Nvim Startify Which-keys</summary>
   <img width="1593" alt="fullscreen" src="https://user-images.githubusercontent.com/60138143/92312171-046cf000-efc7-11ea-9ee0-b594f7eb255d.png">
   <img width="1593" alt="startify" src="https://user-images.githubusercontent.com/60138143/92312169-046cf000-efc7-11ea-8e21-046a6ea90067.png">
   <img width="1593" alt="html" src="https://user-images.githubusercontent.com/60138143/92312166-02a32c80-efc7-11ea-913d-b1551e220649.png">
</details>

<details>
 <summary>iTerm2 Tmux</summary>
  <img width="1593" alt="iterm2 tmux" src="https://user-images.githubusercontent.com/60138143/91641434-12ea6300-ea2d-11ea-8e75-4b3d2afaaf6e.png">
</details>

### ⚙️  Configuration

- OS : macOS (11.0) Big Sur
- Editor: [NeoVim](https://neovim.io)
- Terminal: [Kitty](https://sw.kovidgoyal.net/kitty/)
- Shell: [Fish](https://fishshell.com)
- Multiplexer : [tmux](https://github.com/tmux/tmux)
- Fonts: [JetBrainsMono Nerd](https://github.com/JetBrains/JetBrainsMono)
- Windows manager: [Moom](https://manytricks.com/moom/).
- Vim main theme: [Rigel](https://rigel.netlify.app)

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
alias commit-types='cat ~/dotfiles/commit-types'
alias ct='cat ~/dotfiles/commit-types'
```

Then just set globally on your git to use above file as template for all your commit with the command:

```bash
git config --global commit.template ~/commit-types
```

And voilà....any time you send commit message on your repo git will pick up that file and you will never forgot about your commit types!
