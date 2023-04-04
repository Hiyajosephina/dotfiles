local dpi = require("beautiful.xresources").apply_dpi

local os = os

local theme = {}
theme.confdir = os.getenv("HOME") .. "/.config/awesome/themes/Morning"
theme.wallpaper = theme.confdir .. "/wall.png"
theme.font = "Terminus 8"

theme.bg_normal = "#37395E"
theme.bg_focus = "#4C4f82"
theme.bg_urgent = "#48FFDC"
theme.bg_minimize = "#1B1D27"
theme.bg_systray = theme.bg_normal

theme.fg_normal = "#ECBDF6"
theme.fg_focus = "#F2E1F6"
theme.fg_urgent = "#F2E1F6"
theme.fg_minimize = "#F2E1F6"

theme.border_width = dpi(2)
theme.border_normal = "#d492d0"
theme.border_focus = "#6fb3fc"
theme.border_marked = "#d492d0"

-- Hotkeys popup
theme.hotkeys_bg = '#37395E'
theme.hotkeys_fg = '#ECBDF6'
theme.hotkeys_opacity = '0.9'
theme.hotkeys_border_width = dpi(2)
theme.hotkeys_border_color = '#48FFDC'
theme.hotkeys_modifiers_fg = '#1DFF79'
theme.hotkeys_label_fg = '#1B1D27'
theme.hotkeys_font = 'JetBrains Mono 10'
theme.hotkeys_description_font = 'Terminus 8'
theme.hotkeys_group_margin = 20
theme.menu_fg_normal = "#d492d0"
theme.menu_fg_focus = "#6fb3fc"
theme.menu_bg_normal = "#050505dd"
theme.menu_bg_focus = "#050505dd"
theme.widget_temp = theme.confdir .. "/icons/temp.png"
theme.widget_uptime = theme.confdir .. "/icons/ac.png"
theme.widget_cpu = theme.confdir .. "/icons/cpu.png"
theme.widget_weather = theme.confdir .. "/icons/dish.png"
theme.widget_fs = theme.confdir .. "/icons/fs.png"
theme.widget_mem = theme.confdir .. "/icons/mem.png"
theme.widget_note = theme.confdir .. "/icons/note.png"
theme.widget_note_on = theme.confdir .. "/icons/note_on.png"
theme.widget_netdown = theme.confdir .. "/icons/net_down.png"
theme.widget_netup = theme.confdir .. "/icons/net_up.png"
theme.widget_mail = theme.confdir .. "/icons/mail.png"
theme.widget_batt = theme.confdir .. "/icons/bat.png"
theme.widget_clock = theme.confdir .. "/icons/clock.png"
theme.widget_vol = theme.confdir .. "/icons/spkr.png"
theme.taglist_squares_sel = theme.confdir .. "/icons/square_a.png"
theme.taglist_squares_unsel = theme.confdir .. "/icons/square_b.png"
theme.tasklist_plain_task_name = true
theme.tasklist_disable_icon = true
theme.useless_gap = dpi(2)
theme.layout_tile = theme.confdir .. "/icons/tile.png"
theme.layout_tilegaps = theme.confdir .. "/icons/tilegaps.png"
theme.layout_tileleft = theme.confdir .. "/icons/tileleft.png"
theme.layout_tilebottom = theme.confdir .. "/icons/tilebottom.png"
theme.layout_tiletop = theme.confdir .. "/icons/tiletop.png"
theme.layout_fairv = theme.confdir .. "/icons/fairv.png"
theme.layout_fairh = theme.confdir .. "/icons/fairh.png"
theme.layout_spiral = theme.confdir .. "/icons/spiral.png"
theme.layout_dwindle = theme.confdir .. "/icons/dwindle.png"
theme.layout_max = theme.confdir .. "/icons/max.png"
theme.layout_fullscreen = theme.confdir .. "/icons/fullscreen.png"
theme.layout_magnifier = theme.confdir .. "/icons/magnifier.png"
theme.layout_floating = theme.confdir .. "/icons/floating.png"
theme.titlebar_close_button_normal = theme.confdir ..
                                         "/icons/titlebar/close_normal.png"
theme.titlebar_close_button_focus = theme.confdir ..
                                        "/icons/titlebar/close_focus.png"
theme.titlebar_minimize_button_normal = theme.confdir ..
                                            "/icons/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus = theme.confdir ..
                                           "/icons/titlebar/minimize_focus.png"
theme.titlebar_ontop_button_normal_inactive = theme.confdir ..
                                                  "/icons/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive = theme.confdir ..
                                                 "/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = theme.confdir ..
                                                "/icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active = theme.confdir ..
                                               "/icons/titlebar/ontop_focus_active.png"
theme.titlebar_sticky_button_normal_inactive = theme.confdir ..
                                                   "/icons/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive = theme.confdir ..
                                                  "/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = theme.confdir ..
                                                 "/icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active = theme.confdir ..
                                                "/icons/titlebar/sticky_focus_active.png"
theme.titlebar_floating_button_normal_inactive = theme.confdir ..
                                                     "/icons/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive = theme.confdir ..
                                                    "/icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = theme.confdir ..
                                                   "/icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active = theme.confdir ..
                                                  "/icons/titlebar/floating_focus_active.png"
theme.titlebar_maximized_button_normal_inactive = theme.confdir ..
                                                      "/icons/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive = theme.confdir ..
                                                     "/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = theme.confdir ..
                                                    "/icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active = theme.confdir ..
                                                   "/icons/titlebar/maximized_focus_active.png"

return theme
