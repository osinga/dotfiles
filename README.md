# Dotfiles

My macOS dotfiles.

## Installation

Based on [this](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/ "The best way to store your dotfiles: A bare Git repository").

1. Create the directory:

   ```zsh
   mkdir ~/.dotfiles
   ```

2. Define the alias:

   ```zsh
   alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
   ```

3. Clone the repository:

   ```zsh
   git clone --bare git@github.com:osinga/dotfiles.git ~/.dotfiles
   ```

4. Checkout the content:

   ```zsh
   dotfiles checkout
   ```

5. Hide untracked files:

   ```zsh
   dotfiles config --local status.showUntrackedFiles no
   ```
