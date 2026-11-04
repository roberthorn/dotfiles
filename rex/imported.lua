-- Migrated from tmux (~/.config/tmux/tmux.conf), Herdr and Ghostty.

-- Repeat mode (stands in for tmux bind -r)
rex.mode("repeat", { exclusive = true })
rex.bind("ctrl+b>r", "client.mode.enter", { name = "repeat" })
rex.bind("repeat/enter", "client.mode.exit")
rex.bind("repeat/escape", "client.mode.exit")

-- tmux.conf:3
rex.bind("ctrl+b>ctrl+b", "pane.send_key", { key = "ctrl+b" })
rex.bind("repeat/ctrl+b", "pane.send_key", { key = "ctrl+b" })

-- tmux.conf:19-20
rex.bind("ctrl+b>shift+7", "client.tab.close")
rex.bind("ctrl+b>x", "pane.close")

-- tmux.conf:46
rex.bind("ctrl+b>`", "session.switch")

-- tmux.conf:53-55
rex.bind("ctrl+b>c", "client.tab.new")
rex.bind("ctrl+b>\\", "pane.split", { direction = "right" })
rex.bind("ctrl+b>-", "pane.split", { direction = "down" })

-- tmux.conf:86-89
rex.bind("alt+h", "pane.focus", { direction = "left" })
rex.bind("alt+j", "pane.focus", { direction = "down" })
rex.bind("alt+k", "pane.focus", { direction = "up" })
rex.bind("alt+l", "pane.focus", { direction = "right" })

-- tmux.conf:99-106
rex.bind("shift+right", "pane.resize", { amount = 2, direction = "right" })
rex.bind("shift+left", "pane.resize", { amount = 2, direction = "left" })
rex.bind("shift+up", "pane.resize", { amount = 1, direction = "up" })
rex.bind("shift+down", "pane.resize", { amount = 1, direction = "down" })
rex.bind("ctrl+right", "pane.resize", { amount = 10, direction = "right" })
rex.bind("ctrl+left", "pane.resize", { amount = 10, direction = "left" })
rex.bind("ctrl+up", "pane.resize", { amount = 5, direction = "up" })
rex.bind("ctrl+down", "pane.resize", { amount = 5, direction = "down" })

-- tmux.conf:109
rex.bind("ctrl+b>b", "pane.move_to_new_tab")
