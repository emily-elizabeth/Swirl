#tag Window
Begin Window SwirlMessagesWin
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   True
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   467
   ImplicitInstance=   False
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   467
   MinimizeButton  =   True
   MinWidth        =   400
   Placement       =   0
   Resizeable      =   True
   Title           =   ""
   Visible         =   False
   Width           =   400
   Begin TextArea ChatInput
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
      Left            =   0
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
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   387
      Underline       =   False
      UseFocusRing    =   False
      Visible         =   True
      Width           =   400
   End
   Begin AdiumMessageViewer Viewer
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   338
      HelpTag         =   ""
      Index           =   -2147483648
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
      Top             =   48
      Visible         =   True
      Width           =   400
   End
   Begin Canvas UserIcon
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   46
      HelpTag         =   ""
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
      Top             =   1
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   385
   End
   Begin Label UserStatus
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
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
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   -72
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   355
   End
   Begin Label UserNick
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   21
      HelpTag         =   ""
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
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   -91
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   355
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Activate()
		  self.ChatInput.SetFocus
		End Sub
	#tag EndEvent

	#tag Event
		Function CancelClose(appQuitting as Boolean) As Boolean
		  if (appQuitting) OR (self.mWindowClosing) then
		    Return FALSE
		  else
		    self.Hide
		    Return TRUE
		  end if
		End Function
	#tag EndEvent

	#tag Event
		Sub Close()
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
		Function KeyDown(Key As String) As Boolean
		  self.ChatInput.SetFocus
		  self.ChatInput.Text = self.ChatInput.Text + Key
		  
		  Return TRUE
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
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

	#tag Method, Flags = &h0
		Sub Show(message As Text)
		  self.Viewer.AppendChat Xojo.Core.Date.Now, self.mUser.UserID, self.mUser.Nick, self.mUser.Icon, message, TRUE
		  self.Title = self.mUser.Nick + " @ " + self.mConnection.ServerName
		  Super.Show
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WiredConnectionMessageReceived(connection As WiredConnection, user As WiredUser, message As Text, isBroadcast As Boolean)
		  if (connection = self.mConnection) AND (user = self.mUser) then
		    self.Viewer.AppendChat Xojo.Core.Date.Now, self.mUser.UserID, self.mUser.Nick, self.mUser.Icon, message, TRUE
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WiredConnectionUserChanged(connection As WiredConnection, oldUser As WiredUser, newUser As WiredUser)
		  if (connection = self.mConnection) AND (oldUser.UserID = self.mUser.UserID) then
		    self.mUser = newUser
		    
		    if (Prefs.UserNickChangedPostInChat) AND (oldUser.Nick <> newUser.Nick) then
		      DIM message As Text = Strings.kIsNowKnownAs
		      message = message.Replace("%oldnick%", oldUser.Nick)
		      message = message.Replace("%newnick%", newUser.Nick)
		      self.Viewer.AppendNotification Xojo.Core.Date.Now, AdiumMessageViewer.NickChanged, message
		      self.UserNick.Text = newUser.Nick
		    end if
		    
		    if (Prefs.UserStatusChangedPostInChat) AND (oldUser.Status <> newUser.Status) then
		      DIM message As Text = Strings.kUserStatusChangedTo
		      message = message.Replace("%nick%", newUser.Nick)
		      message = message.Replace("%status%", newUser.Status)
		      self.Viewer.AppendNotification Xojo.Core.Date.Now, AdiumMessageViewer.Notification, message
		      self.UserStatus.Text = newUser.Status
		    end if
		    
		    self.UserIcon.Invalidate
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WiredConnectionUserIconChanged(connection As WiredConnection, user As WiredUser)
		  if (connection = self.mConnection) AND (user.UserID = self.mUser.UserID) then
		    self.mUser = user
		    self.UserIcon.Invalidate
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WiredConnectionUserJoined(connection As WiredConnection, chatID As Integer, user As WiredUser)
		  // this allows us to associate past chats with a user
		  if (connection = self.mConnection) AND (user.Login <> "guest") AND (user.Login = self.mUser.Login) then
		    self.mConnection = connection
		    self.mUser = user
		    self.UserIcon.Invalidate
		    self.ChatInput.Enabled = TRUE
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WiredConnectionUserKicked(connection As WiredConnection, victim As WiredUser, killer As WiredUser, kickMessage As Text, isBan As Boolean)
		  if (connection = self.mConnection) AND (victim.UserID = self.mUser.UserID) then
		    self.ChatInput.Enabled = FALSE
		    self.UserIcon.Invalidate
		    
		    if (Prefs.UserLeftPostInChat) then
		      DIM message As Text = if(kickMessage.Empty, Strings.kUserWasKickedBy, Strings.kUserWasKickedByWithMessage)
		      if (isBan) then
		        message = if(kickMessage.Empty, Strings.kUserWasBannedBy, Strings.kUserWasBannedByWithMessage)
		      end if
		      message = message.Replace("%victim%", victim.Nick)
		      message = message.Replace("%killer%", killer.Nick)
		      message = message.Replace("%message%", kickMessage)
		      
		      self.Viewer.AppendNotification Xojo.Core.Date.Now, AdiumMessageViewer.ContactKicked, message
		    end if
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WiredConnectionUserLeft(connection As WiredConnection, chatID As Integer, user As WiredUser)
		  if (connection = self.mConnection) AND (chatID = 1) AND (user.UserID = self.mUser.UserID) then
		    self.ChatInput.Enabled = FALSE
		    self.UserIcon.Invalidate
		    
		    if (Prefs.UserLeftPostInChat) then
		      DIM message As Text = Strings.kUserHasLeft
		      message = message.Replace("%nick%", user.Nick)
		      
		      self.Viewer.AppendNotification Xojo.Core.Date.Now, AdiumMessageViewer.ContactLeft, message
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
		Function KeyDown(Key As String) As Boolean
		  DIM results As Boolean = FALSE
		  
		  select case Asc(key)
		  case 3, 10, 13
		    self.Viewer.AppendChat Xojo.Core.Date.Now, self.mConnection.MyUserID, Prefs.UserNick, Prefs.UserIcon, me.Text.ToText, FALSE
		    self.mConnection.SendMessage self.mUser.UserID, me.Text.ToText, FALSE
		    me.Text = ""
		    results = TRUE
		  end select
		  
		  Return results
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events Viewer
	#tag Event
		Sub Open()
		  me.MessageStylePath = Prefs.MessageStylePath
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events UserIcon
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  #Pragma Unused areas
		  
		  // draw the user icon
		  g.Transparency = if(self.mUser.IsIdle OR NOT self.mConnection.IsConnected, 50.0, 0.0)  // is the user is idle, then set the transparency
		  if (self.mUser.Icon <> Nil) then
		    g.DrawPicture self.mUser.Icon, 4, 4, 32, 32, 0, 0, self.mUser.Icon.Width, self.mUser.Icon.Height
		  end if
		  
		  // user nick
		  g.Transparency = if(self.mUser.IsIdle OR NOT self.mConnection.IsConnected, 50.0, 0.0)  // is the user is idle, then set the transparency
		  g.ForeColor = self.mUser.Colour
		  g.TextFont = "System"
		  g.TextSize = 13
		  g.DrawString self.mUser.Nick, 44, if(self.mUser.Status.Empty, g.TextHeight + 10, g.TextHeight)
		  
		  // user status
		  g.ForeColor = DisabledTextColor
		  g.TextSize = 11
		  g.DrawString self.mUser.Status, 44, 32, 0, TRUE
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="BackColor"
		Visible=true
		Group="Appearance"
		InitialValue="&hFFFFFF"
		Type="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Appearance"
		Type="Picture"
		EditorType="Picture"
	#tag EndViewProperty
	#tag ViewProperty
		Name="CloseButton"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Frame"
		Visible=true
		Group="Appearance"
		InitialValue="0"
		Type="Integer"
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
		Name="FullScreen"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreenButton"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackColor"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Position"
		InitialValue="400"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LiveResize"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=true
		Group="Appearance"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxHeight"
		Visible=true
		Group="Position"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximizeButton"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxWidth"
		Visible=true
		Group="Position"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Appearance"
		Type="MenuBar"
		EditorType="MenuBar"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinHeight"
		Visible=true
		Group="Position"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimizeButton"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinWidth"
		Visible=true
		Group="Position"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Placement"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
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
		Name="Resizeable"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Appearance"
		InitialValue="Untitled"
		Type="String"
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
		Group="Position"
		InitialValue="600"
		Type="Integer"
	#tag EndViewProperty
#tag EndViewBehavior
