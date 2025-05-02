# dotfiles

My personal dotfiles for managing my Linux environment, primarily on Arch Linux. These configurations reflect my workflow and preferences, including neovim, window manager, and other tools. Managed using GNU Stow for modularity and ease of use.

## Features

- Neovim configuration
- Window manager setup
- Shell and terminal customizations
- Managed with [GNU Stow](https://www.gnu.org/software/stow/)
- Optimized for Arch Linux

## Usage

1. Clone the repository to your home directory:
   ```sh
   git clone https://github.com/frosthaern/dotfiles.git ~/dotfiles
   cd ~/dotfiles
   ```
2. Use stow to symlink configurations:
   ```sh
   stow <module>
   ```
   Replace `<module>` with the name of the config directory (e.g., `nvim`, `zsh`, etc.).

## Notes

- Feel free to explore or adapt these configs for your own setup.
- Suggestions and improvements are welcome!

## Author

Shashank Bharadwaj  
[GitHub](https://github.com/frosthaern)
