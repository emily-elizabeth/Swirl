#tag DesktopWindow
Begin DesktopWindow SwirlMessagesWin
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF00
   Composite       =   True
   DefaultLocation =   0
   FullScreen      =   False
   HasBackgroundColor=   False
   HasCloseButton  =   True
   HasFullScreenButton=   False
   HasMaximizeButton=   True
   HasMinimizeButton=   True
   Height          =   467
   ImplicitInstance=   False
   MacProcID       =   0
   MaximumHeight   =   32000
   MaximumWidth    =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinimumHeight   =   467
   MinimumWidth    =   400
   Resizeable      =   True
   Title           =   ""
   Type            =   0
   Visible         =   False
   Width           =   400
   Begin DesktopTextArea ChatInput
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
      Left            =   0
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
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   387
      Transparent     =   False
      Underline       =   False
      UnicodeMode     =   0
      ValidationMask  =   ""
      Visible         =   True
      Width           =   400
   End
   Begin UIChatViewer Viewer
      AutoDeactivate  =   True
      DefaultFontSize =   0
      Enabled         =   True
      Height          =   338
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Renderer        =   1
      Scope           =   2
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   48
      Visible         =   True
      Width           =   400
   End
   Begin DesktopCanvas UserIcon
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   False
      AllowTabs       =   False
      Backdrop        =   0
      Enabled         =   True
      Height          =   46
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   8
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   2
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   1
      Transparent     =   True
      Visible         =   True
      Width           =   384
   End
   Begin DesktopLabel UserStatus
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   45
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   -72
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   355
   End
   Begin DesktopLabel UserNick
      AllowAutoDeactivate=   True
      Bold            =   True
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   21
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   45
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   -91
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   355
   End
End
#tag EndDesktopWindow

