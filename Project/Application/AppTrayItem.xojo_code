#tag Class
Protected Class AppTrayItem
Inherits TrayItem
	#tag Event
		Sub Action(cause as Integer)
		  if (cause = TrayItem.LeftMouseButton) OR (cause = TrayItem.RightMouseButton) then
		    DIM trayMenu As NEW MenuItem
		    trayMenu.Append(NEW MenuItem(Strings.kAboutSwirl, "about"))
		    trayMenu.Append(NEW MenuItem(Strings.kConnect, "connect"))
		    trayMenu.Append(NEW MenuItem(MenuItem.TextSeparator))
		    trayMenu.Append(NEW MenuItem(Strings.kChat, "chat"))
		    trayMenu.Append(NEW MenuItem(Strings.kNews, "news"))
		    'trayMenu.Append(NEW MenuItem(Strings.kFiles, "files"))
		    'trayMenu.Append(NEW MenuItem(Strings.kTransfers, "transfers"))
		    trayMenu.Append(NEW MenuItem(MenuItem.TextSeparator))
		    trayMenu.Append(NEW MenuItem(Strings.kPreferences_, "preferences"))
		    trayMenu.Append(NEW MenuItem(Strings.kQuit, "quit"))
		    
		    DIM hitItem As MenuItem = trayMenu.PopUp
		    if (hitItem <> Nil) then
		      select case hitItem.Tag
		      case "about"
		        SwirlAboutWindow.Show
		      case "connect"
		        ChatWindow.ShowConnectTab
		        ChatWindow.Show
		      case "chat"
		        ChatWindow.ShowChatTab
		        ChatWindow.Show
		      case "news"
		        ChatWindow.ShowNewsTab
		        ChatWindow.Show
		      case "files"
		      case "transfers"
		      case "preferences"
		        SwirlPrefsGeneralWIndow.Show
		      case "quit"
		        Quit
		      end select
		    end if
		  end if
		End Sub
	#tag EndEvent


	#tag ViewBehavior
		#tag ViewProperty
			Name="HelpTag"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Icon"
			Group="Behavior"
			InitialValue="0"
			Type="Picture"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
