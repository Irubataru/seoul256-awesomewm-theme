--[[

  seoul256 Awesome WM theme
  github.com/Irubataru

--]]

local gears = require("gears")
local lain  = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local dpi   = require("beautiful.xresources").apply_dpi

local os      = os
local homedir = os.getenv("HOME")

local theme   = {}
theme.confdir = homedir .. "/.config/awesome/seoul256-awesomewm-theme"
theme.icondir = theme.confdir .. "/icons"
theme.font    = "Roboto Mono 9"

theme.config = {
  taglist_buttons = nil,
  tasklist_buttons = nil
}

function theme.setup(config)
  if type(config) == 'table' then
    for k, v in pairs(config) do
      if type(k) == 'number' then
        table.insert(theme.config, v)
      else
        theme.config[k] = v
      end
    end
  else
    table.insert(theme.config, arg)
  end
end

-- {{{ Colours

local colors = {}

colors.xresources = {
  "#3a3a3a", -- background
  "#d0d0d0", -- foreground
  "#4e4e4e", -- color0
  "#d68787", -- color1
  "#5f865f", -- color2
  "#d8af5f", -- color3
  "#85add4", -- color4
  "#d7afaf", -- color5
  "#87afaf", -- color6
  "#d0d0d0", -- color7
  "#626262", -- color8
  "#d75f87", -- color9
  "#87af87", -- color10
  "#ffd787", -- color11
  "#add4fb", -- color12
  "#ffafaf", -- color13
  "#87d7d7", -- color14
  "#e4e4e4", -- color15
  "#d0d0d0", -- cursorColor
  "#3a3a3a", -- cursorColor2
  "#e4e4e4"  -- colorBD
}

colors.background   = colors.xresources[1]
colors.foreground   = colors.xresources[2]
colors.black        = colors.xresources[3]
colors.red          = colors.xresources[4]
colors.green        = colors.xresources[5]
colors.yellow       = colors.xresources[6]
colors.blue         = colors.xresources[7]
colors.magenta      = colors.xresources[8]
colors.cyan         = colors.xresources[9]
colors.white        = colors.xresources[10]
colors.lightblack   = colors.xresources[11]
colors.lightred     = colors.xresources[12]
colors.lightgreen   = colors.xresources[13]
colors.lightyellow  = colors.xresources[14]
colors.lightblue    = colors.xresources[15]
colors.lightmagenta = colors.xresources[16]
colors.lightcyan    = colors.xresources[17]
colors.lightwhite   = colors.xresources[18]

theme.fg_normal     = colors.foreground
theme.fg_focus      = colors.lightgreen
theme.fg_urgent     = colors.background
theme.fg_title      = colors.blue
theme.fg_disabled   = colors.background
theme.bg_normal     = colors.background
theme.bg_focus      = colors.black
theme.bg_urgent     = colors.red
theme.bg_disabled   = colors.lightblack
theme.bg_hover      = colors.lightblack
theme.border_width  = dpi(1)
theme.border_normal = colors.lightblack
theme.border_focus  = colors.black
theme.border_marked = colors.magenta

-- }}}

