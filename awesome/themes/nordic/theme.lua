-- {{{ Main
theme = {}
-- }}}

-- {{{ Styles
theme.font = "Ubuntu Mono Regular 10"
theme.wibar_height = 23
theme.tasklist_disable_icon = true

-- {{{ Colors
theme.fg_normal  = "#D8DEE9"
theme.fg_focus   = "#88C0D0"
theme.fg_urgent  = "#2E3440"
theme.fg_accent  = "#81A1C1"
theme.fg_ok      = "#A3BE8C"
theme.fg_warn    = "#EBCB8B"
theme.fg_error   = "#BF616A"
theme.bg_normal  = "#2E3440"
theme.bg_focus   = "#3B4252"
theme.bg_urgent  = "#BF616A"
theme.bg_systray = theme.bg_normal
-- }}}

-- {{{ Borders
theme.border_width  = 1
theme.border_normal = "#2E3440"
theme.border_focus  = "#88C0D0"
theme.border_marked = "#A3BE8C"
-- }}}

-- {{{ Titlebars
theme.titlebar_bg_focus  = "#303233"
theme.titlebar_bg_normal = "#111213"
-- }}}

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- Example:
--theme.taglist_bg_focus = "#CC9393"
-- }}}

-- {{{ Widgets
-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.fg_widget        = "#AECF96"
--theme.fg_center_widget = "#88A175"
--theme.fg_end_widget    = "#FF5656"
--theme.bg_widget        = "#494B4F"
--theme.border_widget    = "#3F3F3F"
-- }}}

-- {{{ Mouse finder
theme.mouse_finder_color = "#c22832"
-- mouse_finder_[timeout|animate_timeout|radius|factor]
-- }}}

-- {{{ Menu
-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_height = 15
theme.menu_width  = 100
-- }}}

-- {{{ Icons
-- {{{ Taglist
--theme.taglist_squares_sel   = "~/.config/awesome/themes/nordic/taglist/squarefz.png"
--theme.taglist_squares_unsel = "~/.config/awesome/themes/nordic/taglist/squarez.png"
--theme.taglist_squares_resize = "false"
-- }}}

-- {{{ Misc
theme.awesome_icon           = "~/.config/awesome/themes/nordic/awesome-icon.png"
theme.menu_submenu_icon      = "/usr/share/awesome/themes/default/submenu.png"
-- }}}

-- {{{ Layout
theme.layout_tile       = "~/.config/awesome/themes/nordic/layouts/tile.png"
theme.layout_tileleft   = "~/.config/awesome/themes/nordic/layouts/tileleft.png"
theme.layout_tilebottom = "~/.config/awesome/themes/nordic/layouts/tilebottom.png"
theme.layout_tiletop    = "~/.config/awesome/themes/nordic/layouts/tiletop.png"
theme.layout_fairv      = "~/.config/awesome/themes/nordic/layouts/fairv.png"
theme.layout_fairh      = "~/.config/awesome/themes/nordic/layouts/fairh.png"
theme.layout_spiral     = "~/.config/awesome/themes/nordic/layouts/spiral.png"
theme.layout_dwindle    = "~/.config/awesome/themes/nordic/layouts/dwindle.png"
theme.layout_max        = "~/.config/awesome/themes/nordic/layouts/max.png"
theme.layout_fullscreen = "~/.config/awesome/themes/nordic/layouts/fullscreen.png"
theme.layout_magnifier  = "~/.config/awesome/themes/nordic/layouts/magnifier.png"
theme.layout_floating   = "~/.config/awesome/themes/nordic/layouts/floating.png"
-- }}}

-- {{{ Titlebar
theme.titlebar_close_button_focus  = "~/.config/awesome/themes/nordic/titlebar/close_focus.png"
theme.titlebar_close_button_normal = "~/.config/awesome/themes/nordic/titlebar/close_normal.png"

theme.titlebar_ontop_button_focus_active  = "~/.config/awesome/themes/nordic/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active = "~/.config/awesome/themes/nordic/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive  = "~/.config/awesome/themes/nordic/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive = "~/.config/awesome/themes/nordic/titlebar/ontop_normal_inactive.png"

theme.titlebar_sticky_button_focus_active  = "~/.config/awesome/themes/nordic/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active = "~/.config/awesome/themes/nordic/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive  = "~/.config/awesome/themes/nordic/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive = "~/.config/awesome/themes/nordic/titlebar/sticky_normal_inactive.png"

theme.titlebar_floating_button_focus_active  = "~/.config/awesome/themes/nordic/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active = "~/.config/awesome/themes/nordic/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive  = "~/.config/awesome/themes/nordic/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive = "~/.config/awesome/themes/nordic/titlebar/floating_normal_inactive.png"

theme.titlebar_maximized_button_focus_active  = "~/.config/awesome/themes/nordic/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active = "~/.config/awesome/themes/nordic/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = "~/.config/awesome/themes/nordic/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = "~/.config/awesome/themes/nordic/titlebar/maximized_normal_inactive.png"
-- }}}
-- }}}

return theme