#tag WindowCode
	#tag Event
		Sub Activated()
		  self.ChatInput.SetFocus
		End Sub
	#tag EndEvent

	#tag Event
		Function CancelClosing(appQuitting As Boolean) As Boolean
		  if (appQuitting) OR (self.mWindowClosing) then
		    Return FALSE
		  else
		    self.Hide
		    Return TRUE
		  end if
		End Function
	#tag EndEvent

	#tag Event
		Sub Closing()
		  ObjObserver.Unlisten self, Events.kWiredMessageStyleChanged
		  ObjObserver.Unlisten self, Events.kWiredConnectionMessageReceived
		  ObjObserver.Unlisten self, Events.kWiredConnectionUserChanged
		  ObjObserver.Unlisten self, Events.kWiredConnectionUserIconChanged
		  ObjObserver.Unlisten self, Events.kWiredConnectionUserJoined
		  ObjObserver.Unlisten self, Events.kWiredConnectionUserKicked
		  ObjObserver.Unlisten self, Events.kWiredConnectionUserLeft
		End Sub
	#tag EndEvent

	#tag Event
		Function KeyDown(key As String) As Boolean
		  self.ChatInput.SetFocus
		  self.ChatInput.Text = self.ChatInput.Text + Key
		  
		  Return TRUE
		End Function
	#tag EndEvent

	#tag Event
		Sub Opening()
		  self.Title = self.mUser.Nick + " @ " + self.mConnection.ServerName
		  
		  ObjObserver.Listen self, Events.kWiredConnectionMessageReceived
		  ObjObserver.Listen self, Events.kWiredConnectionUserChanged
		  ObjObserver.Listen self, Events.kWiredConnectionUserIconChanged
		  ObjObserver.Listen self, Events.kWiredConnectionUserJoined
		  ObjObserver.Listen self, Events.kWiredConnectionUserKicked
		  ObjObserver.Listen self, Events.kWiredConnectionUserLeft
		  ObjObserver.Listen self, Events.kWiredMessageStyleChanged
		  ObjObserver.Listen self, Events.kWiredWindowClosing
		  
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function MenuClearChat() As Boolean Handles MenuClearChat.Action
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function MenuEnlargeText() As Boolean Handles MenuEnlargeText.Action
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function MenuShrinkText() As Boolean Handles MenuShrinkText.Action
			
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h0
		Function Compare(connection As WiredConnection, user As WiredUser) As Boolean
		  Return ((connection = self.mConnection) AND (user.UserID = self.mUser.UserID))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(connection As WiredConnection, user As WiredUser)
		  self.mConnection = connection
		  self.mUser = user
		  
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function MessageWindowExists(connection As WiredConnection, user As WiredUser) As SwirlMessagesWin
		  DIM results As SwirlMessagesWin
		  
		  for i as Integer = 0 to (WindowCount - 1)
		    if (Window(i) IsA SwirlMessagesWin) then
		      if (SwirlMessagesWin(Window(i)).Compare(connection, user)) then
		        results = SwirlMessagesWin(Window(i))
		        exit for i
		      end if
		    end if
		  next
		  
		  Return results
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetChatLogFontSize(size As Integer)
		  
		  if (size = 0) then
		    self.Viewer.ExecuteJavaScript "document.body.style.fontSize='" + self.Viewer.DefaultFontSize.ToString + "px';"
		    self.ChatInput.FontSize = self.Viewer.DefaultFontSize
		  else
		    self.Viewer.ExecuteJavaScript "document.body.style.fontSize='" + size.ToString + "px';"
		    self.ChatInput.FontSize = size
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Show(message As String)
		  self.Viewer.AppendChat DateTime.Now, self.mUser.UserID, self.mUser.Nick, self.mUser.Icon, message, TRUE
		  self.Title = self.mUser.Nick + " @ " + self.mConnection.ServerName
		  Super.Show
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WiredConnectionMessageReceived(connection As WiredConnection, user As WiredUser, message As String, isBroadcast As Boolean)
		  #Pragma Unused isBroadcast
		  
		  if (connection = self.mConnection) AND (user = self.mUser) then
		    self.Viewer.AppendChat DateTime.Now, self.mUser.UserID, self.mUser.Nick, self.mUser.Icon, message, TRUE
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WiredConnectionUserChanged(connection As WiredConnection, oldUser As WiredUser, newUser As WiredUser)
		  if (connection = self.mConnection) AND (oldUser.UserID = self.mUser.UserID) then
		    self.mUser = newUser
		    
		    if (Prefs.UserNickChangedPostInChat) AND (oldUser.Nick <> newUser.Nick) then
		      DIM message As String = Strings.kIsNowKnownAs
		      message = message.Replace("%oldnick%", oldUser.Nick)
		      message = message.Replace("%newnick%", newUser.Nick)
		      self.Viewer.AppendNotification DateTime.Now, UIChatViewer.NickChanged, message
		      self.UserNick.Text = newUser.Nick
		    end if
		    
		    if (Prefs.UserStatusChangedPostInChat) AND (oldUser.Status <> newUser.Status) then
		      DIM message As String = Strings.kUserStatusChangedTo
		      message = message.Replace("%nick%", newUser.Nick)
		      message = message.Replace("%status%", newUser.Status)
		      self.Viewer.AppendNotification DateTime.Now, UIChatViewer.Notification, message
		      self.UserStatus.Text = newUser.Status
		    end if
		    
		    self.UserIcon.Refresh
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WiredConnectionUserIconChanged(connection As WiredConnection, user As WiredUser)
		  if (connection = self.mConnection) AND (user.UserID = self.mUser.UserID) then
		    self.mUser = user
		    self.UserIcon.Refresh
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WiredConnectionUserJoined(connection As WiredConnection, chatID As Integer, user As WiredUser)
		  // this allows us to associate past chats with a user
		  if (connection = self.mConnection) AND (user.Login <> "guest") AND (user.Login = self.mUser.Login) AND (chatID = 1) then
		    self.mConnection = connection
		    self.mUser = user
		    self.UserIcon.Refresh
		    self.ChatInput.Enabled = TRUE
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WiredConnectionUserKicked(connection As WiredConnection, victim As WiredUser, killer As WiredUser, kickMessage As String, isBan As Boolean)
		  if (connection = self.mConnection) AND (victim.UserID = self.mUser.UserID) then
		    self.ChatInput.Enabled = FALSE
		    self.UserIcon.Refresh
		    
		    if (Prefs.UserLeftPostInChat) then
		      DIM message As String = if(kickMessage.IsEmpty, Strings.kUserWasKickedBy, Strings.kUserWasKickedByWithMessage)
		      if (isBan) then
		        message = if(kickMessage.IsEmpty, Strings.kUserWasBannedBy, Strings.kUserWasBannedByWithMessage)
		      end if
		      message = message.Replace("%victim%", victim.Nick)
		      message = message.Replace("%killer%", killer.Nick)
		      message = message.Replace("%message%", kickMessage)
		      
		      self.Viewer.AppendNotification DateTime.Now, UIChatViewer.ContactKicked, message
		    end if
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WiredConnectionUserLeft(connection As WiredConnection, chatID As Integer, user As WiredUser)
		  if (connection = self.mConnection) AND (chatID = 1) AND (user.UserID = self.mUser.UserID) then
		    self.ChatInput.Enabled = FALSE
		    self.UserIcon.Refresh
		    
		    if (Prefs.UserLeftPostInChat) then
		      DIM message As String = Strings.kUserHasLeft
		      message = message.Replace("%nick%", user.Nick)
		      
		      self.Viewer.AppendNotification DateTime.Now, UIChatViewer.ContactLeft, message
		    end if
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WiredMessageStyleChanged(sender As Object)
		  #Pragma Unused sender
		  
		  self.Viewer.MessageStylePath = Prefs.MessageStylePath
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WiredMessageStyleFontSizeChanged(sender As Object)
		  #Pragma Unused sender
		  
		  self.SetChatLogFontSize Prefs.MessageStyleFontSize
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WiredWindowClosing(connection As WiredConnection)
		  if (connection = self.mConnection) then
		    self.mWindowClosing = TRUE
		    self.Close
		  end if
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mConnection As WiredConnection
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mUser As WiredUser
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mWindowClosing As Boolean
	#tag EndProperty