-- {{{ Icons

-- {{{ F-f-float

theme.tasklist_floating_icon = theme.icondir .. "/layouts-huge/floating-greyish.png"

-- }}}

-- {{{ Layout icons

theme.layoutsicondir = theme.icondir .. "/layouts"

theme.layout_tile           = theme.icondir .. "/layouts/tile.png"
theme.layout_tileleft       = theme.icondir .. "/layouts/tileleft.png"
theme.layout_tilebottom     = theme.icondir .. "/layouts/tilebottom.png"
theme.layout_tiletop        = theme.icondir .. "/layouts/tiletop.png"
theme.layout_fairv          = theme.icondir .. "/layouts/fairv.png"
theme.layout_fairh          = theme.icondir .. "/layouts/fairh.png"
theme.layout_spiral         = theme.icondir .. "/layouts/spiral.png"
theme.layout_dwindle        = theme.icondir .. "/layouts/dwindle.png"
theme.layout_max            = theme.icondir .. "/layouts/max.png"
theme.layout_fullscreen     = theme.icondir .. "/layouts/fullscreen.png"
theme.layout_magnifier      = theme.icondir .. "/layouts/magnifier.png"
theme.layout_floating       = theme.icondir .. "/layouts/floating.png"

theme.layout_uselesstile        = theme.icondir .. "/layouts/tile.png"
theme.layout_uselesstileleft    = theme.icondir .. "/layouts/tileleft.png"
theme.layout_uselesstilebottom  = theme.icondir .. "/layouts/tilebottom.png"
theme.layout_uselesstiletop     = theme.icondir .. "/layouts/tiletop.png"
theme.layout_uselessfairv       = theme.icondir .. "/layouts/fairv.png"
theme.layout_uselessfairh       = theme.icondir .. "/layouts/fairh.png"
-- theme.layout_centerwork         = theme.icondir .. "/layouts/centerwork.png"
-- theme.layout_cascade            = theme.icondir .. "/layouts/cascade.png"
-- theme.layout_cascadebrowse      = theme.icondir .. "/layouts/cascadebrowse.png"

-- }}}

-- {{{ Titlebar icons

-- theme.titlebar_close_button_focus               = theme.icondir .. "/titlebar/close_focus-darkbrown.png"
-- theme.titlebar_ontop_button_focus_active        = theme.icondir .. "/titlebar/ontop_focus_active-darkbrown.png"
-- theme.titlebar_ontop_button_focus_inactive      = theme.icondir .. "/titlebar/ontop_focus_inactive-darkbrown.png"
-- theme.titlebar_sticky_button_focus_active       = theme.icondir .. "/titlebar/sticky_focus_active-darkbrown.png"
-- theme.titlebar_sticky_button_focus_inactive     = theme.icondir .. "/titlebar/sticky_focus_inactive-darkbrown.png"
-- theme.titlebar_floating_button_focus_active     = theme.icondir .. "/titlebar/floating_focus_active-darkbrown.png"
-- theme.titlebar_floating_button_focus_inactive   = theme.icondir .. "/titlebar/floating_focus_inactive-darkbrown.png"
-- theme.titlebar_maximized_button_focus_active    = theme.icondir .. "/titlebar/maximized_focus_active-darkbrown.png"
-- theme.titlebar_maximized_button_focus_inactive  = theme.icondir .. "/titlebar/maximized_focus_inactive-darkbrown.png"

-- theme.titlebar_close_button_normal              = theme.icondir .. "/titlebar/close_normal-red.png"
-- theme.titlebar_ontop_button_normal_active       = theme.icondir .. "/titlebar/ontop_normal_active-red.png"
-- theme.titlebar_ontop_button_normal_inactive     = theme.icondir .. "/titlebar/ontop_normal_inactive-green.png"
-- theme.titlebar_sticky_button_normal_active      = theme.icondir .. "/titlebar/sticky_normal_active-green.png"
-- theme.titlebar_sticky_button_normal_inactive    = theme.icondir .. "/titlebar/sticky_normal_inactive-blue.png"
-- theme.titlebar_floating_button_normal_active    = theme.icondir .. "/titlebar/floating_normal_active-red.png"
-- theme.titlebar_floating_button_normal_inactive  = theme.icondir .. "/titlebar/floating_normal_inactive-blue.png"
-- theme.titlebar_maximized_button_normal_active   = theme.icondir .. "/titlebar/maximized_normal_active-red.png"
-- theme.titlebar_maximized_button_normal_inactive = theme.icondir .. "/titlebar/maximized_normal_inactive-green.png"

-- }}}

theme.awesome_icon = theme.icondir .. "/logo/awesome-red.png"

-- }}}

