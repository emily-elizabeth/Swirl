#tag DesktopWindow
Begin DesktopContainer ChatContainer
   AllowAutoDeactivate=   True
   AllowFocus      =   False
   AllowFocusRing  =   False
   AllowTabs       =   True
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF00
   Composited      =   False
   Enabled         =   True
   HasBackgroundColor=   False
   Height          =   472
   Index           =   -2147483648
   InitialParent   =   ""
   Left            =   0
   LockBottom      =   True
   LockLeft        =   True
   LockRight       =   True
   LockTop         =   True
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   True
   Tooltip         =   ""
   Top             =   0
   Transparent     =   False
   Visible         =   True
   Width           =   780
   Begin VibrancyCanvas VibrancyCanvas1
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   False
      AllowTabs       =   False
      Backdrop        =   0
      Enabled         =   True
      Height          =   472
      Index           =   -2147483648
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   2
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   0
      Transparent     =   True
      Visible         =   True
      Width           =   201
   End
   Begin CustomChatInput ChatInput
      AllowAutoDeactivate=   True
      AllowFocusRing  =   False
      AllowSpellChecking=   True
      AllowStyledText =   True
      AllowTabs       =   False
      BackgroundColor =   &cFFFFFF
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Format          =   ""
      HasBorder       =   False
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   True
      Height          =   80
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   False
      Left            =   202
      LineHeight      =   0.0
      LineSpacing     =   1.0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      MaximumCharactersAllowed=   0
      Multiline       =   True
      ReadOnly        =   False
      Scope           =   2
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   392
      Transparent     =   True
      Underline       =   False
      UnicodeMode     =   0
      ValidationMask  =   ""
      Visible         =   True
      Width           =   578
   End
   Begin DesktopListBox UserList
      AllowAutoDeactivate=   True
      AllowAutoHideScrollbars=   True
      AllowExpandableRows=   False
      AllowFocusRing  =   False
      AllowResizableColumns=   False
      AllowRowDragging=   False
      AllowRowReordering=   False
      Bold            =   False
      ColumnCount     =   1
      ColumnWidths    =   ""
      DefaultRowHeight=   40
      DropIndicatorVisible=   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      GridLineStyle   =   0
      HasBorder       =   False
      HasHeader       =   False
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   True
      HeadingIndex    =   -1
      Height          =   472
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
      RowSelectionType=   0
      Scope           =   2
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   0
      Transparent     =   True
      Underline       =   False
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
      Index           =   -2147483648
      InitialParent   =   ""
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
      Tooltip         =   ""
      Top             =   0
      Visible         =   True
      Width           =   578
   End
End
#tag EndDesktopWindow

