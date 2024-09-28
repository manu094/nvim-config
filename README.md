My tailored Nvim config.

I joined the Nvim train pretty lately, so there is not an ounce of vimscript in this. Lua ftw!

The philosophy is that init.lua is only used as a way to require sub-files dependencies to reduce clutter.
All the rest (options, plugins, plugin options, keymaps, etc...) is ordered in its own file, inside of lua/user.
