<div id="table-of-contents">
<h2>Table of Contents</h2>
<div id="text-table-of-contents">
<ul>
<li><a href="#sec-1">1. Dotfiles:</a></li>
<li><a href="#sec-2">2. Emacs</a></li>
<li><a href="#sec-3">3. Neovim</a></li>
<li><a href="#sec-4">4. Mintty</a></li>
<li><a href="#sec-5">5. Tmux</a></li>
<li><a href="#sec-6">6. BASH and ZSH</a></li>
<li><a href="#sec-7">7. <span class="todo TODO">TODO</span> Configure Emacs</a>
<ul>
<li>
<ul>
<li><a href="#sec-7-0-1">7.0.1. <span class="todo IN_PROGRESS">IN-PROGRESS</span> Convert Config to Org</a></li>
<li><a href="#sec-7-0-2">7.0.2. <span class="todo TODO">TODO</span> Configure Tab Navigation</a></li>
<li><a href="#sec-7-0-3">7.0.3. <span class="todo TODO">TODO</span> Optimize Loading</a></li>
</ul>
</li>
</ul>
</li>
</ul>
</div>
</div>


# Dotfiles:<a id="sec-1" name="sec-1"></a>


-   [Emacs](https://www.gnu.org/software/emacs/)
-   [Neovim](https://github.com/neovim/neovim)
-   [wsl-terminal](https://github.com/goreliu/wsl-terminal) (Mintty)
-   [Tmux](https://github.com/tmux/tmux)
-   BASH (With [Powerline-Shell](https://github.com/banga/powerline-shell)),
-   ZSH (With [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh))

# Emacs<a id="sec-2" name="sec-2"></a>

![img](./screenshots/emacs.png "Emacs using a custom powerline with challenger-deep")

![img](./screenshots/emacs2.png "Emacs using the Helm narrowing completion framework")

My Emacs setup consist of [challenger-deep](https://github.com/MaxSt/challenger-deep) as a theme with a custom [Powerline](https://github.com/milkypostman/powerline).
Emacs setup also heavly relies on [Helm](https://github.com/emacs-helm/helm)

# Neovim<a id="sec-3" name="sec-3"></a>

![img](./screenshots/vim.png "Neovim using Airline and NERDTree")

Neovim config uses [dracula-vim](https://github.com/dracula/vim).
Airline theme is **light** from [airline-themes](https://github.com/vim-airline/vim-airline-themes).

# Mintty<a id="sec-4" name="sec-4"></a>

Mintty uses [dracula-mintty](https://github.com/dracula/mintty) for its color definitions.

# Tmux<a id="sec-5" name="sec-5"></a>

![img](./screenshots/tmux.png "Tmux using usings splits and a custom theme")

Tmux uses a modified version of [tmux-airline-dracula](https://github.com/sei40kr/tmux-airline-dracula) named **wracula** which matches **BASH** and **ZSH**.

# BASH and ZSH<a id="sec-6" name="sec-6"></a>

![img](./screenshots/zsh.png "ZSH using Oh My ZSH with the git and syntax plugins")

This config contains a modified versions of both [agnoster-zsh-theme](https://github.com/agnoster/agnoster-zsh-theme) and [agnoster-bash](https://gist.github.com/kruton/8345450) dubbed *wagnoster* for **BASH** and **ZSH**.
LS Color are tweaked version of **dircolors.ansi-dark** from [Solarized Color Theme for GNU](https://github.com/seebi/dircolors-solarized).
ZSH addtionaly uses [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) package.

# TODO Configure Emacs<a id="sec-7" name="sec-7"></a>

### IN-PROGRESS Convert Config to Org<a id="sec-7-0-1" name="sec-7-0-1"></a>

### TODO Configure Tab Navigation<a id="sec-7-0-2" name="sec-7-0-2"></a>

### TODO Optimize Loading<a id="sec-7-0-3" name="sec-7-0-3"></a>