#tag WindowCode
	#tag Event
		Sub Closing()
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
		Function KeyDown(key As String) As Boolean
		  self.ChatInput.SetFocus
		  self.ChatInput.Text = self.ChatInput.Text + Key
		  self.ChatInput.SelectionStart = self.ChatInput.Text.Length
		  
		  Return TRUE
		End Function
	#tag EndEvent

	#tag Event
		Sub MenuBarSelected()
		  if (self.mChatID = 1) AND (self.PanelIndex - 1 = DesktopPagePanel(self.Parent).SelectedPanelIndex) then
		    ConnectionReconnect.Enabled = NOT self.mConnection.IsConnected
		    ConnectionDisconnect.Enabled = self.mConnection.IsConnected
		  end if
		End Sub
	#tag EndEvent

	#tag Event
		Sub Opening()
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
			if (self.mChatID = 1) AND (self.TabPanelIndex -1 = DesktopPagePanel(self.Parent).SelectedPanelIndex) then
			self.mConnection.Disconnect
			Return True
			else
			Return FALSE
			end if
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ConnectionReconnect() As Boolean Handles ConnectionReconnect.Action
			if (self.mChatID = 1) AND (self.TabPanelIndex -1 = DesktopPagePanel(self.Parent).SelectedPanelIndex) then
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
		  self.UserList.CellTagAt(self.UserList.LastAddedRowIndex, 1) = user.UserID
		  self.UserList.RowTagAt(self.UserList.LastAddedRowIndex) = user
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
		  for i as Integer = (self.UserList.RowCount - 1) DownTo 0
		    if (self.UserList.CellTagAt(i, 1) = user.UserID) then
		      self.UserList.RemoveRowAt i
		      exit for i
		    end if
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetChatLogFontSize(size As Integer)
		  
		  if (size = 0) then
		    self.ChatLog.ExecuteJavaScript "document.body.style.fontSize='" + self.ChatLog.DefaultFontSize.ToString + "px';"
		    self.ChatInput.FontSize = self.ChatLog.DefaultFontSize
		  else
		    self.ChatLog.ExecuteJavaScript "document.body.style.fontSize='" + size.ToString + "px';"
		    self.ChatInput.FontSize = size
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UpdateUser(user As WiredUser)
		  for i As Integer = (self.UserList.RowCount - 1) DownTo 0
		    if (self.UserList.CellTagAt(i, 1) = user.UserID) then
		      self.UserList.RowTagAt(i) = user
		      self.UserList.RefreshCell i, 0
		      exit for i
		    end if
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WiredConnectionChatReceived(connection As WiredConnection, chatID As Integer, user As WiredUser, message As String, isAction As Boolean)
		  if (connection = self.mConnection) AND (chatID = self.mChatID) then
		    if (isAction) then
		      self.ChatLog.AppendNotification DateTime.Now, UIChatViewer.Notification, user.Nick + " " + message
		    else
		      self.ChatLog.AppendChat DateTime.Now, user.UserID, user.Nick, user.Icon, message, (user.UserID <> connection.MyUserID)
		    end if
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WiredConnectionChatTopicReceived(connection As WiredConnection, chatID As Integer, nick As String, login As String, IP As String, time As DateTime, topic As String)
		  #Pragma Unused login
		  #Pragma Unused IP
		  #Pragma Unused time
		  
		  if (connection = self.mConnection) AND (chatID = self.mChatID) AND (Prefs.ChatTopicChangedPostInChat) then
		    DIM message As String = Strings.kUserSetTopic
		    message = message.Replace("%nick%", nick)
		    message = message + " - " + topic
		    
		    self.ChatLog.AppendNotification DateTime.Now, UIChatViewer.Notification, message
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WiredConnectionDisconnected(connection As WiredConnection)
		  if (connection = self.mConnection) then
		    self.UserList.Refresh
		    self.ChatInput.Enabled = False
		    
		    if (Prefs.ServerDisconnectedPostInChat) then
		      DIM message As String = Strings.kDisconnectedFromServerName
		      message = message.Replace("%servername%", connection.ServerName)
		      self.ChatLog.AppendNotification DateTime.Now, UIChatViewer.Notification, message
		    end if
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WiredConnectionLoginSuccessful(connection As WiredConnection)
		  if (connection = self.mConnection) then
		    self.UserList.RemoveAllRows
		    connection.RequestUserList self.mChatID
		    self.ChatInput.Enabled = TRUE
		    
		    DIM message As String = Strings.kConnectedToServerName
		    message = message.Replace("%servername%", self.mConnection.ServerName)
		    
		    if (Prefs.ServerConnectedPostInChat) then
		      self.ChatLog.AppendNotification DateTime.Now, "notification", message
		    end if
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WiredConnectionNewsPosted(connection As WiredConnection, nick As String, time As DateTime, message As String)
		  #Pragma Unused message
		  
		  if (connection = self.mConnection) AND (self.mChatID = 1) AND (Prefs.NewsPostedPostInChat) then
		    DIM eventMessage As String = Strings.kNewsPostedByOn
		    eventMessage = eventMessage.Replace("%nick%", nick)
		    eventMessage = eventMessage.Replace("%date%", time.ToString)
		    
		    self.ChatLog.AppendNotification DateTime.Now, UIChatViewer.Notification, eventMessage
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WiredConnectionPrivateChatDeclined(connection As WiredConnection, chatID As Integer, user As WiredUser)
		  if (connection = self.mConnection) AND (chatID = self.mChatID) then
		    DIM message As String = Strings.kUserHasDeclinedInvitation
		    message = message.Replace("%nick%", user.Nick)
		    
		    self.ChatLog.AppendNotification DateTime.Now, "notification", message
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WiredConnectionUserChanged(connection As WiredConnection, oldUser As WiredUser, newUser As WiredUser)
		  if (connection = self.mConnection) then
		    if (Prefs.UserNickChangedPostInChat) AND (oldUser.Nick <> newUser.Nick) then
		      DIM message As String = Strings.kIsNowKnownAs
		      message = message.Replace("%oldnick%", oldUser.Nick)
		      message = message.Replace("%newnick%", newUser.Nick)
		      self.ChatLog.AppendNotification DateTime.Now, UIChatViewer.NickChanged, message
		    end if
		    
		    if (Prefs.UserStatusChangedPostInChat) AND (oldUser.Status <> newUser.Status) then
		      DIM message As String = Strings.kUserStatusChangedTo
		      message = message.Replace("%nick%", newUser.Nick)
		      message = message.Replace("%status%", newUser.Status)
		      self.ChatLog.AppendNotification DateTime.Now, UIChatViewer.Notification, message
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
		      DIM message As String = Strings.kUserHasJoined
		      message = message.Replace("%nick%", user.Nick)
		      
		      self.ChatLog.AppendNotification DateTime.Now, UIChatViewer.ContactJoined, message
		    end if
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WiredConnectionUserKicked(connection As WiredConnection, victim As WiredUser, killer As WiredUser, kickMessage As String, isBan As Boolean)
		  if (connection = self.mConnection) then
		    self.RemoveUser victim
		    
		    if (Prefs.UserLeftPostInChat) then
		      DIM message As String = if(kickMessage.IsEmpty, Strings.kUserWasKickedBy, Strings.kUserWasKickedByWithMessage)
		      if (isBan) then
		        message = if(kickMessage.IsEmpty, Strings.kUserWasBannedBy, Strings.kUserWasBannedByWithMessage)
		      end if
		      message = message.Replace("%victim%", victim.Nick)
		      message = message.Replace("%killer%", killer.Nick)
		      message = message.Replace("%message%", kickMessage)
		      
		      self.ChatLog.AppendNotification DateTime.Now, UIChatViewer.ContactKicked, message
		    end if
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WiredConnectionUserLeft(connection As WiredConnection, chatID As Integer, user As WiredUser)
		  if (connection = self.mConnection) AND ((chatID = self.mChatID) OR (chatID = 1)) then
		    self.RemoveUser user
		    
		    if (Prefs.UserLeftPostInChat) then
		      DIM message As String = Strings.kUserHasLeft
		      message = message.Replace("%nick%", user.Nick)
		      self.ChatLog.AppendNotification DateTime.Now, UIChatViewer.ContactLeft, message
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
		Function KeyDown(key As String) As Boolean
		  DIM returnValue As Boolean = FALSE
		  
		  select case asc(Key)
		  case 3, 10, 13
		    if (me.Text = "/clear") then
		      self.ChatLog.Clear
		      me.Text = ""
		      returnValue = TRUE
		    ElseIf (me.Text.Left(4) = "/me ") then
		      DIM chat As String = me.Text.Replace("/me ", "")
		      self.mConnection.SendChat self.mChatID, chat, True
		      me.Text = ""
		      returnValue = TRUE
		    else
		      self.mConnection.SendChat self.mChatID, me.Text, if(Keyboard.OptionKey, TRUE, FALSE)
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
		  self.mConnection.SendChat self.mChatID, ChrB(128) + "<img src='data:image/png;base64," + encodedPicture + "' class=""swirlImage""/>"
		End Sub
	#tag EndEvent
	#tag Event
		Sub PictureLinkPasted(link As String)
		  self.mConnection.SendChat self.mChatID, ChrB(128) + "<img src=""" + link + """ class=""swirlImage""/>"
		  self.mConnection.SendChat self.mChatID, link
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events UserList
	#tag Event
		Sub Opening()
		  me.ColumnAlignmentOffsetAt(0) = 44
		  
		  if (self.mChatID <> 1) then
		    me.AcceptRawDataDrop "swirl.UserID"
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Function PaintCellText(g as Graphics, row as Integer, column as Integer, x as Integer, y as Integer) As Boolean
		  #Pragma Unused x
		  #Pragma Unused y
		  
		  if (column = 0) then
		    DIM user As WiredUser = me.RowTagAt(row)
		    
		    // draw the user icon
		    g.Transparency = if(user.IsIdle OR NOT self.mConnection.IsConnected, 50.0, 0.0)  // is the user is idle, then set the transparency
		    if (user.Icon <> Nil) then
		      g.DrawPicture user.Icon, 4, 4, 32, 32, 0, 0, user.Icon.Width, user.Icon.Height
		    end if
		    
		    // user nick
		    if (me.RowSelectedAt(row)) then
		      g.Transparency = 0.0
		      g.ForeColor = Color.White
		    else
		      g.Transparency = if(user.IsIdle OR NOT self.mConnection.IsConnected, 50.0, 0.0)  // is the user is idle, then set the transparency
		      if (user.Login = "guest") then
		        g.ForeColor = Color.TextColor
		      elseif (user.IsAdmin) then
		        g.ForeColor = Color.Red
		      else
		        g.ForeColor = Color.Blue
		      end if
		    end if
		    g.TextFont = "System"
		    g.TextSize = 13
		    g.DrawString user.Nick, 44, if(user.Status.IsEmpty, g.TextHeight + 10, g.TextHeight)
		    
		    // user status
		    g.ForeColor = if(me.SelectedRowIndex = row, Color.Black, Color.DisabledTextColor)
		    g.TextSize = 11
		    g.DrawString user.Status, 44, 32, 0, TRUE
		    
		    Return TRUE
		  end if
		End Function
	#tag EndEvent
	#tag Event
		Function ContextualMenuItemSelected(selectedItem As DesktopMenuItem) As Boolean
		  if (selectedItem <> Nil) then
		    DIM user As WiredUser = selectedItem.Tag
		    
		    select case selectedItem.Text
		    case Strings.kStartPrivateChat
		      if (me.SelectedRowIndex <> -1) then
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
		Function ConstructContextualMenu(base As DesktopMenuItem, x As Integer, y As Integer) As Boolean
		  if (x <> -1) AND (y <> -1) then
		    DIM row As Integer = me.RowFromXY(x, y)
		    'DIM userID As Integer = me.CellTag(row, 1)
		    DIM user As WiredUser = me.RowTagAt(row)
		    
		    if (row <> -1) then
		      base.AddMenu NEW MenuItem(Strings.kStartPrivateChat, user)
		      base.AddMenu NEW MenuItem(Strings.kStartGroupChat, user)
		      
		      if (self.mConnection.CanGetUserInfo) then
		        base.AddMenu NEW MenuItem(MenuItem.TextSeparator)
		        base.AddMenu NEW MenuItem(Strings.kGetInfo, user)
		      end if
		      
		      if (self.mConnection.CanKickUsers) OR (self.mConnection.CanBanUsers) then
		        base.AddMenu NEW MenuItem(MenuItem.TextSeparator)
		        
		        if (self.mConnection.CanKickUsers) then
		          base.AddMenu NEW MenuItem(Strings.kKick, user)
		        end if
		        if (self.mConnection.CanBanUsers) then
		          base.AddMenu NEW MenuItem(Strings.kBan, user)
		        end if
		      end if
		    end if
		  end if
		  
		  Return TRUE
		End Function
	#tag EndEvent
	#tag Event
		Sub DropObject(obj As DragItem, action As DragItem.Types)
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
		  DIM rowCount As Integer = me.RowCount -1
		  for i as Integer = 0 to rowCount
		    if (me.SelectedRowIndex = i) then
		      // this is where we would add the picture of the selected row
		      drag.PrivateRawData("swirl.Handle") = Str(self.mConnection.Handle)
		      drag.RawData("swirl.UserID") = Str(me.CellTagAt(i, 1))
		    end if
		  next
		  
		  Return TRUE
		End Function
	#tag EndEvent
	#tag Event
		Sub DoublePressed()
		  if (me.SelectedRowIndex <> -1) then
		    DIM win As SwirlMessagesWin = SwirlMessagesWin.MessageWindowExists(self.mConnection, me.RowTagAt(me.SelectedRowIndex))
		    
		    if (win = Nil) then
		      win = NEW SwirlMessagesWin(self.mConnection, me.RowTagAt(me.SelectedRowIndex))
		    end if
		    
		    win.Show
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(key As String) As Boolean
		  DIM returnValue As Boolean = FALSE
		  
		  select case asc(Key)
		  case 3, 10, 13
		    if (me.SelectedRowIndex <> -1) then
		      DIM win As SwirlMessagesWin = SwirlMessagesWin.MessageWindowExists(self.mConnection, me.RowTagAt(me.SelectedRowIndex))
		      
		      if (win = Nil) then
		        win = NEW SwirlMessagesWin(self.mConnection, me.RowTagAt(me.SelectedRowIndex))
		      end if
		      
		      win.Show
		    end if
		    returnValue = TRUE
		  end select
		  
		  Return returnValue
		End Function
	#tag EndEvent
	#tag Event
		Function PaintCellBackground(g As Graphics, row As Integer, column As Integer) As Boolean
		  #Pragma Unused row
		  #Pragma Unused column
		  
		  #if TargetMacOS
		    g.ClearRect 0, 0, g.Width, g.Height
		    Return FALSE
		  #endif
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events ChatLog
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
	#tag Event
		Sub Opening()
		  me.MessageStylePath = Prefs.MessageStylePath
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="Composited"
		Visible=true
		Group="Windows Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Index"
		Visible=true
		Group="ID"
		InitialValue="-2147483648"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowAutoDeactivate"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Tooltip"
		Visible=true
		Group="Appearance"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowFocusRing"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="ColorGroup"
		EditorType="ColorGroup"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowFocus"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowTabs"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Enabled"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="300"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="InitialParent"
		Visible=false
		Group="Position"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Left"
		Visible=true
		Group="Position"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockBottom"
		Visible=true
		Group="Position"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockLeft"
		Visible=true
		Group="Position"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockRight"
		Visible=true
		Group="Position"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockTop"
		Visible=true
		Group="Position"
		InitialValue=""
		Type="Boolean"
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
		Name="TabIndex"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabPanelIndex"
		Visible=false
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabStop"
		Visible=true
		Group="Position"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
		Visible=true
		Group="Position"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Transparent"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="300"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
