#tag Window
Begin ContainerControl ChatContainer
   AcceptFocus     =   False
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   Compatibility   =   ""
   DoubleBuffer    =   False
   Enabled         =   True
   EraseBackground =   True
   HasBackColor    =   False
   Height          =   472
   HelpTag         =   ""
   InitialParent   =   ""
   Left            =   0
   LockBottom      =   True
   LockLeft        =   True
   LockRight       =   True
   LockTop         =   True
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   True
   Top             =   0
   Transparent     =   False
   UseFocusRing    =   False
   Visible         =   True
   Width           =   780
   Begin CustomChatInput ChatInput
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   True
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   80
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   False
      Left            =   202
      LimitText       =   0
      LineHeight      =   0.0
      LineSpacing     =   1.0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Mask            =   ""
      Multiline       =   True
      ReadOnly        =   False
      Scope           =   2
      ScrollbarHorizontal=   False
      ScrollbarVertical=   True
      Styled          =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   392
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   False
      Visible         =   True
      Width           =   578
   End
   Begin Listbox UserList
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   False
      ColumnCount     =   1
      ColumnsResizable=   False
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   46
      Enabled         =   True
      EnableDrag      =   True
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   False
      HeadingIndex    =   -1
      Height          =   472
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   2
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      ShowDropIndicator=   False
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   0
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   False
      Visible         =   True
      Width           =   201
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin UIChatViewer ChatLog
      AutoDeactivate  =   True
      DefaultFontSize =   0
      Enabled         =   True
      Height          =   391
      HelpTag         =   ""
      Index           =   -2147483648
      Left            =   202
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Renderer        =   1
      Scope           =   2
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      Visible         =   True
      Width           =   578
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Close()
		  ObjObserver.Unlisten self, Events.kWiredConnectionChatReceived
		  ObjObserver.Unlisten self, Events.kWiredConnectionChatTopicReceived
		  ObjObserver.Unlisten self, Events.kWiredConnectionDisconnected
		  ObjObserver.Unlisten self, Events.kWiredConnectionLoginSuccessful
		  ObjObserver.Unlisten self, Events.kWiredConnectionNewsPosted
		  ObjObserver.Unlisten self, Events.kWiredConnectionPrivateChatDeclined
		  ObjObserver.Unlisten self, Events.kWiredConnectionUserChanged
		  ObjObserver.Unlisten self, Events.kWiredConnectionUserIconChanged
		  ObjObserver.Unlisten self, Events.kWiredConnectionUserJoined
		  ObjObserver.Unlisten self, Events.kWiredConnectionUserKicked
		  ObjObserver.Unlisten self, Events.kWiredConnectionUserLeft
		  ObjObserver.Unlisten self, Events.kWiredConnectionUserListEntry
		  ObjObserver.Unlisten self, Events.kWiredMessageStyleChanged
		  
		  if (self.mChatID = 1) then
		    self.mConnection.Disconnect
		  else
		    self.mConnection.LeavePrivateChat self.mChatID
		  end if
		End Sub
	#tag EndEvent

	#tag Event
		Sub EnableMenuItems()
		  if (self.mChatID = 1) AND (self.TabPanelIndex -1 = PagePanel(self.Parent).Value) then
		    ConnectionReconnect.Enabled = NOT self.mConnection.IsConnected
		    ConnectionDisconnect.Enabled = self.mConnection.IsConnected
		  end if
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  self.WiredConnectionLoginSuccessful self.mConnection
		  
		  if (self.mChatID = 1) then
		    ObjObserver.Listen self, Events.kNSWorkspaceWillPowerOff
		    ObjObserver.Listen self, Events.kNSWorkspaceWillSleep
		  end if
		  
		  ObjObserver.Listen self, Events.kWiredConnectionChatReceived
		  ObjObserver.Listen self, Events.kWiredConnectionChatTopicReceived
		  ObjObserver.Listen self, Events.kWiredConnectionDisconnected
		  ObjObserver.Listen self, Events.kWiredConnectionLoginSuccessful
		  ObjObserver.Listen self, Events.kWiredConnectionNewsPosted
		  ObjObserver.Listen self, Events.kWiredConnectionPrivateChatDeclined
		  ObjObserver.Listen self, Events.kWiredConnectionUserChanged
		  ObjObserver.Listen self, Events.kWiredConnectionUserIconChanged
		  ObjObserver.Listen self, Events.kWiredConnectionUserJoined
		  ObjObserver.Listen self, Events.kWiredConnectionUserKicked
		  ObjObserver.Listen self, Events.kWiredConnectionUserLeft
		  ObjObserver.Listen self, Events.kWiredConnectionUserListEntry
		  ObjObserver.Listen self, Events.kWiredMessageStyleChanged
		  ObjObserver.Listen self, Events.kWiredMessageStyleFontSizeChanged
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function ConnectionDisconnect() As Boolean Handles ConnectionDisconnect.Action
			if (self.mChatID = 1) AND (self.TabPanelIndex -1 = PagePanel(self.Parent).Value) then
			self.mConnection.Disconnect
			Return True
			else
			Return FALSE
			end if
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ConnectionReconnect() As Boolean Handles ConnectionReconnect.Action
			if (self.mChatID = 1) AND (self.TabPanelIndex -1 = PagePanel(self.Parent).Value) then
			self.mConnection.Reconnect
			Return True
			else
			Return FALSE
			end if
			
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h21
		Private Sub AddUser(user As WiredUser)
		  self.UserList.AddRow ""
		  self.UserList.CellTag(self.UserList.LastIndex, 1) = user.UserID
		  self.UserList.RowTag(self.UserList.LastIndex) = user
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(connection As WiredConnection, chatID As Integer)
		  self.mConnection = connection
		  self.mChatID = chatID
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub NSWorkspaceWillPowerOff(sender As Object)
		  #Pragma Unused sender
		  
		  self.mConnection.Disconnect
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub NSWorkspaceWillSleep(sender As Object)
		  #Pragma Unused sender
		  
		  self.mConnection.Disconnect
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RemoveUser(user As WiredUser)
		  for i as Integer = (self.UserList.ListCount - 1) DownTo 0
		    if (self.UserList.CellTag(i, 1) = user.UserID) then
		      self.UserList.RemoveRow i
		      exit for i
		    end if
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetChatLogFontSize(size As Integer)
		  
		  if (size = 0) then
		    self.ChatLog.ExecuteJavaScript "document.body.style.fontSize='" + self.ChatLog.DefaultFontSize.ToText + "px';"
		    self.ChatInput.TextSize = self.ChatLog.DefaultFontSize
		  else
		    self.ChatLog.ExecuteJavaScript "document.body.style.fontSize='" + size.ToText + "px';"
		    self.ChatInput.TextSize = size
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UpdateUser(user As WiredUser)
		  for i As Integer = (self.UserList.ListCount - 1) DownTo 0
		    if (self.UserList.CellTag(i, 1) = user.UserID) then
		      self.UserList.RowTag(i) = user
		      self.UserList.InvalidateCell i, 0
		      exit for i
		    end if
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WiredConnectionChatReceived(connection As WiredConnection, chatID As Integer, user As WiredUser, message As Text, isAction As Boolean)
		  if (connection = self.mConnection) AND (chatID = self.mChatID) then
		    if (isAction) then
		      self.ChatLog.AppendNotification Xojo.Core.Date.Now, UIChatViewer.Notification, user.Nick + " " + message
		    else
		      self.ChatLog.AppendChat Xojo.Core.Date.Now, user.UserID, user.Nick, user.Icon, message, (user.UserID <> connection.MyUserID)
		    end if
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WiredConnectionChatTopicReceived(connection As WiredConnection, chatID As Integer, nick As Text, login As Text, IP As Text, time As Xojo.Core.Date, topic As Text)
		  #Pragma Unused login
		  #Pragma Unused IP
		  #Pragma Unused time
		  
		  if (connection = self.mConnection) AND (chatID = self.mChatID) AND (Prefs.ChatTopicChangedPostInChat) then
		    DIM message As Text = Strings.kUserSetTopic
		    message = message.Replace("%nick%", nick)
		    message = message + " - " + topic
		    
		    self.ChatLog.AppendNotification Xojo.Core.Date.Now, UIChatViewer.Notification, message
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WiredConnectionDisconnected(connection As WiredConnection)
		  if (connection = self.mConnection) then
		    self.UserList.Refresh
		    self.ChatInput.Enabled = False
		    
		    if (Prefs.ServerDisconnectedPostInChat) then
		      DIM message As Text = Strings.kDisconnectedFromServerName
		      message = message.Replace("%servername%", connection.ServerName)
		      self.ChatLog.AppendNotification Xojo.Core.Date.Now, UIChatViewer.Notification, message
		    end if
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WiredConnectionLoginSuccessful(connection As WiredConnection)
		  if (connection = self.mConnection) then
		    self.UserList.DeleteAllRows
		    connection.RequestUserList self.mChatID
		    self.ChatInput.Enabled = TRUE
		    
		    DIM message As Text = Strings.kConnectedToServerName
		    message = message.Replace("%servername%", self.mConnection.ServerName)
		    
		    if (Prefs.ServerConnectedPostInChat) then
		      self.ChatLog.AppendNotification Xojo.Core.Date.Now, "notification", message
		    end if
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WiredConnectionNewsPosted(connection As WiredConnection, nick As Text, time As Xojo.Core.Date, message As Text)
		  #Pragma Unused message
		  
		  if (connection = self.mConnection) AND (self.mChatID = 1) AND (Prefs.NewsPostedPostInChat) then
		    DIM eventMessage As Text = Strings.kNewsPostedByOn
		    eventMessage = eventMessage.Replace("%nick%", nick)
		    eventMessage = eventMessage.Replace("%date%", time.ToText)
		    
		    self.ChatLog.AppendNotification Xojo.Core.Date.Now, UIChatViewer.Notification, eventMessage
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WiredConnectionPrivateChatDeclined(connection As WiredConnection, chatID As Integer, user As WiredUser)
		  if (connection = self.mConnection) AND (chatID = self.mChatID) then
		    DIM message As Text = Strings.kUserHasDeclinedInvitation
		    message = message.Replace("%nick%", user.Nick)
		    
		    self.ChatLog.AppendNotification Xojo.Core.Date.Now, "notification", message
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WiredConnectionUserChanged(connection As WiredConnection, oldUser As WiredUser, newUser As WiredUser)
		  if (connection = self.mConnection) then
		    if (Prefs.UserNickChangedPostInChat) AND (oldUser.Nick <> newUser.Nick) then
		      DIM message As Text = Strings.kIsNowKnownAs
		      message = message.Replace("%oldnick%", oldUser.Nick)
		      message = message.Replace("%newnick%", newUser.Nick)
		      self.ChatLog.AppendNotification Xojo.Core.Date.Now, UIChatViewer.NickChanged, message
		    end if
		    
		    if (Prefs.UserStatusChangedPostInChat) AND (oldUser.Status <> newUser.Status) then
		      DIM message As Text = Strings.kUserStatusChangedTo
		      message = message.Replace("%nick%", newUser.Nick)
		      message = message.Replace("%status%", newUser.Status)
		      self.ChatLog.AppendNotification Xojo.Core.Date.Now, UIChatViewer.Notification, message
		    end if
		    
		    self.UpdateUser newUser
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WiredConnectionUserIconChanged(connection As WiredConnection, user As WiredUser)
		  if (connection = self.mConnection) then
		    self.UpdateUser user
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WiredConnectionUserJoined(connection As WiredConnection, chatID As Integer, user As WiredUser)
		  if (connection = self.mConnection) AND (chatID = self.mChatID) then
		    self.AddUser user
		    
		    if (Prefs.UserJoinedPostInChat) then
		      DIM message As Text = Strings.kUserHasJoined
		      message = message.Replace("%nick%", user.Nick)
		      
		      self.ChatLog.AppendNotification Xojo.Core.Date.Now, UIChatViewer.ContactJoined, message
		    end if
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WiredConnectionUserKicked(connection As WiredConnection, victim As WiredUser, killer As WiredUser, kickMessage As Text, isBan As Boolean)
		  if (connection = self.mConnection) then
		    self.RemoveUser victim
		    
		    if (Prefs.UserLeftPostInChat) then
		      DIM message As Text = if(kickMessage.Empty, Strings.kUserWasKickedBy, Strings.kUserWasKickedByWithMessage)
		      if (isBan) then
		        message = if(kickMessage.Empty, Strings.kUserWasBannedBy, Strings.kUserWasBannedByWithMessage)
		      end if
		      message = message.Replace("%victim%", victim.Nick)
		      message = message.Replace("%killer%", killer.Nick)
		      message = message.Replace("%message%", kickMessage)
		      
		      self.ChatLog.AppendNotification Xojo.Core.Date.Now, UIChatViewer.ContactKicked, message
		    end if
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WiredConnectionUserLeft(connection As WiredConnection, chatID As Integer, user As WiredUser)
		  if (connection = self.mConnection) AND ((chatID = self.mChatID) OR (chatID = 1)) then
		    self.RemoveUser user
		    
		    if (Prefs.UserLeftPostInChat) then
		      DIM message As Text = Strings.kUserHasLeft
		      message = message.Replace("%nick%", user.Nick)
		      self.ChatLog.AppendNotification Xojo.Core.Date.Now, UIChatViewer.ContactLeft, message
		    end if
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WiredConnectionUserListEntry(connection As WiredConnection, chatID As Integer, user As WiredUser)
		  if (connection = self.mConnection) AND (chatID = self.mChatID) then
		    self.AddUser user
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WiredMessageStyleChanged(sender As Object)
		  #Pragma Unused sender
		  
		  self.ChatLog.MessageStylePath = Prefs.MessageStylePath
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WiredMessageStyleFontSizeChanged(sender As Object)
		  #Pragma Unused sender
		  
		  self.SetChatLogFontSize Prefs.MessageStyleFontSize
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mChatID As Integer = 1
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mConnection As WiredConnection
	#tag EndProperty