-- {{{ Widgets

theme.widgets = {}
theme.widgets.icons = {}

local markup = lain.util.markup

-- {{{ Textclock

theme.widgets.icons.clock = theme.icondir .. "/widgets/clock/calendar.png"

local clockicon = wibox.widget.imagebox(theme.widgets.icons.clock)
local clock = wibox.widget.textclock()

-- }}}

-- {{{ Battery

theme.widgets.icons.bat = {}

theme.widgets.icons.bat.normal = {
  zero   = theme.icondir .. "/widgets/bat/battery-alert.png",
  twenty = theme.icondir .. "/widgets/bat/battery-20.png",
  fourty = theme.icondir .. "/widgets/bat/battery-40.png",
  sixty  = theme.icondir .. "/widgets/bat/battery-60.png",
  eighty = theme.icondir .. "/widgets/bat/battery-80.png",
  full   = theme.icondir .. "/widgets/bat/battery.png"
}

theme.widgets.icons.bat.charging = {
  zero   = theme.icondir .. "/widgets/bat/battery-charging-0.png",
  twenty = theme.icondir .. "/widgets/bat/battery-charging-20.png",
  fourty = theme.icondir .. "/widgets/bat/battery-charging-40.png",
  sixty  = theme.icondir .. "/widgets/bat/battery-charging-60.png",
  eighty = theme.icondir .. "/widgets/bat/battery-charging-80.png",
  full   = theme.icondir .. "/widgets/bat/battery-charging-100.png"
}

local baticon = wibox.widget.imagebox()
theme.widgets.bat = lain.widget.bat({
  battery = "BAT0",
  settings = function()

    local icons = {}
    if bat_now.status == "Charging" then
      icons = theme.widgets.icons.bat.charging
    else
      icons = theme.widgets.icons.bat.normal
    end

    if bat_now.perc == "N/A" then
      baticon:set_image(icons.zero)
    else
      local perc = tonumber(bat_now.perc)

      if perc < 15 then
        baticon:set_image(icons.zero)
      elseif perc < 35 then
        baticon:set_image(icons.twenty)
      elseif perc < 55 then
        baticon:set_image(icons.fourty)
      elseif perc < 75 then
        baticon:set_image(icons.sixty)
      elseif perc < 95 then
        baticon:set_image(icons.eighty)
      else
        baticon:set_image(icons.full)
      end
    end

    widget:set_markup(markup.fontfg(theme.font, theme.fg_normal, bat_now.perc .. "% "))
  end
})

-- }}}

-- {{{ Keyboard

theme.widgets.icons.keyboard = theme.icondir .. "/widgets/keyboard/keyboard.png"

local keyboardicon = wibox.widget.imagebox(theme.widgets.icons.keyboard)
local keyboardwidget = wibox.widget.textbox("?")

theme.widgets.keyboard = {}

function theme.widgets.keyboard.update(layoutname)
  keyboardwidget:set_markup(markup.fontfg(theme.font, theme.fg_normal, " " .. layoutname .. " "))
end


-- }}}

-- {{{ ALSA

theme.widgets.icons.alsa = {
  low    = theme.icondir .. "/widgets/alsa/volume-low.png",
  medium = theme.icondir .. "/widgets/alsa/volume-medium.png",
  full   = theme.icondir .. "/widgets/alsa/volume-high.png",
  mute   = theme.icondir .. "/widgets/alsa/volume-off.png"
}

local alsaicon = wibox.widget.imagebox(theme.widgets.icons.alsa.full)

theme.widgets.alsa = lain.widget.alsa({
    settings = function()

      local icons = theme.widgets.icons.alsa

      if volume_now.status == "off" then
        alsaicon:set_image(icons.mute)
      else
        if tonumber(volume_now.level) < 30 then
          alsaicon:set_image(icons.low)
        elseif tonumber(volume_now.level) < 60 then
          alsaicon:set_image(icons.medium)
        else
          alsaicon:set_image(icons.full)
        end
      end

      widget:set_markup(markup.fontfg(theme.font, theme.fg_normal, volume_now.level .. "% "))
    end
})

-- }}}

-- }}}

function theme.at_screen_connect(s)
  -- Wallpaper
  local wallpaper = theme.wallpaper
  -- If wallpaper is a function, call it with the screen
  if type(wallpaper) == "function" then
    wallpaper = wallpaper(s)
  end
  gears.wallpaper.maximized(wallpaper, s, true)

  -- Each screen has its own tag table.
  awful.tag(
    { "term", "docs", "web" ,"media", "GUI" },
    s,
    { awful.layout.layouts[4],
      awful.layout.layouts[6],
      awful.layout.layouts[1],
      awful.layout.layouts[4],
      awful.layout.layouts[1]
  })

  -- Create a promptbox for each screen
  s.mypromptbox = awful.widget.prompt()

  -- Create an imagebox widget which will contain an icon indicating which layout we're using.
  -- We need one layoutbox per screen.
  s.mylayoutbox = awful.widget.layoutbox(s)
  s.mylayoutbox:buttons(gears.table.join(
    awful.button({ }, 1, function () awful.layout.inc( 1) end),
    awful.button({ }, 3, function () awful.layout.inc(-1) end),
    awful.button({ }, 4, function () awful.layout.inc( 1) end),
    awful.button({ }, 5, function () awful.layout.inc(-1) end)))

  -- Create a taglist widget
  s.mytaglist = awful.widget.taglist {
    screen  = s,
    filter  = awful.widget.taglist.filter.all,
    buttons = theme.config.taglist_buttons
  }

  -- Create a tasklist widget
  -- Create a tasklist widget
  s.mytasklist = awful.widget.tasklist {
    screen  = s,
    filter  = awful.widget.tasklist.filter.currenttags,
    buttons = theme.config.tasklist_buttons
  }

  -- Create the wibox
  s.mywibox = awful.wibar({ position = "top", screen = s, height = dpi(20), bg = theme.bg_normal, fg = theme.fg_normal })

  -- Add widgets to the wibox
  s.mywibox:setup {
    layout = wibox.layout.align.horizontal,
    { -- Left widgets
      layout = wibox.layout.fixed.horizontal,
      s.mylayoutbox,
      s.mytaglist,
      s.mypromptbox,
    },
    s.mytasklist, -- Middle widget
    --nil,
    { -- Right widgets
      layout = wibox.layout.fixed.horizontal,
      wibox.widget.systray(),
      keyboardicon,
      keyboardwidget,
      alsaicon,
      theme.widgets.alsa.widget,
      baticon,
      theme.widgets.bat.widget,
      clockicon,
      clock,
    },
  }
end

return theme
