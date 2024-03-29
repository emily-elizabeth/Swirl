#tag Module
Protected Module Prefs
	#tag Method, Flags = &h1
		Protected Sub SavePreferences()
		  mDefaults.Save
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function UserIcon_() As Picture
		  'DIM results As Picture
		  'DIM iconName As String = mDefaults.Lookup("UserIcon", "")
		  'DIM iconPath As FolderItem = Paths.Icons.Child(iconName)
		  'DIM iconClassicPath As FolderItem = NEW FolderItem(iconPath, FolderItem.PathTypeNative)
		  'results = Picture.Open(iconClassicPath)  // no need to do error checking on the path as this still returns a Nil
		  '
		  'Return results
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("AutoDeclinePrivateChatRequests", FALSE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("AutoDeclinePrivateChatRequests") = value
			End Set
		#tag EndSetter
		Protected AutoDeclinePrivateChatRequests As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("ChatReceivedBounceInDock", TRUE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("ChatReceivedBounceInDock") = value
			End Set
		#tag EndSetter
		Protected ChatReceivedBounceInDock As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("ChatReceivedBounceInDockForever", FALSE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("ChatReceivedBounceInDockForever") = value
			End Set
		#tag EndSetter
		Protected ChatReceivedBounceInDockForever As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("ChatReceivedDisplayInNotificationCenter", FALSE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("ChatReceivedDisplayInNotificationCenter") = value
			End Set
		#tag EndSetter
		Protected ChatReceivedDisplayInNotificationCenter As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("ChatReceivedPlayASound", TRUE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("ChatReceivedPlayASound") = value
			End Set
		#tag EndSetter
		Protected ChatReceivedPlayASound As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("ChatReceivedPostInChat", TRUE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("ChatReceivedPostInChat") = TRUE
			End Set
		#tag EndSetter
		Protected ChatReceivedPostInChat As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("ChatReceivedSpeak", FALSE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("ChatReceivedSpeak") = value
			End Set
		#tag EndSetter
		Protected ChatReceivedSpeak As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("ChatTopicChangedBounceInDock", FALSE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("ChatTopicChangedBounceInDock") = value
			End Set
		#tag EndSetter
		Protected ChatTopicChangedBounceInDock As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("ChatTopicChangedBounceInDockForever", FALSE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("ChatTopicChangedBounceInDockForever") = value
			End Set
		#tag EndSetter
		Protected ChatTopicChangedBounceInDockForever As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("ChatTopicChangedDisplayInNotificationCenter", FALSE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("ChatTopicChangedDisplayInNotificationCenter") = value
			End Set
		#tag EndSetter
		Protected ChatTopicChangedDisplayInNotificationCenter As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("ChatTopicChangedPlayASound", FALSE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("ChatTopicChangedPlayASound") = value
			End Set
		#tag EndSetter
		Protected ChatTopicChangedPlayASound As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("ChatTopicChangedPostInChat", TRUE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("ChatTopicChangedPostInChat") = value
			End Set
		#tag EndSetter
		Protected ChatTopicChangedPostInChat As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("ChatTopicChangedSpeak", FALSE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("ChatTopicChangedSpeak") = value
			End Set
		#tag EndSetter
		Protected ChatTopicChangedSpeak As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("ChatWinFullScreen", FALSE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("ChatWinFullScreen") = value
			End Set
		#tag EndSetter
		Protected ChatWinFullScreen As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  DIM rectString As String = mDefaults.Lookup("ChatWinRect", "")
			  
			  if (rectString <> "") then
			    DIM rectDict As Dictionary = ParseJSON(rectString)
			    DIM rectBounds As NEW Rect
			    rectBounds.Top = rectDict.Value("Top")
			    rectBounds.Left = rectDict.Value("Left")
			    rectBounds.Width = rectDict.Value("Width")
			    rectBounds.Height = rectDict.Value("Height")
			    Return rectBounds
			  else
			    Return Nil
			  end if
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  DIM rectDict As NEW Dictionary
			  rectDict.Value("Top") = value.Top
			  rectDict.Value("Left") = value.Left
			  rectDict.Value("Width") = value.Width
			  rectDict.Value("Height") = value.Height
			  
			  DIM rectString As String = GenerateJSON(rectDict)
			  
			  mDefaults.Set("ChatWinRect") = rectString
			End Set
		#tag EndSetter
		Protected ChatWinRect As Rect
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("ConfirmApplicationQuit", TRUE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("ConfirmApplicationQuit") = value
			End Set
		#tag EndSetter
		Protected ConfirmApplicationQuit As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("ConfirmDisconnect", TRUE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("ConfirmDisconnect") = value
			End Set
		#tag EndSetter
		Protected ConfirmDisconnect As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  DIM pathName As String = mDefaults.Lookup("DownloadFolder", Paths.DefaultDownloadFolder.NativePath)
			  DIM path As NEW FolderItem(pathName)
			  
			  Return path
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  if (value <> Nil) AND (value.Exists) then
			    mDefaults.Set("DownloadFolder") = value.NativePath
			  end if
			End Set
		#tag EndSetter
		Protected DownloadFolder As FolderItem
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("ErrorBounceInDock", TRUE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("ErrorBounceInDock") = value
			End Set
		#tag EndSetter
		Protected ErrorBounceInDock As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("ErrorBounceInDockForever", FALSE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("ErrorBounceInDockForever") = value
			End Set
		#tag EndSetter
		Protected ErrorBounceInDockForever As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("ErrorDisplayInNotificationCenter", FALSE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("ErrorDisplayInNotificationCenter") = value
			End Set
		#tag EndSetter
		Protected ErrorDisplayInNotificationCenter As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("ErrorPlayASound", TRUE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("ErrorPlayASound") = value
			End Set
		#tag EndSetter
		Protected ErrorPlayASound As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("ErrorPostInChat", FALSE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("ErrorPostInChat") = value
			End Set
		#tag EndSetter
		Protected ErrorPostInChat As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("ErrorSpeak", FALSE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("ErrorSpeak") = value
			End Set
		#tag EndSetter
		Protected ErrorSpeak As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  Static mDefaults As UserDefaults
			  
			  if (mDefaults = Nil) then
			    mDefaults = NEW UserDefaults(Paths.Preferences.Child(Paths.DefaultPreferencesName))
			  end if
			  
			  return mDefaults
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #Pragma Unused value
			End Set
		#tag EndSetter
		Private mDefaults As UserDefaults
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("MessageReceivedBounceInDock", TRUE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("MessageReceivedBounceInDock") = value
			End Set
		#tag EndSetter
		Protected MessageReceivedBounceInDock As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("MessageReceivedBounceInDockForever", FALSE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("MessageReceivedBounceInDockForever") = value
			End Set
		#tag EndSetter
		Protected MessageReceivedBounceInDockForever As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("MessageReceivedDisplayInNotificationCenter", FALSE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("MessageReceivedDisplayInNotificationCenter") = value
			End Set
		#tag EndSetter
		Protected MessageReceivedDisplayInNotificationCenter As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("MessageReceivedPlayASound", TRUE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("MessageReceivedPlayASound") = value
			End Set
		#tag EndSetter
		Protected MessageReceivedPlayASound As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("MessageReceivedPostInChat", TRUE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("MessageReceivedPostInChat") = value
			End Set
		#tag EndSetter
		Protected MessageReceivedPostInChat As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("MessageReceivedSpeak", FALSE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("MessageReceivedSpeak") = value
			End Set
		#tag EndSetter
		Protected MessageReceivedSpeak As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("MessageStyleFontSize", 0)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("MessageStyleFontSize") = value
			  
			  ObjObserver.Notify Nil, Events.kWiredMessageStyleFontSizeChanged
			End Set
		#tag EndSetter
		Protected MessageStyleFontSize As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  DIM styleName As String = mDefaults.Lookup("MessageStyle", Paths.DefaultMessageStyleName)
			  DIM styleURLPath As String = Paths.MessageStyles.NativePath + styleName
			  
			  DIM stylePath As NEW FolderItem(styleURLPath)
			  if (NOT stylePath.Exists) then
			    stylePath = Paths.MessageStyles.Child(Paths.DefaultMessageStyleName)
			  end if
			  
			  Return stylePath
			  
			  
			  'Return NEW FolderItem(Paths.MessageStyles.Child(styleName).Path)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  if (value <> Nil) AND (value.Exists) then
			    DIM stylePath As String = value.NativePath
			    stylePath = stylePath.Replace(Paths.MessageStyles.NativePath, "")
			    mDefaults.Set("MessageStyle") = stylePath
			    
			    ObjObserver.Notify Nil, Events.kWiredMessageStyleChanged
			  end if
			End Set
		#tag EndSetter
		Protected MessageStylePath As FolderItem
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mSoundSet As AdiumSoundSet
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mStatusIconSet As AdiumStatusIcons
	#tag EndProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("NewsPostedBounceInDock", FALSE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("NewsPostedBounceInDock") = value
			End Set
		#tag EndSetter
		Protected NewsPostedBounceInDock As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("NewsPostedBounceInDockForever", FALSE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("NewsPostedBounceInDockForever") = value
			End Set
		#tag EndSetter
		Protected NewsPostedBounceInDockForever As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("NewsPostedDisplayInNotificationCenter", FALSE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("NewsPostedDisplayInNotificationCenter") = value
			End Set
		#tag EndSetter
		Protected NewsPostedDisplayInNotificationCenter As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("NewsPostedPlayASound", TRUE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("NewsPostedPlayASound") = value
			End Set
		#tag EndSetter
		Protected NewsPostedPlayASound As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("NewsPostedPostInChat", FALSE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("NewsPostedPostInChat") = value
			End Set
		#tag EndSetter
		Protected NewsPostedPostInChat As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("NewsPostedSpeak", FALSE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("NewsPostedSpeak") = value
			End Set
		#tag EndSetter
		Protected NewsPostedSpeak As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  DIM styleName As String = mDefaults.Lookup("NewsStyle", Paths.DefaultNewsStyleName)
			  Return Paths.NewsStyles.Child(styleName)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  if (value <> Nil) AND (value.Exists) then
			    DIM stylePath As String = value.NativePath
			    stylePath = stylePath.Replace(Paths.NewsStyles.NativePath + "/", "")
			    mDefaults.Set("NewsStyle") = stylePath
			    
			    ObjObserver.Notify Nil, Events.kNewsStyleChanged
			  end if
			End Set
		#tag EndSetter
		Protected NewsStylePath As FolderItem
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("PrivateChatInvitationReceivedBounceInDock", FALSE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("PrivateChatInvitationReceivedBounceInDock") = value
			End Set
		#tag EndSetter
		Protected PrivateChatInvitationReceivedBounceInDock As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("PrivateChatInvitationReceivedBounceInDockForever", FALSE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("PrivateChatInvitationReceivedBounceInDockForever") = value
			End Set
		#tag EndSetter
		Protected PrivateChatInvitationReceivedBounceInDockForever As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("PrivateChatInvitationReceivedDisplayInNotificationCenter", FALSE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("PrivateChatInvitationReceivedDisplayInNotificationCenter") = value
			End Set
		#tag EndSetter
		Protected PrivateChatInvitationReceivedDisplayInNotificationCenter As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("PrivateChatInvitationReceivedPlayASound", TRUE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("PrivateChatInvitationReceivedPlayASound") = value
			End Set
		#tag EndSetter
		Protected PrivateChatInvitationReceivedPlayASound As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("PrivateChatInvitationReceivedPostInChat", TRUE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("PrivateChatInvitationReceivedPostInChat") = value
			End Set
		#tag EndSetter
		Protected PrivateChatInvitationReceivedPostInChat As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("PrivateChatInvitationReceivedSpeak", FALSE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("PrivateChatInvitationReceivedSpeak") = value
			End Set
		#tag EndSetter
		Protected PrivateChatInvitationReceivedSpeak As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("RequestNewsOnLogin", TRUE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("RequestNewsOnLogin") = value
			End Set
		#tag EndSetter
		Protected RequestNewsOnLogin As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("ServerConnectedBounceInDock", FALSE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("ServerConnectedBounceInDock") = value
			End Set
		#tag EndSetter
		Protected ServerConnectedBounceInDock As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("ServerConnectedBounceInDockForever", FALSE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("ServerConnectedBounceInDockForever") = value
			End Set
		#tag EndSetter
		Protected ServerConnectedBounceInDockForever As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("ServerConnectedDisplayInNotificationCenter", FALSE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("ServerConnectedDisplayInNotificationCenter") = value
			End Set
		#tag EndSetter
		Protected ServerConnectedDisplayInNotificationCenter As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("ServerConnectedPlayASound", TRUE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("ServerConnectedPlayASound") = value
			End Set
		#tag EndSetter
		Protected ServerConnectedPlayASound As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("ServerConnectedPostInChat", TRUE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("ServerConnectedPostInChat") = value
			End Set
		#tag EndSetter
		Protected ServerConnectedPostInChat As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("ServerConnectedSpeak", FALSE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("ServerConnectedSpeak") = value
			End Set
		#tag EndSetter
		Protected ServerConnectedSpeak As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("ServerDisconnectedBounceInDock", FALSE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("ServerDisconnectedBounceInDock") = value
			End Set
		#tag EndSetter
		Protected ServerDisconnectedBounceInDock As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("ServerDisconnectedBounceInDockForever", FALSE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("ServerDisconnectedBounceInDockForever") = value
			End Set
		#tag EndSetter
		Protected ServerDisconnectedBounceInDockForever As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("ServerDisconnectedDisplayInNotificationCenter", FALSE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("ServerDisconnectedDisplayInNotificationCenter") = value
			End Set
		#tag EndSetter
		Protected ServerDisconnectedDisplayInNotificationCenter As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("ServerDisconnectedPlayASound", TRUE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("ServerDisconnectedPlayASound") = value
			End Set
		#tag EndSetter
		Protected ServerDisconnectedPlayASound As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("ServerDisconnectedPostInChat", TRUE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("ServerDisconnectedPostInChat") = value
			End Set
		#tag EndSetter
		Protected ServerDisconnectedPostInChat As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("ServerDisconnectedSpeak", FALSE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("ServerDisconnectedSpeak") = value
			End Set
		#tag EndSetter
		Protected ServerDisconnectedSpeak As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  if (mSoundSet = Nil) then
			    DIM path As FolderItem = Paths.Sounds.Child(mDefaults.Lookup("SoundSet", Paths.DefaultSoundSetName))
			    mSoundSet = NEW AdiumSoundSet(path)
			  end if
			  
			  Return mSoundSet
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #Pragma Unused value
			End Set
		#tag EndSetter
		Protected SoundSet As AdiumSoundSet
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return Paths.Sounds.Child(mDefaults.Lookup("SoundSet", Paths.DefaultSoundSetName))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  if (value <> Nil) AND (value.Exists) then
			    mDefaults.Set("SoundSet") = value.Name
			  else
			    mDefaults.Set("SoundSet") = ""
			  end if
			  
			  mSoundSet = NEW AdiumSoundSet(value)
			End Set
		#tag EndSetter
		Protected SoundSetPath As FolderItem
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("SoundsetVolume", 100)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("SoundsetVolume") = value
			End Set
		#tag EndSetter
		Protected SoundsetVolume As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  DIM statusIconSetName As String = mDefaults.Lookup("StatusIconSet", Paths.DefaultStatusIconSetName)
			  
			  if (statusIconSetName <> "") AND (mStatusIconSet = Nil) AND (Paths.StatusIcons.Child(statusIconSetName).Exists) then
			    mStatusIconSet = NEW AdiumStatusIcons(Paths.StatusIcons.Child(statusIconSetName))
			  end if
			  
			  Return mStatusIconSet
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mStatusIconSet = value
			  
			  if (value = Nil) then
			    mDefaults.Set("StatusIconSet") = ""
			  else
			    DIM path As String = value.Path.NativePath
			    path = path.Replace(Paths.StatusIcons.NativePath, "")
			    mDefaults.Set("StatusIconSet") = path
			  end if
			  
			  ObjObserver.Notify Nil, Events.kWiredStatusIconSetChanged
			End Set
		#tag EndSetter
		Protected StatusIconSet As AdiumStatusIcons
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("TransferFinishedBounceInDock", FALSE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("TransferFinishedBounceInDock") = value
			End Set
		#tag EndSetter
		Protected TransferFinishedBounceInDock As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("TransferFinishedBounceInDockForever", FALSE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("TransferFinishedBounceInDockForever") = value
			End Set
		#tag EndSetter
		Protected TransferFinishedBounceInDockForever As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("TransferFinishedDisplayInNotificationCenter", FALSE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("TransferFinishedDisplayInNotificationCenter") = value
			End Set
		#tag EndSetter
		Protected TransferFinishedDisplayInNotificationCenter As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("TransferFinishedPlayASound", TRUE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("TransferFinishedPlayASound") = value
			End Set
		#tag EndSetter
		Protected TransferFinishedPlayASound As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("TransferFinishedPostInChat", FALSE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("TransferFinishedPostInChat") = value
			End Set
		#tag EndSetter
		Protected TransferFinishedPostInChat As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("TransferFinishedSpeak", FALSE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("TransferFinishedSpeak") = value
			End Set
		#tag EndSetter
		Protected TransferFinishedSpeak As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("TransferStartedBounceInDock", FALSE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("TransferStartedBounceInDock") = value
			End Set
		#tag EndSetter
		Protected TransferStartedBounceInDock As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("TransferStartedBounceInDockForever", FALSE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("TransferStartedBounceInDockForever") = value
			End Set
		#tag EndSetter
		Protected TransferStartedBounceInDockForever As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("TransferStartedDisplayInNotificationCenter", FALSE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("TransferStartedDisplayInNotificationCenter") = value
			End Set
		#tag EndSetter
		Protected TransferStartedDisplayInNotificationCenter As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("TransferStartedPlayASound", TRUE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("TransferStartedPlayASound") = value
			End Set
		#tag EndSetter
		Protected TransferStartedPlayASound As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("TransferStartedPostInChat", FALSE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("TransferStartedPostInChat") = value
			End Set
		#tag EndSetter
		Protected TransferStartedPostInChat As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("TransferStartedSpeak", FALSE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("TransferStartedSpeak") = value
			End Set
		#tag EndSetter
		Protected TransferStartedSpeak As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  DIM results As Picture
			  DIM iconName As String = mDefaults.Lookup("UserIconPath", "")
			  DIM iconPath As FolderItem = Paths.Icons.Child(iconName)
			  DIM iconClassicPath As FolderItem = NEW FolderItem(iconPath.NativePath, FolderItem.PathTypeNative)
			  results = Picture.Open(iconClassicPath)  // no need to do error checking on the path as this still returns a Nil
			  
			  Return results
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #Pragma Unused value
			End Set
		#tag EndSetter
		Protected UserIcon As Picture
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return Paths.Icons.Child(mDefaults.Lookup("UserIconPath", Paths.DefaultIconName))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  if (value <> Nil) AND (value.Exists) AND (not value.IsFolder) then
			    mDefaults.Set("UserIconPath") = value.Name
			  elseif (value = Nil) then
			    mDefaults.Set("UserIconPath") = ""
			  end if
			  ObjObserver.Notify Nil, Events.kMyUserIconChanged
			  
			End Set
		#tag EndSetter
		Protected UserIconPath As FolderItem
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("UserJoinedBounceInDock", FALSE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("UserJoinedBounceInDock") = value
			End Set
		#tag EndSetter
		Protected UserJoinedBounceInDock As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("UserJoinedBounceInDockForever", FALSE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("UserJoinedBounceInDockForever") = value
			End Set
		#tag EndSetter
		Protected UserJoinedBounceInDockForever As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("UserJoinedDisplayInNotificationCenter", FALSE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("UserJoinedDisplayInNotificationCenter") = value
			End Set
		#tag EndSetter
		Protected UserJoinedDisplayInNotificationCenter As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("UserJoinedPlayASound", TRUE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("UserJoinedPlayASound") = value
			End Set
		#tag EndSetter
		Protected UserJoinedPlayASound As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("UserJoinedPostInChat", TRUE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("UserJoinedPostInChat") = value
			End Set
		#tag EndSetter
		Protected UserJoinedPostInChat As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("UserJoinedSpeak", FALSE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("UserJoinedSpeak") = value
			End Set
		#tag EndSetter
		Protected UserJoinedSpeak As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("UserLeftBounceInDock", FALSE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("UserLeftBounceInDock") = value
			End Set
		#tag EndSetter
		Protected UserLeftBounceInDock As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("UserLeftBounceInDockForever", FALSE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("UserLeftBounceInDockForever") = value
			End Set
		#tag EndSetter
		Protected UserLeftBounceInDockForever As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("UserLeftDisplayInNotificationCenter", FALSE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("UserLeftDisplayInNotificationCenter") = value
			End Set
		#tag EndSetter
		Protected UserLeftDisplayInNotificationCenter As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("UserLeftPlayASound", TRUE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("UserLeftPlayASound") = value
			End Set
		#tag EndSetter
		Protected UserLeftPlayASound As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("UserLeftPostInChat", TRUE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("UserLeftPostInChat") = value
			End Set
		#tag EndSetter
		Protected UserLeftPostInChat As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("UserLeftSpeak", FALSE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("UserLeftSpeak") = value
			End Set
		#tag EndSetter
		Protected UserLeftSpeak As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("UserNick", Strings.kSwirlUser)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  if (NOT value.IsEmpty) then
			    mDefaults.Set("UserNick") = value.TrimRight
			    ObjObserver.Notify Nil, Events.kMyUserNickChanged, value.TrimRight
			  end if
			End Set
		#tag EndSetter
		Protected UserNick As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("UserNickChangedBounceInDock", FALSE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("UserNickChangedBounceInDock") = value
			End Set
		#tag EndSetter
		Protected UserNickChangedBounceInDock As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("UserNickChangedBounceInDockForever", FALSE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("UserNickChangedBounceInDockForever") = value
			End Set
		#tag EndSetter
		Protected UserNickChangedBounceInDockForever As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("UserNickChangedDisplayInNotificationCenter", FALSE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("UserNickChangedDisplayInNotificationCenter") = value
			End Set
		#tag EndSetter
		Protected UserNickChangedDisplayInNotificationCenter As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("UserNickChangedPlayASound", FALSE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("UserNickChangedPlayASound") = value
			End Set
		#tag EndSetter
		Protected UserNickChangedPlayASound As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("UserNickChangedPostInChat", TRUE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("UserNickChangedPostInChat") = value
			End Set
		#tag EndSetter
		Protected UserNickChangedPostInChat As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("UserNickChangedSpeak", FALSE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("UserNickChangedSpeak") = value
			End Set
		#tag EndSetter
		Protected UserNickChangedSpeak As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("UserStatus", Strings.kSwirlNewbie)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  // value can be empty
			  mDefaults.Set("UserStatus") = value
			  ObjObserver.Notify Nil, Events.kMyUserStatusChanged, value
			End Set
		#tag EndSetter
		Protected UserStatus As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("UserStatusChangedBounceInDock", FALSE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("UserStatusChangedBounceInDock") = value
			End Set
		#tag EndSetter
		Protected UserStatusChangedBounceInDock As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("UserStatusChangedBounceInDockForever", FALSE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("UserStatusChangedBounceInDockForever") = value
			End Set
		#tag EndSetter
		Protected UserStatusChangedBounceInDockForever As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("UserStatusChangedDisplayInNotificationCenter", FALSE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("UserStatusChangedDisplayInNotificationCenter") = value
			End Set
		#tag EndSetter
		Protected UserStatusChangedDisplayInNotificationCenter As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("UserStatusChangedPlayASound", FALSE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("UserStatusChangedPlayASound") = value
			End Set
		#tag EndSetter
		Protected UserStatusChangedPlayASound As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("UserStatusChangedPostInChat", TRUE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("UserStatusChangedPostInChat") = value
			End Set
		#tag EndSetter
		Protected UserStatusChangedPostInChat As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mDefaults.Lookup("UserStatusChangedSpeak", FALSE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaults.Set("UserStatusChangedSpeak") = value
			End Set
		#tag EndSetter
		Protected UserStatusChangedSpeak As Boolean
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