#tag EndWindowCode

#tag Events ChatInput
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  DIM returnValue As Boolean = FALSE
		  
		  select case asc(Key)
		  case 3, 10, 13
		    if (me.Text = "/clear") then
		      self.ChatLog.Clear
		      me.Text = ""
		      returnValue = TRUE
		    ElseIf (me.Text.Left(4) = "/me ") then
		      DIM chat As Text = me.Text.Replace("/me ", "").ToText
		      self.mConnection.SendChat self.mChatID, chat, True
		      me.Text = ""
		      returnValue = TRUE
		    else
		      self.mConnection.SendChat self.mChatID, me.Text.ToText, if(Keyboard.OptionKey, TRUE, FALSE)
		      me.Text = ""
		      returnValue = TRUE
		    end if
		  end select
		  
		  Return returnValue
		End Function
	#tag EndEvent
	#tag Event
		Sub PicturePasted(image As Picture)
		  DIM aMemoryBlock As MemoryBlock = image.GetData(Picture.FormatPNG)
		  DIM encodedPicture As String = aMemoryBlock
		  encodedPicture = EncodeBase64(encodedPicture, 0)  // the zero means no line breaks in the base64 encoded data
		  self.mConnection.SendChat self.mChatID, "<img src='data:image/png;base64," + encodedPicture.ToText + "' class=""swirlImage""/>"
		End Sub
	#tag EndEvent
	#tag Event
		Sub PictureLinkPasted(link As Text)
		  self.mConnection.SendChat self.mChatID, "<img src=""" + link + """ class=""swirlImage""/>"
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events UserList
	#tag Event
		Sub Open()
		  me.ColumnAlignmentOffset(0) = 44
		  
		  if (self.mChatID <> 1) then
		    me.AcceptRawDataDrop "swirl.UserID"
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Function CellTextPaint(g As Graphics, row As Integer, column As Integer, x as Integer, y as Integer) As Boolean
		  #Pragma Unused x
		  #Pragma Unused y
		  
		  if (column = 0) then
		    DIM user As WiredUser = me.RowTag(row)
		    
		    // draw the user icon
		    g.Transparency = if(user.IsIdle OR NOT self.mConnection.IsConnected, 50.0, 0.0)  // is the user is idle, then set the transparency
		    if (user.Icon <> Nil) then
		      g.DrawPicture user.Icon, 4, 4, 32, 32, 0, 0, user.Icon.Width, user.Icon.Height
		    end if
		    
		    // user nick
		    if (me.Selected(row)) then
		      g.Transparency = 0.0
		      g.ForeColor = Colours.White
		    else
		      g.Transparency = if(user.IsIdle OR NOT self.mConnection.IsConnected, 50.0, 0.0)  // is the user is idle, then set the transparency
		      g.ForeColor = user.Colour
		    end if
		    g.TextFont = "System"
		    g.TextSize = 13
		    g.DrawString user.Nick, 44, if(user.Status.Empty, g.TextHeight + 10, g.TextHeight)
		    
		    // user status
		    g.ForeColor = if(me.Selected(row), Colours.Black, DisabledTextColor)
		    g.TextSize = 11
		    g.DrawString user.Status, 44, 32, 0, TRUE
		    
		    Return TRUE
		  end if
		End Function
	#tag EndEvent
	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  if (hitItem <> Nil) then
		    DIM user As WiredUser = hitItem.Tag
		    
		    select case hitItem.Text
		    case Strings.kStartPrivateChat
		      if (me.ListIndex <> -1) then
		        DIM win As SwirlMessagesWin = SwirlMessagesWin.MessageWindowExists(self.mConnection, user)
		        if (win = Nil) then
		          win = NEW SwirlMessagesWin(self.mConnection, user)
		        end if
		        win.Show
		      end if
		      
		    case Strings.kStartGroupChat
		      self.mConnection.CreatePrivateChat user.UserID
		      
		    case Strings.kGetInfo
		      SwirlUserInfoWindow.Exists self.mConnection, user
		      
		    case Strings.kKick
		      self.mConnection.KickUserWithMessage user, Strings.kYouHaveBeenKicked
		      
		    case Strings.kBan
		      self.mConnection.BanUserWithMessage user, Strings.kYouAreBannedFromThisServer
		    end select
		  end if
		End Function
	#tag EndEvent
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  if (x <> -1) AND (y <> -1) then
		    DIM row As Integer = me.RowFromXY(x, y)
		    'DIM userID As Integer = me.CellTag(row, 1)
		    DIM user As WiredUser = me.RowTag(row)
		    
		    if (row <> -1) then
		      base.Append NEW MenuItem(Strings.kStartPrivateChat, user)
		      base.Append NEW MenuItem(Strings.kStartGroupChat, user)
		      
		      if (self.mConnection.CanGetUserInfo) then
		        base.Append NEW MenuItem(MenuItem.TextSeparator)
		        base.Append NEW MenuItem(Strings.kGetInfo, user)
		      end if
		      
		      if (self.mConnection.CanKickUsers) OR (self.mConnection.CanBanUsers) then
		        base.Append NEW MenuItem(MenuItem.TextSeparator)
		        
		        if (self.mConnection.CanKickUsers) then
		          base.Append NEW MenuItem(Strings.kKick, user)
		        end if
		        if (self.mConnection.CanBanUsers) then
		          base.Append NEW MenuItem(Strings.kBan, user)
		        end if
		      end if
		    end if
		  end if
		  
		  Return TRUE
		End Function
	#tag EndEvent
	#tag Event
		Sub DropObject(obj As DragItem, action As Integer)
		  #pragma Unused action
		  
		  if (obj <> Nil) then
		    DIM handle As Integer = Val(obj.PrivateRawData("swirl.Handle"))
		    DIM userID As Integer = Val(obj.RawData("swirl.UserID"))
		    
		    if (self.mChatID <> 1) AND (handle = self.mConnection.Handle) then
		      self.mConnection.InviteUserToPrivateChat userID, self.mChatID
		    end if
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Function DragRow(drag As DragItem, row As Integer) As Boolean
		  #Pragma Unused row
		  
		  // the reason this is done in a loop is to all the future expansion of selecting multiple users
		  DIM rowCount As Integer = me.ListCount -1
		  for i as Integer = 0 to rowCount
		    if (me.Selected(i)) then
		      // this is where we would add the picture of the selected row
		      drag.PrivateRawData("swirl.Handle") = Str(self.mConnection.Handle)
		      drag.RawData("swirl.UserID") = Str(me.CellTag(i, 1))
		    end if
		  next
		  
		  Return TRUE
		End Function
	#tag EndEvent
	#tag Event
		Sub DoubleClick()
		  if (me.ListIndex <> -1) then
		    DIM win As SwirlMessagesWin = SwirlMessagesWin.MessageWindowExists(self.mConnection, me.RowTag(me.ListIndex))
		    
		    if (win = Nil) then
		      win = NEW SwirlMessagesWin(self.mConnection, me.RowTag(me.ListIndex))
		    end if
		    
		    win.Show
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  DIM returnValue As Boolean = FALSE
		  
		  select case asc(Key)
		  case 3, 10, 13
		    if (me.ListIndex <> -1) then
		      DIM win As SwirlMessagesWin = SwirlMessagesWin.MessageWindowExists(self.mConnection, me.RowTag(me.ListIndex))
		      
		      if (win = Nil) then
		        win = NEW SwirlMessagesWin(self.mConnection, me.RowTag(me.ListIndex))
		      end if
		      
		      win.Show
		    end if
		    returnValue = TRUE
		  end select
		  
		  Return returnValue
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events ChatLog
	#tag Event
		Sub Open()
		  me.MessageStylePath = Prefs.MessageStylePath
		End Sub
	#tag EndEvent
	#tag Event
		Function CancelLoad(URL As String) As Boolean
		  if (URL.Left(4) = "http") then
		    ShowURL URL
		    Return TRUE
		  else
		    Return FALSE
		  end if
		End Function
	#tag EndEvent
	#tag Event
		Sub MessageStyleChanged()
		  self.SetChatLogFontSize Prefs.MessageStyleFontSize
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="DoubleBuffer"
		Visible=true
		Group="Windows Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="AcceptFocus"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="AcceptTabs"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="AutoDeactivate"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		Type="Picture"
		EditorType="Picture"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Enabled"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="EraseBackground"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="300"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HelpTag"
		Visible=true
		Group="Appearance"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="InitialParent"
		Group="Position"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Left"
		Visible=true
		Group="Position"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockBottom"
		Visible=true
		Group="Position"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockLeft"
		Visible=true
		Group="Position"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockRight"
		Visible=true
		Group="Position"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockTop"
		Visible=true
		Group="Position"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabIndex"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabPanelIndex"
		Group="Position"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabStop"
		Visible=true
		Group="Position"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
		Visible=true
		Group="Position"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Transparent"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="UseFocusRing"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="300"
		Type="Integer"
	#tag EndViewProperty
#tag EndViewBehavior
