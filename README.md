<<<<<<< HEAD
# Dotfiles

![alt text][screenshot1]

Custom Config and Theme files for:
- [Neovim](https://github.com/neovim/neovim)
- BASH (With [Powerline-Shell](https://github.com/banga/powerline-shell)),
- ZSH (With [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh))
- [wsl-terminal](https://github.com/goreliu/wsl-terminal)
- [tmux](https://github.com/tmux/tmux)

## Neovim

![alt text][screenshot2]

Neovim config uses [dracula-vim](https://github.com/dracula/vim).

Airline theme is **light** from [airline-themes](https://github.com/vim-airline/vim-airline-themes).

## wsl-terminal

wsl-terminal uses [dracula-mintty](https://github.com/dracula/mintty).

## tmux
tmux uses a modified version of [tmux-airline-dracula](https://github.com/sei40kr/tmux-airline-dracula) named **wracula**.

## BASH and ZSH

![alt text][screenshot3]

This config contains a modified versions of both [agnoster-zsh-theme](https://github.com/agnoster/agnoster-zsh-theme) and [agnoster-bash](https://gist.github.com/kruton/8345450) dubbed **wagnoster** for *BASH* and *ZSH*.

LS Color are tweaked version of **dircolors.ansi-dark** from [Solarized Color Theme for GNU](https://github.com/seebi/dircolors-solarized).

[screenshot1]: https://i.imgur.com/35PbDfi.png "Dotfiles"
[screenshot2]: https://i.imgur.com/XUmhvmd.png "Dotfiles"
[screenshot3]: https://i.imgur.com/feNNd4O.png "Dotfiles"

=======
![Challenger Deep](https://s17.postimg.org/8b54c0ia7/challenger-deep.png)

# Screenshots #

![Screenshot elisp](https://s26.postimg.org/5kj8xaxh5/challenger-deep2.png)

![Screenshot javascript](https://s26.postimg.org/oockdnabd/challenger-deep1.png)

![Screenshot org-mode](https://s26.postimg.org/saidqagop/challenger-deep3.png)

# Install using MELPA #
```
M-x package-install <RET> challenger-deep-theme
```

# Install manually #
Add the emacs theme files to ~/.emacs.d/themes.

To load a theme add the following to your init.el

```
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'challenger-deep t)
```

# Load Theme #
First make sure no other themes are enabled with `M-x disable-theme`.
To load the theme type `M-x load-theme RET challenger-deep RET`.

To load the theme at startup at the following to your init.el: 
```
(load-theme 'challenger-deep t)
```
>>>>>>> b4cd8550dd6a26c4efd226156dff33e261e7a8cc
