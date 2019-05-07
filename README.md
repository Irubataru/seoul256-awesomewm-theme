seoul256-awesomewm-theme
========================

A theme for Awesome WM 4.x based on junegunn's seoul256 colour scheme.

## Installation

Clone the repository to your awesome config directory

```
git clone https://github.com/Irubataru/seoul256-awesomewm-theme.git $HOME/.config/awesome
```

Then add the following to your awesome config file

```lua
local homedir      = os.getenv("HOME")
local confdir      = homedir .. "/.config/awesome"
local themedir     = confdir .. "/seoul256-awesomewm-theme"

-- Initialise the theme
beautiful.init( themedir .. "/theme.lua")

-- Call the theme's at_screen_connect
awful.screen.connect_for_each_screen(function(s) beautiful.at_screen_connect(s) end)
```

Remember to replace the affected code instead of duplicating it.

## Dependencies

 * The theme uses [lain][lain] widgets, so either install the libary using your
   favourite package manager, or clone the repository somewhere awesome can find
   it

## Assets and inspiration

 * Colour theme is [junegunn/seoul256.vim][seoul256]
 * Icons are [Material Design Icons][md-icons]
 * Awesome configuration inspired by [awesome-copycats][copycats]

## License

MIT


[lain]: https://github.com/lcpz/lain
[seoul256]: https://github.com/junegunn/seoul256.vim
[md-icons]: https://materialdesignicons.com/
[copycats]: https://github.com/lcpz/awesome-copycats
