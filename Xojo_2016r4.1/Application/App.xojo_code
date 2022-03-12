#tag Class
Protected Class App
Inherits Application
	#tag Event
		Function CancelClose() As Boolean
		  DIM returnValue As Boolean = FALSE
		  
		  if (Prefs.ConfirmApplicationQuit) then
		    select case MsgBox(Strings.kAreYouSureYouWantToQuit, 33)
		    case 1  // OK
		      me.mIsQuitting = TRUE
		    case 2  // Cancel
		      returnValue = TRUE
		      me.mIsQuitting = FALSE
		    end select
		  else
		    me.mIsQuitting = TRUE
		  end if
		  
		  if (me.mIsQuitting) then
		    Prefs.SavePreferences
		  end if
		  
		  Return returnValue
		End Function
	#tag EndEvent

	#tag Event
		Sub Close()
		  #if not TargetCocoa
		    if (me.mTrayItem <> Nil) then
		      me.RemoveTrayItem me.mTrayItem
		    end if
		  #endif
		End Sub
	#tag EndEvent

	#tag Event
		Sub EnableMenuItems()
		  '#if TargetCocoa
		  'if (not Window(0) IsA ssWiredChatWindow) then
		  'WindowCloseWindow.KeyboardShortcut = Strings.kCloseWindowShortcut
		  'WindowCloseTab.KeyboardShortcut = Strings.kCloseTabShortcut
		  'end if
		  'WindowCloseWindow.Enabled = (Window(0).Visible)
		  '#endif
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  me.InitMenuBar
		  
		  // move the default bundles, if needed
		  self.EnsureDefaultTheme
		  
		  // listen for notifications
		  ObjObserver.Listen self, Events.kWiredConnectionChatReceived
		  ObjObserver.Listen self, Events.kWiredConnectionChatTopicReceived
		  ObjObserver.Listen self, Events.kWiredConnectionLoginSuccessful
		  ObjObserver.Listen self, Events.kWiredConnectionMessageReceived
		  ObjObserver.Listen self, Events.kWiredConnectionNewsPosted
		  ObjObserver.Listen self, Events.kWiredConnectionPrivateChatCreated
		  ObjObserver.Listen self, Events.kWiredConnectionPrivateChatInvitationReceived
		  ObjObserver.Listen self, Events.kWiredConnectionUserChanged
		  ObjObserver.Listen self, Events.kWiredConnectionUserJoined
		  ObjObserver.Listen self, Events.kWiredConnectionUserKicked
		  ObjObserver.Listen self, Events.kWiredConnectionUserLeft
		  
		  // macOS sleep/power notification
		  #if TargetCocoa
		    if (me.mNSWorkspace = Nil) then
		      me.mNSWorkspace = NSWorkspace.Create
		      AddHandler me.mNSWorkspace.NSWorkspaceWillPowerOffNotification, WeakAddressOf NSWorkspaceWillPowerOffNotificationHandler
		      AddHandler me.mNSWorkspace.NSWorkspaceWillSleepNotification, WeakAddressOf NSWorkspaceWillSleepNotificationHandler
		    end if
		  #endif
		  
		  // default windows
		  ChatWindow.Show
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function ConnectionConnect() As Boolean Handles ConnectionConnect.Action
			ChatWindow.ShowConnectTab
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function HelpAbout() As Boolean Handles HelpAbout.Action
			SwirlAboutWindow.Show
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function PrefsEvents() As Boolean Handles PrefsEvents.Action
			SwirlPrefsEventsWindow.Show
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function PrefsGeneral() As Boolean Handles PrefsGeneral.Action
			SwirlPrefsGeneralWIndow.Show
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function PrefsIcons() As Boolean Handles PrefsIcons.Action
			SwirlPrefsIconsWindow.Show
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function PrefsMessageStyles() As Boolean Handles PrefsMessageStyles.Action
			SwirlPrefsMessageStylesWindow.Show
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function PrefsNewsStyles() As Boolean Handles PrefsNewsStyles.Action
			SwirlPrefsNewsWindow.Show
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function PrefsStatusIcons() As Boolean Handles PrefsStatusIcons.Action
			SwirlPrefsStatusIconsWindow.Show
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function WindowClosewindow() As Boolean Handles WindowClosewindow.Action
			if (Window(0).Visible) then
			Window(0).Close
			end if
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h21
		Private Function ConstructTrayItemMenu(aTrayItem As Variant, base As MenuItem, cause As Integer, x As Integer, y As Integer) As Boolean
		  ' #Pragma Unused aTrayItem
		  ' 
		  ' 
		  
		  ' 
		  ' Return kEventHandled
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CopySourceFolderToDestinationFolder(source As Xojo.IO.FolderItem, destination As Xojo.IO.FolderItem)
		  DIM newFolder As Xojo.IO.FolderItem
		  
		  if (source.IsFolder) then
		    newFolder = destination.Child(source.Name)
		    newFolder.CreateAsFolder
		    
		    for each f As Xojo.IO.FolderItem in source.Children
		      if (f.IsFolder) then
		        CopySourceFolderToDestinationFolder f, newFolder
		      else
		        f.CopyTo newFolder
		      end if
		    next
		    
		  else
		    source.CopyTo destination
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EnsureDefaultTheme()
		  // Emoticons
		  if (NOT Paths.Emoticons.Child(Paths.DefaultEmoticonSetName).Exists) AND (Paths.DefaultEmoticonSet.Exists) then
		    CopySourceFolderToDestinationFolder Paths.DefaultEmoticonSet, Paths.Emoticons
		  end if
		  
		  // Message Style
		  if (NOT Paths.MessageStyles.Child(Paths.DefaultMessageStyleName).Exists) AND (Paths.DefaultMessageStyle.Exists) then
		    CopySourceFolderToDestinationFolder Paths.DefaultMessageStyle, Paths.MessageStyles
		  end if
		  
		  // News Style
		  if (NOT Paths.NewsStyles.Child(Paths.DefaultNewsStyleName).Exists) AND (Paths.DefaultNewsStyle.Exists) then
		    CopySourceFolderToDestinationFolder Paths.DefaultNewsStyle, Paths.NewsStyles
		  end if
		  
		  // Sound set
		  if (NOT Paths.Sounds.Child(Paths.DefaultSoundSetName).Exists) AND (Paths.DefaultSoundSet.Exists) then
		    CopySourceFolderToDestinationFolder Paths.DefaultSoundSet, Paths.Sounds
		  end if
		  
		  // Status Icons
		  if (NOT Paths.StatusIcons.Child(Paths.DefaultStatusIconSetName).Exists) AND (Paths.DefaultStatusIconSet.Exists) then
		    CopySourceFolderToDestinationFolder Paths.DefaultStatusIconSet, Paths.StatusIcons
		  end if
		  
		  // Icon
		  if (NOT Paths.Icons.Child(Paths.DefaultIconName).Exists) AND (Paths.DefaultIcon.Exists) then
		    CopySourceFolderToDestinationFolder Paths.DefaultIcon, Paths.Icons
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub InitMenuBar()
		  '#if TargetCocoa
		  'ConnectionReconnect.SetAlternate = TRUE
		  'ConnectionDisconnectAll.SetAlternate = TRUE
		  'ConnectionServerInfo.SetAlternate = TRUE
		  'EditPasteAsText.SetAlternate = TRUE
		  'EditClearAllChats.SetAlternate = TRUE
		  ''ViewToggleToolbarSeparator.Visible = FALSE
		  ''ViewToggleToolbar.Visible = FALSE
		  #if TargetWindows OR TargetLinux
		    self.MenuBar.Visible = FALSE
		    
		    if (me.mTrayItem = Nil) then
		      me.mTrayItem = NEW AppTrayItem
		      me.mTrayItem.Icon = spiralgalaxy16
		      Call App.AddTrayItem(me.mTrayItem)
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub NSWorkspaceWillPowerOffNotificationHandler(workspace As NSWorkspace)
		  #pragma Unused workspace
		  
		  ObjObserver.Notify self, Events.kNSWorkspaceWillPowerOff
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub NSWorkspaceWillSleepNotificationHandler(workspace As NSWorkspace)
		  #pragma Unused workspace
		  
		  ObjObserver.Notify self, Events.kNSWorkspaceWillSleep
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RemoveEntireFolder(theFolder As Xojo.IO.FolderItem, continueIfErrors As Boolean = False) As Integer
		  // Returns an error code if it fails, or zero if the folder was removed successfully
		  
		  DIM returnCode, lastError As Integer
		  DIM files(), folders() As Xojo.IO.FolderItem
		  
		  If theFolder = Nil Or Not theFolder.Exists Then
		    Return 0
		  End If
		  
		  // Collect the folder‘s contents first.
		  // This is faster than collecting them in reverse order and removing them right away!
		  For Each item As Xojo.IO.FolderItem In theFolder.Children
		    If item.Exists Then
		      If item.IsFolder Then
		        folders.Append(item)
		      Else
		        files.Append(item)
		      End If
		    End If
		  Next
		  
		  // Now remove the files
		  For Each file As Xojo.IO.FolderItem In files
		    Try
		      file.Delete
		    Catch error As IOException
		      If error.ErrorNumber <> 0 Then
		        If continueIfErrors Then
		          If returnCode = 0 Then returnCode = lastError
		        Else
		          // Return the error code if any. This will cancel the deletion.
		          Return lastError
		        End If
		      End If
		    End Try
		  Next
		  
		  REDIM files(-1) // free the memory used by the files array before we enter recursion
		  
		  // Now remove the folders
		  For Each f As Xojo.IO.FolderItem In folders
		    lastError = RemoveEntireFolder(f, continueIfErrors)
		    If lastError <> 0 Then
		      If continueIfErrors Then
		        If returnCode = 0 Then returnCode = lastError
		      Else
		        // Return the error code if any. This will cancel the removal.
		        Return lastError
		      End If
		    End If
		  Next
		  
		  If returnCode = 0 Then
		    // We‘re done without error, so the folder should be empty and we can remove it.
		    Try
		      theFolder.Delete
		    Catch error As IOException
		      returnCode = error.ErrorNumber
		    End Try
		  End If
		  
		  Return returnCode
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WiredConnectionChatReceived(connection As WiredConnection, chatID As Integer, user As WiredUser, message As Text, isAction As Boolean)
		  #Pragma Unused connection
		  #Pragma Unused chatID
		  #Pragma Unused isAction
		  
		  DIM msg As Text = Strings.kUserSaid
		  msg = msg.Replace("%nick%", user.Nick)
		  msg = msg.Replace("%message%", message)
		  
		  if (Prefs.ChatReceivedBounceInDock) then
		    Notifications.RequestUserAttention Prefs.ChatReceivedBounceInDockForever
		  end if
		  
		  if (Prefs.ChatReceivedDisplayInNotificationCenter) then
		    Notifications.PostUserNotification Strings.kChatReceived, user.Nick, msg, user.Icon
		  end if
		  
		  if (Prefs.ChatReceivedPlayASound) AND (Prefs.SoundSet <> Nil) AND (Prefs.SoundSet.ChatReceived <> Nil) then
		    Prefs.SoundSet.ChatReceived.Volume = Prefs.SoundSetVolume
		    Prefs.SoundSet.ChatReceived.Play
		  end if
		  
		  if (Prefs.ChatReceivedSpeak) then
		    Speak msg
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WiredConnectionChatTopicReceived(connection As WiredConnection, chatID As Integer, nick As Text, login As Text, IP As Text, time As Xojo.Core.Date, topic As Text)
		  #Pragma Unused connection
		  #Pragma Unused chatID
		  #Pragma Unused login
		  #Pragma Unused IP
		  #Pragma Unused time
		  #Pragma Unused topic
		  
		  DIM message As Text = Strings.kUserSetTopic
		  message = message.Replace("%nick%", nick)
		  
		  if (Prefs.ChatTopicChangedBounceInDock) then
		    Notifications.RequestUserAttention Prefs.ChatTopicChangedBounceInDockForever
		  end if
		  
		  if (Prefs.ChatTopicChangedDisplayInNotificationCenter) then
		    Notifications.PostUserNotification Strings.kChatTopicChanged, nick, message, Nil
		  end if
		  
		  if (Prefs.ChatTopicChangedSpeak) then
		    Speak message
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WiredConnectionLoginSuccessful(connection As WiredConnection)
		  #Pragma Unused connection
		  
		  DIM message As Text = Strings.kConnectedToServerName
		  message = message.Replace("%servername%", connection.ServerName)
		  
		  if (Prefs.ServerConnectedBounceInDock) then
		    Notifications.RequestUserAttention Prefs.ServerConnectedBounceInDockForever
		  end if
		  
		  if (Prefs.ServerConnectedDisplayInNotificationCenter) then
		    Notifications.PostUserNotification Strings.kServerConnected, "", message, Nil
		  end if
		  
		  if (Prefs.ServerConnectedPlayASound) AND (Prefs.SoundSet <> Nil) AND (Prefs.SoundSet.ServerConnected <> Nil) then
		    Prefs.SoundSet.ServerConnected.Volume = Prefs.SoundSetVolume
		    Prefs.SoundSet.ServerConnected.Play
		  end if
		  
		  if (Prefs.ServerConnectedSpeak) then
		    Speak message
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WiredConnectionMessageReceived(connection As WiredConnection, user As WiredUser, message As Text, isBroadcast As Boolean)
		  #Pragma Unused isBroadcast
		  
		  DIM win As SwirlMessagesWin = SwirlMessagesWin.MessageWindowExists(connection, user)
		  if (win = Nil) then
		    win = NEW SwirlMessagesWin(connection, user)
		    win.Show message
		  else
		    win.Show
		  end if
		  
		  DIM eventMessage As Text = Strings.kUserSaid
		  eventMessage = eventMessage.Replace("%nick%", user.Nick)
		  eventMessage = eventMessage.Replace("%message%", message)
		  
		  if (Prefs.MessageReceivedBounceInDock) then
		    Notifications.RequestUserAttention Prefs.MessageReceivedBounceInDockForever
		  end if
		  
		  if (Prefs.MessageReceivedDisplayInNotificationCenter) then
		    Notifications.PostUserNotification Strings.kMessageReceived, user.Nick, eventMessage, user.Icon
		  end if
		  
		  if (Prefs.MessageReceivedPlayASound) AND (Prefs.SoundSet <> Nil) AND (Prefs.SoundSet.MessageReceived <> Nil) then
		    Prefs.SoundSet.MessageReceived.Volume = Prefs.SoundSetVolume
		    Prefs.SoundSet.MessageReceived.Play
		  end if
		  
		  if (Prefs.MessageReceivedSpeak) then
		    Speak eventMessage
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WiredConnectionNewsPosted(connection As WiredConnection, nick As Text, time As Xojo.Core.Date, message As Text)
		  #Pragma Unused connection
		  
		  DIM eventMessage As Text = Strings.kNewsPostedByOn
		  eventMessage = eventMessage.Replace("%nick%", nick)
		  eventMessage = eventMessage.Replace("%date%", if (time = Nil, "" ,time.ToText))
		  
		  if (Prefs.NewsPostedBounceInDock) then
		    Notifications.RequestUserAttention Prefs.NewsPostedBounceInDockForever
		  end if
		  
		  if (Prefs.NewsPostedDisplayInNotificationCenter) then
		    Notifications.PostUserNotification Strings.kNewsPosted, nick, eventMessage, Nil
		  end if
		  
		  if (Prefs.NewsPostedPlayASound) AND (Prefs.SoundSet <> Nil) AND (Prefs.SoundSet.NewsPosted <> Nil) then
		    Prefs.SoundSet.NewsPosted.Volume = Prefs.SoundSetVolume
		    Prefs.SoundSet.NewsPosted.Play
		  end if
		  
		  if (Prefs.NewsPostedSpeak) then
		    Speak eventMessage
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WiredConnectionPrivateChatCreated(connection As WiredConnection, chatID As Integer, userID As Integer)
		  DIM win As NEW PrivateChatWindow(connection, chatID)
		  win.Show
		  
		  connection.InviteUserToPrivateChat userID, chatID
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WiredConnectionPrivateChatInvitationReceived(connection As WiredConnection, chatID As Integer, user As WiredUser)
		  DIM win As NEW PrivateChatInvitationWindow(connection, chatID, user)
		  win.Show
		  
		  if (Prefs.PrivateChatInvitationReceivedBounceInDock) then
		    Notifications.RequestUserAttention Prefs.PrivateChatInvitationReceivedBounceInDockForever
		  end if
		  
		  if (Prefs.PrivateChatInvitationReceivedDisplayInNotificationCenter) then
		    Notifications.PostUserNotification Strings.kPrivateChatInvitationReceived, user.Nick, Strings.kPrivateChatInvitationReceived, user.Icon
		  end if
		  
		  if (Prefs.PrivateChatInvitationReceivedPlayASound) AND (Prefs.SoundSet <> Nil) AND (Prefs.SoundSet.PrivateChatInvitationReceived <> Nil) then
		    Prefs.SoundSet.PrivateChatInvitationReceived.Volume = Prefs.SoundSetVolume
		    Prefs.SoundSet.PrivateChatInvitationReceived.Play
		  end if
		  
		  if (Prefs.PrivateChatInvitationReceivedSpeak) then
		    Speak Strings.kPrivateChatInvitationReceived
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WiredConnectionUserChanged(connection As WiredConnection, oldUser As WiredUser, newUser As WiredUser)
		  #Pragma Unused connection
		  
		  DIM message As Text = Strings.kIsNowKnownAs
		  message = message.Replace("%oldnick%", oldUser.Nick)
		  message = message.Replace("%newnick%", newUser.Nick)
		  
		  if (Prefs.UserNickChangedBounceInDock) then
		    Notifications.RequestUserAttention Prefs.UserNickChangedBounceInDockForever
		  end if
		  
		  if (Prefs.UserNickChangedDisplayInNotificationCenter) then
		    Notifications.PostUserNotification Strings.kUserNickChanged, newUser.Nick, message, newUser.Icon
		  end if
		  
		  if (Prefs.UserNickChangedPlayASound) AND (Prefs.SoundSet <> Nil) AND (Prefs.SoundSet.UserNickChanged <> Nil) then
		    Prefs.SoundSet.UserNickChanged.Volume = Prefs.SoundSetVolume
		    Prefs.SoundSet.UserNickChanged.Play
		  end if
		  
		  if (Prefs.UserNickChangedSpeak) then
		    Speak message
		  end if
		  
		  
		  message = Strings.kUserStatusChangedTo
		  message = message.Replace("%nick%", newUser.Nick)
		  message = message.Replace("%status%", newUser.Status)
		  
		  if (Prefs.UserStatusChangedBounceInDock) then
		    Notifications.RequestUserAttention Prefs.UserStatusChangedBounceInDockForever
		  end if
		  
		  if (Prefs.UserStatusChangedDisplayInNotificationCenter) then
		    Notifications.PostUserNotification Strings.kUserStatusChanged, newUser.Nick, message, newUser.Icon
		  end if
		  
		  if (Prefs.UserStatusChangedPlayASound) AND (Prefs.SoundSet <> Nil) AND (Prefs.SoundSet.UserStatusChanged <> Nil) then
		    Prefs.SoundSet.UserStatusChanged.Volume = Prefs.SoundSetVolume
		    Prefs.SoundSet.UserStatusChanged.Play
		  end if
		  
		  if (Prefs.UserStatusChangedSpeak) then
		    Speak message
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WiredConnectionUserJoined(connection As WiredConnection, chatID As Integer, user As WiredUser)
		  #Pragma Unused connection
		  #Pragma Unused chatID
		  
		  DIM message As Text = Strings.kUserHasJoined
		  message = message.Replace("%nick%", user.Nick)
		  
		  if (Prefs.UserJoinedBounceInDock) then
		    Notifications.RequestUserAttention Prefs.UserJoinedBounceInDockForever
		  end if
		  
		  if (Prefs.UserJoinedDisplayInNotificationCenter) then
		    Notifications.PostUserNotification Strings.kUserJoined, user.Nick, message, user.Icon
		  end if
		  
		  if (Prefs.UserJoinedPlayASound) AND (Prefs.SoundSet <> Nil) AND (Prefs.SoundSet.UserJoined <> Nil) then
		    Prefs.SoundSet.UserJoined.Volume = Prefs.SoundSetVolume
		    Prefs.SoundSet.UserJoined.Play
		  end if
		  
		  if (Prefs.UserJoinedSpeak) then
		    Speak message
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WiredConnectionUserKicked(connection As WiredConnection, victim As WiredUser, killer As WiredUser, kickMessage As Text, isBan As Boolean)
		  #Pragma Unused connection
		  
		  DIM message As Text = if(kickMessage.Empty, Strings.kUserWasKickedBy, Strings.kUserWasKickedByWithMessage)
		  if (isBan) then
		    message = if(kickMessage.Empty, Strings.kUserWasBannedBy, Strings.kUserWasBannedByWithMessage)
		  end if
		  message = message.Replace("%victim%", victim.Nick)
		  message = message.Replace("%killer%", killer.Nick)
		  message = message.Replace("%message%", kickMessage)
		  
		  if (Prefs.UserLeftBounceInDock) then
		    Notifications.RequestUserAttention Prefs.UserLeftBounceInDockForever
		  end if
		  
		  if (Prefs.UserLeftDisplayInNotificationCenter) then
		    Notifications.PostUserNotification Strings.kUserLeft, victim.Nick, message, victim.Icon
		  end if
		  
		  if (Prefs.UserLeftPlayASound) AND (Prefs.SoundSet <> Nil) AND (Prefs.SoundSet.UserLeft <> Nil) then
		    Prefs.SoundSet.UserLeft.Volume = Prefs.SoundSetVolume
		    Prefs.SoundSet.UserLeft.Play
		  end if
		  
		  if (Prefs.UserLeftSpeak) then
		    Speak message
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WiredConnectionUserLeft(connection As WiredConnection, chatID As Integer, user As WiredUser)
		  #Pragma Unused connection
		  #Pragma Unused chatID
		  
		  DIM message As Text = Strings.kUserHasLeft
		  message = message.Replace("%nick%", user.Nick)
		  
		  if (Prefs.UserLeftBounceInDock) then
		    Notifications.RequestUserAttention Prefs.UserLeftBounceInDockForever
		  end if
		  
		  if (Prefs.UserLeftDisplayInNotificationCenter) then
		    Notifications.PostUserNotification Strings.kUserLeft, user.Nick, message, user.Icon
		  end if
		  
		  if (Prefs.UserLeftPlayASound) AND (Prefs.SoundSet <> Nil) AND (Prefs.SoundSet.UserLeft <> Nil) then
		    Prefs.SoundSet.UserLeft.Volume = Prefs.SoundSetVolume
		    Prefs.SoundSet.UserLeft.Play
		  end if
		  
		  if (Prefs.UserLeftSpeak) then
		    Speak message
		  end if
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return me.mIsQuitting
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #Pragma Unused value
			End Set
		#tag EndSetter
		IsQuitting As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mIsQuitting As Boolean = FALSE
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mNSWorkspace As NSWorkspace
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTrayItem As AppTrayItem
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="IsQuitting"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