#tag EndWindowCode

#tag Events ChatInput
	#tag Event
		Function KeyDown(key As String) As Boolean
		  DIM results As Boolean = FALSE
		  
		  select case Asc(key)
		  case 3, 10, 13
		    self.Viewer.AppendChat DateTime.Now, self.mConnection.MyUserID, Prefs.UserNick, Prefs.UserIcon, me.Text, FALSE
		    self.mConnection.SendMessage self.mUser.UserID, me.Text, FALSE
		    me.Text = ""
		    results = TRUE
		  end select
		  
		  Return results
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events Viewer
	#tag Event
		Sub MessageStyleChanged()
		  self.SetChatLogFontSize Prefs.MessageStyleFontSize
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
		Sub Opening()
		  me.MessageStylePath = Prefs.MessageStylePath
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events UserIcon
	#tag Event
		Sub Paint(g As Graphics, areas() As Rect)
		  #Pragma Unused areas
		  
		  // draw the user icon
		  g.Transparency = if(self.mUser.IsIdle OR NOT self.mConnection.IsConnected, 50.0, 0.0)  // is the user is idle, then set the transparency
		  if (self.mUser.Icon <> Nil) then
		    g.DrawPicture self.mUser.Icon, 4, 4, 32, 32, 0, 0, self.mUser.Icon.Width, self.mUser.Icon.Height
		  end if
		  
		  // user nick
		  g.Transparency = if(self.mUser.IsIdle OR NOT self.mConnection.IsConnected, 50.0, 0.0)  // is the user is idle, then set the transparency
		  'g.ForeColor = self.mUser.Colour
		  if (self.mUser.Login = "guest") then
		    g.ForeColor = Color.TextColor
		  elseif (self.mUser.IsAdmin) then
		    g.ForeColor = Color.Red
		  else
		    g.ForeColor = Color.Blue
		  end if
		  g.TextFont = "System"
		  g.TextSize = 13
		  g.DrawString self.mUser.Nick, 44, if(self.mUser.Status.IsEmpty, g.TextHeight + 10, g.TextHeight)
		  
		  // user status
		  g.ForeColor = Color.DisabledTextColor
		  g.TextSize = 11
		  g.DrawString self.mUser.Status, 44, 32, 0, TRUE
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Type"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Types"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasCloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasFullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DefaultLocation"
		Visible=true
		Group="Behavior"
		InitialValue="0"
		Type="Locations"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
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
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="ColorGroup"
		EditorType="ColorGroup"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Appearance"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Position"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=true
		Group="Appearance"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Appearance"
		InitialValue=""
		Type="DesktopMenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
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
		Name="Resizeable"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
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
		Name="Title"
		Visible=true
		Group="Appearance"
		InitialValue="Untitled"
		Type="String"
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
		Group="Position"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
