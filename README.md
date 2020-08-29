```bash

               ██████╗  ██████╗ ████████╗███████╗██╗██╗     ███████╗███████╗
               ██╔══██╗██╔═══██╗╚══██╔══╝██╔════╝██║██║     ██╔════╝██╔════╝
               ██║  ██║██║   ██║   ██║   █████╗  ██║██║     █████╗  ███████╗
               ██║  ██║██║   ██║   ██║   ██╔══╝  ██║██║     ██╔══╝  ╚════██║
            ██╗██████╔╝╚██████╔╝   ██║   ██║     ██║███████╗███████╗███████║
            ╚═╝╚═════╝  ╚═════╝    ╚═╝   ╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝

```

### My Setup

Main terminal: <details><summary>Kitty+Fish</summary><img width="1593" alt="startufy" src="https://user-images.githubusercontent.com/60138143/91604073-b3ca1700-e976-11ea-87b3-547c04f70f29.png"><img width="1593" alt="html" src="https://user-images.githubusercontent.com/60138143/91604089-baf12500-e976-11ea-85d2-885bd0172493.png"><img width="1593" alt="main" src="https://user-images.githubusercontent.com/60138143/91604098-bd537f00-e976-11ea-978e-aa07c09fd1f1.png"></details>
Second as quake console like: <details><summary>iTerm2+Tmux</summary><img width="3001" alt="iterm2 tmux" src="https://user-images.githubusercontent.com/60138143/91641434-12ea6300-ea2d-11ea-8e75-4b3d2afaaf6e.png"</details>
Fonts: JetBrainsMono Nerd.
Windows manager: [Moom](https://manytricks.com/moom/).

### Setting Up a New Machine

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

### Git commit types

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
