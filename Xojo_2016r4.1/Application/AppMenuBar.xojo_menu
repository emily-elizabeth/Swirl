#tag Menu
Begin Menu AppMenuBar
   Begin MenuItem ConnectionMenu
      SpecialMenu = 0
      Text = "#Strings.kConnection"
      Index = -2147483648
      AutoEnable = True
      Visible = True
      Begin MenuItem ConnectionConnect
         SpecialMenu = 0
         Text = "#Strings.kConnect_"
         Index = -2147483648
         ShortcutKey = "K"
         Shortcut = "Cmd+K"
         MenuModifier = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem ConnectionReconnect
         SpecialMenu = 0
         Text = "#Strings.kReconnect"
         Index = -2147483648
         ShortcutKey = "K"
         Shortcut = "Cmd+Shift+K"
         MenuModifier = True
         AltMenuModifier = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem ConnectionDisconnect
         SpecialMenu = 0
         Text = "#Strings.kDisconnect"
         Index = -2147483648
         ShortcutKey = "D"
         Shortcut = "Cmd+D"
         MenuModifier = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem ConnectionDisconnectAll
         SpecialMenu = 0
         Text = "#Strings.kDisconnectAll"
         Index = -2147483648
         ShortcutKey = "D"
         Shortcut = "Cmd+Shift+D"
         MenuModifier = True
         AltMenuModifier = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem UntitledSeparator1
         SpecialMenu = 0
         Text = "-"
         Index = -2147483648
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem ConnectionChat
         SpecialMenu = 0
         Text = "#Strings.kChat"
         Index = -2147483648
         ShortcutKey = "T"
         Shortcut = "Cmd+T"
         MenuModifier = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem ConnectionNews
         SpecialMenu = 0
         Text = "#Strings.kNews"
         Index = -2147483648
         ShortcutKey = "N"
         Shortcut = "Cmd+N"
         MenuModifier = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem ConnectionFiles
         SpecialMenu = 0
         Text = "#Strings.kFiles"
         Index = -2147483648
         ShortcutKey = "F"
         Shortcut = "Cmd+F"
         MenuModifier = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem ConnectionTransfers
         SpecialMenu = 0
         Text = "#Strings.kTransfers"
         Index = -2147483648
         ShortcutKey = "S"
         Shortcut = "Cmd+S"
         MenuModifier = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem ConnectionAccounts
         SpecialMenu = 0
         Text = "#Strings.kAccounts"
         Index = -2147483648
         ShortcutKey = "U"
         Shortcut = "Cmd+U"
         MenuModifier = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem UntitledSeparator4
         SpecialMenu = 0
         Text = "-"
         Index = -2147483648
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem ConnectionGetInfo
         SpecialMenu = 0
         Text = "#Strings.kGetInfo"
         Index = -2147483648
         ShortcutKey = "i"
         Shortcut = "Cmd+i"
         MenuModifier = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem ConnectionServerInfo
         SpecialMenu = 0
         Text = "#Strings.kServerInfo"
         Index = -2147483648
         ShortcutKey = "I"
         Shortcut = "Cmd+Shift+I"
         MenuModifier = True
         AltMenuModifier = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem ConnectionSetTopic
         SpecialMenu = 0
         Text = "#Strings.kSetTopic"
         Index = -2147483648
         ShortcutKey = "T"
         Shortcut = "Cmd+Shift+T"
         MenuModifier = True
         AltMenuModifier = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem ConnectionPostNews
         SpecialMenu = 0
         Text = "#Strings.kPostNews"
         Index = -2147483648
         ShortcutKey = "P"
         Shortcut = "Cmd+P"
         MenuModifier = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem UntitledSeparator2
         SpecialMenu = 0
         Text = "-"
         Index = -2147483648
         AutoEnable = True
         Visible = True
      End
      Begin QuitMenuItem ConnectionQuit
         SpecialMenu = 0
         Text = "#Strings.kQuit"
         Index = -2147483648
         ShortcutKey = "#Strings.kFileQuitShortcut"
         Shortcut = "Cmd+#Strings.kFileQuitShortcut"
         MenuModifier = True
         AutoEnable = True
         Visible = True
      End
   End
   Begin MenuItem EditMenu
      SpecialMenu = 0
      Text = "#Strings.kEdit"
      Index = -2147483648
      AutoEnable = True
      Visible = True
      Begin MenuItem EditUndo
         SpecialMenu = 0
         Text = "&Undo"
         Index = -2147483648
         ShortcutKey = "Z"
         Shortcut = "Cmd+Z"
         MenuModifier = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem UntitledMenu1
         SpecialMenu = 0
         Text = "-"
         Index = -2147483648
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem EditCut
         SpecialMenu = 0
         Text = "Cu&t"
         Index = -2147483648
         ShortcutKey = "X"
         Shortcut = "Cmd+X"
         MenuModifier = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem EditCopy
         SpecialMenu = 0
         Text = "&Copy"
         Index = -2147483648
         ShortcutKey = "C"
         Shortcut = "Cmd+C"
         MenuModifier = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem EditPaste
         SpecialMenu = 0
         Text = "&Paste"
         Index = -2147483648
         ShortcutKey = "V"
         Shortcut = "Cmd+V"
         MenuModifier = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem EditPasteImage
         SpecialMenu = 0
         Text = "#Strings.kPasteImage"
         Index = -2147483648
         ShortcutKey = "V"
         Shortcut = "Cmd+Shift+V"
         MenuModifier = True
         AltMenuModifier = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem EditClear
         SpecialMenu = 0
         Text = "#Strings.kClear"
         Index = -2147483648
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem EditClearChat
         SpecialMenu = 0
         Text = "#Strings.kClearChat"
         Index = -2147483648
         ShortcutKey = "DELETE"
         Shortcut = "Cmd+DELETE"
         MenuModifier = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem EditClearAllChats
         SpecialMenu = 0
         Text = "#Strings.kClearAllChats"
         Index = -2147483648
         ShortcutKey = "DELETE"
         Shortcut = "Cmd+Shift+DELETE"
         MenuModifier = True
         AltMenuModifier = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem UntitledMenu0
         SpecialMenu = 0
         Text = "-"
         Index = -2147483648
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem EditSelectAll
         SpecialMenu = 0
         Text = "Select &All"
         Index = -2147483648
         ShortcutKey = "A"
         Shortcut = "Cmd+A"
         MenuModifier = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem UntitledSeparator
         SpecialMenu = 0
         Text = "-"
         Index = -2147483648
         AutoEnable = True
         Visible = True
      End
      Begin PrefsMenuItem EditPreferences
         SpecialMenu = 0
         Text = "#Strings.kPreferences"
         Index = -2147483648
         AutoEnable = True
         SubMenu = True
         Visible = True
         Begin MenuItem PrefsGeneral
            SpecialMenu = 0
            Text = "#Strings.kGeneral"
            Index = -2147483648
            ShortcutKey = ","
            Shortcut = "Cmd+,"
            MenuModifier = True
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem UntitledSeparator3
            SpecialMenu = 0
            Text = "-"
            Index = -2147483648
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem PrefsEvents
            SpecialMenu = 0
            Text = "#Strings.kEvents"
            Index = -2147483648
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem PrefsIcons
            SpecialMenu = 0
            Text = "#Strings.kIcons"
            Index = -2147483648
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem PrefsMessageStyles
            SpecialMenu = 0
            Text = "#Strings.kMessageStyles"
            Index = -2147483648
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem PrefsNewsStyles
            SpecialMenu = 0
            Text = "#Strings.kNewsStyles"
            Index = -2147483648
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem PrefsStatusIcons
            SpecialMenu = 0
            Text = "#Strings.kStatusIcons"
            Index = -2147483648
            AutoEnable = True
            Visible = True
         End
      End
   End
   Begin MenuItem WindowMenu
      SpecialMenu = 0
      Text = "#Strings.kWindow"
      Index = -2147483648
      AutoEnable = True
      Visible = True
      Begin MenuItem WindowCloseWindow
         SpecialMenu = 0
         Text = "#Strings.kCloseWindow"
         Index = -2147483648
         ShortcutKey = "W"
         Shortcut = "Cmd+W"
         MenuModifier = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem WindowCloseTab
         SpecialMenu = 0
         Text = "#Strings.kCloseTab"
         Index = -2147483648
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem UntitledSeparator0
         SpecialMenu = 0
         Text = "-"
         Index = -2147483648
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem WindowSelectPreviousTab
         SpecialMenu = 0
         Text = "#Strings.kSelectPreviousTab"
         Index = -2147483648
         ShortcutKey = "["
         Shortcut = "Cmd+Shift+["
         MenuModifier = True
         AltMenuModifier = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem WindowSelectNextTab
         SpecialMenu = 0
         Text = "#Strings.kSelectNextTab"
         Index = -2147483648
         ShortcutKey = "]"
         Shortcut = "Cmd+]"
         MenuModifier = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem UntitledItem1
         SpecialMenu = 0
         Text = "-"
         Index = -2147483648
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem ViewToggleFullScreen
         SpecialMenu = 0
         Text = "#Strings.kEnterFullScreen"
         Index = -2147483648
         ShortcutKey = "F"
         Shortcut = "Cmd+Control+F"
         MenuModifier = True
         MacControlKey = True
         AutoEnable = True
         Visible = True
      End
   End
   Begin MenuItem HelpMenu
      SpecialMenu = 0
      Text = "Help"
      Index = -2147483648
      AutoEnable = True
      Visible = True
      Begin ApplicationMenuItem HelpAbout
         SpecialMenu = 0
         Text = "#Strings.kAboutSwirl"
         Index = -2147483648
         AutoEnable = True
         Visible = True
      End
   End
End
#tag EndMenu
