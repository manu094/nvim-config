My tailored Nvim config.

I joined the Neovim train pretty recently, so there is not an ounce of vimscript in this. Lua ftw!

The philosophy is that init.lua is only used as a way to require sub-files to reduce clutter.
All the rest (options, plugins, plugin options, keymaps, etc...) is ordered in its own file.

Dependencies:
Node.js and npm // Required for some plugins   
unzip // Required by Mason-LSP   
Clang and Clangd // For c/cpp LSP support   
GDB v.14 // For c/cpp debugging support   
Ubuntu v.24.04 // Required for GDB v.14
Stylua // Lua formatting
