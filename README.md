# Dotfiles

My macOS dotfiles.

## Installation

Based on [this](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/ "The best way to store your dotfiles: A bare Git repository").

1. Install and open Xcode

2. Clone the repository:

   ```zsh
   git clone --bare git@github.com:osinga/dotfiles.git ~/.dotfiles
   ```

3. Checkout the content:

   ```zsh
   dotfiles checkout
   ```

4. Hide untracked files:

   ```zsh
   dotfiles config --local status.showUntrackedFiles no
   ```
