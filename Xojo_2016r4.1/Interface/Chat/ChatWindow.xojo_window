#tag Window
Begin Window ChatWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   True
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   True
   HasBackColor    =   False
   Height          =   498
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   208667844
   MenuBarVisible  =   True
   MinHeight       =   300
   MinimizeButton  =   True
   MinWidth        =   500
   Placement       =   0
   Resizeable      =   True
   Title           =   "Swirl"
   Visible         =   False
   Width           =   780
   Begin PagePanel PagePanel1
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   538
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      PanelCount      =   3
      Panels          =   ""
      Scope           =   2
      TabIndex        =   5
      TabPanelIndex   =   0
      Top             =   0
      Value           =   0
      Visible         =   True
      Width           =   780
      Begin CustomTabPanelTabs ChatTabs
         AcceptFocus     =   False
         AcceptTabs      =   False
         AutoDeactivate  =   True
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         Facing          =   1
         Height          =   26
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "PagePanel1"
         Left            =   0
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   False
         Scope           =   2
         TabIndex        =   1
         TabPanelIndex   =   1
         TabStop         =   True
         Top             =   466
         Transparent     =   True
         UseFocusRing    =   True
         value           =   0
         Visible         =   True
         Width           =   780
      End
      Begin PagePanel ChatPanel
         AutoDeactivate  =   True
         Enabled         =   True
         Height          =   472
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "PagePanel1"
         Left            =   0
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         PanelCount      =   1
         Panels          =   ""
         Scope           =   2
         TabIndex        =   0
         TabPanelIndex   =   1
         Top             =   0
         Value           =   0
         Visible         =   True
         Width           =   780
         Begin ConnectContainer ConnectGUI
            AcceptFocus     =   False
            AcceptTabs      =   True
            AutoDeactivate  =   True
            BackColor       =   &cFFFF00FF
            Backdrop        =   0
            Enabled         =   True
            EraseBackground =   True
            HasBackColor    =   False
            Height          =   472
            HelpTag         =   ""
            InitialParent   =   "ChatPanel"
            Left            =   0
            LockBottom      =   True
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   True
            Scope           =   2
            TabIndex        =   0
            TabPanelIndex   =   1
            TabStop         =   True
            Top             =   0
            Transparent     =   True
            UseFocusRing    =   False
            Visible         =   True
            Width           =   780
         End
      End
      Begin CustomTabPanelTabs NewsTabs
         AcceptFocus     =   False
         AcceptTabs      =   False
         AutoDeactivate  =   True
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         Facing          =   1
         Height          =   26
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "PagePanel1"
         Left            =   0
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   False
         Scope           =   2
         TabIndex        =   1
         TabPanelIndex   =   2
         TabStop         =   True
         Top             =   466
         Transparent     =   True
         UseFocusRing    =   True
         value           =   0
         Visible         =   True
         Width           =   780
      End
      Begin CustomTabPanelTabs FilesTabs
         AcceptFocus     =   False
         AcceptTabs      =   False
         AutoDeactivate  =   True
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         Facing          =   1
         Height          =   26
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "PagePanel1"
         Left            =   0
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   False
         Scope           =   2
         TabIndex        =   0
         TabPanelIndex   =   3
         TabStop         =   True
         Top             =   466
         Transparent     =   True
         UseFocusRing    =   True
         value           =   0
         Visible         =   True
         Width           =   780
      End
      Begin PagePanel FilesPanel
         AutoDeactivate  =   True
         Enabled         =   True
         Height          =   472
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "PagePanel1"
         Left            =   0
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         PanelCount      =   2
         Panels          =   ""
         Scope           =   2
         TabIndex        =   1
         TabPanelIndex   =   3
         Top             =   0
         Value           =   0
         Visible         =   True
         Width           =   780
      End
      Begin PagePanel NewsPanel
         AutoDeactivate  =   True
         Enabled         =   True
         Height          =   472
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "PagePanel1"
         Left            =   0
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         PanelCount      =   0
         Panels          =   ""
         Scope           =   2
         TabIndex        =   0
         TabPanelIndex   =   2
         Top             =   0
         Value           =   0
         Visible         =   True
         Width           =   780
      End
   End
   Begin ChatToolbar ChatToolbar1
      Enabled         =   True
      Index           =   -2147483648
      InitialParent   =   ""
      LockedInPosition=   False
      Scope           =   2
      TabPanelIndex   =   0
      Visible         =   True
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Function CancelClose(appQuitting as Boolean) As Boolean
		  self.Hide
		  
		  Return not appQuitting
		End Function
	#tag EndEvent

	#tag Event
		Sub Close()
		  ObjObserver.Unlisten self, Events.kWiredConnectionChatReceived
		  ObjObserver.Unlisten self, Events.kWiredConnectionDisconnected
		  ObjObserver.Unlisten self, Events.kWiredConnectionLoginSuccessful
		  ObjObserver.Unlisten self, Events.kWiredConnectionUserChanged
		  ObjObserver.Unlisten self, Events.kWiredStatusIconSetChanged
		  
		  ' ' Settings.ChatWinIsFullScreen = self.FullScreen
		  ' 
		  ' if (not self.FullScreen) then
		  ' ' Settings.ChatWinRect = self.Bounds
		  ' end if
		End Sub
	#tag EndEvent

	#tag Event
		Sub EnableMenuItems()
		  
		  ConnectionConnect.Enabled = (self.ChatTabs.Value <> 0)  // disable when we're on the Connect tab
		  ConnectionNews.Enabled = (self.ChatTabs.Value <> 0)
		  ConnectionDisconnectAll.Enabled = (self.mConnections.Ubound > 0)  // index(0) is for the connection tab
		  'ConnectionDisconnectAll.Visible = (Keyboard.AsyncShiftKey)  // need this otherwise the shortcut key does not work
		  
		  'ViewShrinkText.Enabled = (self.ChatTabs.Value <> 0)
		  'ViewEnlargeText.Enabled = (self.ChatTabs.Value <> 0)
		  
		  'ViewToggleFullScreen.Text = if(self.FullScreen, Strings.kExitFullScreen, ssWired.kEnterFullScreen)
		  '
		  'WindowCloseWindow.KeyboardShortcut = Strings.kCloseWindowShortcutModified
		  'WindowCloseTab.KeyboardShortcut = Strings.kCloseTabShortcutModified
		  'WindowCloseTab.Enabled = (self.ChatTabs.Value <> 0)
		  'WindowSelectPreviousTab.Enabled = (self.ChatTabs.TabCount > 1)
		  'WindowSelectNextTab.Enabled = (self.ChatTabs.TabCount > 1)
		  
		  
		  
		  
		  
		  
		  
		  ' if (self = Window(0)) then
		  ' EditPaste.Text = ssWired.kPaste
		  ' EditPaste.KeyboardShortcut = "MenuModifier+V"
		  ' end if
		  '
		  '
		  '
		  '
		  '
		  '
		  ' if (Window(0) = self) then
		  
		  ' EditPaste.Text = ssWired.kPaste
		  ' EditPaste.KeyboardShortcut = "MenuModifier+V"
		  '
		  
		  
		  '
		  ' ' if (Window(0) = self.TrueWindow) AND (self.Enabled) then
		  ' ' if (self.Connection.IsConnected) then
		  ' '
		  ' ' ConnectionGetInfo.Enabled = (self.userlist.ListIndex > -1) AND (self.Connection.IsConnected)
		  ' ' ConnectionSetTopic.Enabled = (self.Connection.MyPrivileges <> Nil) AND (self.Connection.MyPrivileges.ChangeTopic) AND (self.Connection.IsConnected)
		  ' '
		  ' ' if (Keyboard.MenuShortcutKey) AND (Keyboard.ShiftKey) then
		  ' ' ssWired.SetMenuToPasteAsPlainText
		  ' ' else
		  ' ' ssWired.SetMenuToPaste
		  ' ' end if
		  ' ' EditPaste.Enabled = (self.Focus = self.ChatInput)
		  ' '
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  self.Height = self.Height + 1
		  self.Height = self.Height - 1
		  
		  ObjObserver.Listen self, Events.kWiredConnectionChatReceived
		  ObjObserver.Listen self, Events.kWiredConnectionDisconnected
		  ObjObserver.Listen self, Events.kWiredConnectionLoginSuccessful
		  ObjObserver.Listen self, Events.kWiredConnectionUserChanged
		  ObjObserver.Listen self, Events.kWiredStatusIconSetChanged
		  
		  self.mConnections.Append Nil
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function ConnectionDisconnectAll() As Boolean Handles ConnectionDisconnectAll.Action
			for i As Integer = 0 to (self.mConnections.Ubound)
			if (self.mConnections(i) <> Nil) then
			self.mConnections(i).Disconnect
			end if
			next
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function WindowCloseTab() As Boolean Handles WindowCloseTab.Action
			self.CloseCurrentTab
			
			Return TRUE
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function WindowSelectNextTab() As Boolean Handles WindowSelectNextTab.Action
			self.MoveToNextChatTab
			
			Return TRUE
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function WindowSelectPreviousTab() As Boolean Handles WindowSelectPreviousTab.Action
			self.MoveToPreviousChatTab
			
			Return TRUE
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h21
		Private Sub AddChatContainer(panel As PagePanel, page As Integer)
		  DIM aChat As NEW ChatContainer(self.mConnections(self.mConnections.Ubound), 1)
		  aChat.EmbedWithinPanel panel, page, 0, 0, panel.Width, panel.Height
		  
		  if (self.ChatTabs.Value = 0) then
		    panel.Value = page
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function CancelDisconnect() As Boolean
		  DIM results As Boolean = FALSE
		  
		  if (NOT App.IsQuitting) AND (Prefs.ConfirmDisconnect) then
		    if (MsgBox(Strings.kAreYouSureYouWantToDisconnect, 33) = 2) then
		      results = TRUE
		    end if
		  end if
		  
		  Return results
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CloseCurrentTab()
		  self.ChatTabs.RemoveTab self.ChatTabs.Value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub MoveToNextChatTab()
		  self.ChatTabs.Value = if(self.ChatTabs.Value = self.ChatTabs.TabCount, 1, self.ChatTabs.Value + 1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub MoveToPreviousChatTab()
		  self.ChatTabs.Value = if(self.ChatTabs.Value = 1, self.ChatTabs.TabCount, self.ChatTabs.Value - 1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PrivilegesReceived()
		  ' ' #Pragma Unused connection
		  ' 
		  ' connection As WiredConnection
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ServerInfoReceived(connection As WiredConnection, appVersion As Text, protocolVersion As Text, serverName As Text, serverDescription As Text, startTime As Xojo.Core.Date, filesCount As UInt64, filesSize As UInt64)
		  #Pragma Unused appVersion
		  #Pragma Unused protocolVersion
		  #Pragma Unused serverDescription
		  #Pragma Unused startTime
		  #Pragma Unused filesCount
		  #Pragma Unused filesSize
		  
		  
		  DIM index As Integer = self.mConnections.IndexOf(connection)
		  
		  if (index <> -1) then
		    self.ChatTabs.Caption(index) = serverName
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowChatTab()
		  self.PagePanel1.Value = 0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowConnectTab()
		  self.PagePanel1.Value = 0
		  self.ChatTabs.Value = 0
		  Super.Show
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowNewsTab()
		  self.PagePanel1.Value = 1
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UpdateChatTab(tabIndex As Integer)
		  if (tabIndex > 0) then
		    if (self.mConnections(tabIndex) <> Nil) AND (self.mConnections(tabIndex).MyUser <> Nil) then
		      if (self.mConnections(tabIndex).IsConnected) AND (self.mConnections(tabIndex).MyUser.IsIdle) then
		        self.ChatTabs.icon(tabIndex) = if(Prefs.StatusIconSet <> Nil AND Prefs.StatusIconSet.Idle <> Nil, Prefs.StatusIconSet.Idle, Nil)
		      elseif (self.mConnections(tabIndex).IsConnected) then
		        self.ChatTabs.icon(tabIndex) = if(Prefs.StatusIconSet <> Nil AND Prefs.StatusIconSet.Available <> Nil, Prefs.StatusIconSet.Available, Nil)
		      elseif (NOT self.mConnections(tabIndex).IsConnected) then
		        self.ChatTabs.icon(tabIndex) = if(Prefs.StatusIconSet <>  Nil AND Prefs.StatusIconSet.Offline <> Nil, Prefs.StatusIconSet.Offline, Nil)
		      end if
		    else
		      if (tabIndex > 0) then
		        self.ChatTabs.icon(tabIndex) = if(Prefs.StatusIconSet <> Nil AND Prefs.StatusIconSet.Available <> Nil, Prefs.StatusIconSet.Available, Nil)
		      end if
		    end if
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WiredConnectionChatReceived(connection As WiredConnection, chatID As Integer, user As WiredUser, message As Text, isAction As Boolean)
		  #Pragma Unused chatID
		  #Pragma Unused user
		  #Pragma Unused message
		  #Pragma Unused isAction
		  
		  
		  DIM index As Integer = self.mConnections.IndexOf(connection)
		  
		  if (index <> -1) AND (self.ChatTabs.Value <> (index)) then
		    self.ChatTabs.icon(index) = if(Prefs.StatusIconSet = Nil, Nil, Prefs.StatusIconSet.Content)
		  end if
		  
		  self.ChatTabs.Update
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WiredConnectionDisconnected(connection As WiredConnection)
		  // Part of the Observers.GotConnectionLost.GotConnectionLostInterface interface.
		  
		  DIM index As Integer = self.mConnections.IndexOf(connection)
		  
		  if (index <> -1) then
		    self.ChatTabs.Icon(index) = if(Prefs.StatusIconSet <> Nil AND Prefs.StatusIconSet.Offline <> Nil, Prefs.StatusIconSet.Offline, Nil)
		    'self.ChatTabs.Caption(index) = self.mConnections(index).ServerName + " (" + ssWired.kDisconnected + ")"
		    '
		    'if (index = self.ChatTabs.Value) then
		    'self.Title = self.ChatTabs.Caption(index)
		    'end if
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WiredConnectionLoginSuccessful(connection As WiredConnection)
		  DIM index As Integer = self.mConnections.IndexOf(connection)
		  
		  if (index = -1) then
		    self.mConnections.Append connection
		    self.ChatTabs.AppendTab connection.ServerName, _
		    if(Prefs.StatusIconSet <> Nil AND Prefs.StatusIconSet.Available <> Nil, Prefs.StatusIconSet.Available, Nil), TRUE
		    self.NewsTabs.AppendTab connection.ServerName, Nil, FALSE
		    self.FilesTabs.AppendTab connection.ServerName, Nil, FALSE
		  else
		    self.ChatTabs.icon(index) = if(Prefs.StatusIconSet <> Nil, Prefs.StatusIconSet.Available, Nil)
		  end if
		  
		  if (self.ChatTabs.TabCount = 1) AND (not self.Visible) then
		    self.Show
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WiredConnectionUserChanged(connection As WiredConnection, oldUser As WiredUser, newUser As WiredUser)
		  #Pragma Unused oldUser
		  
		  DIM tabIndex As Integer = self.mConnections.IndexOf(connection)
		  
		  if (tabIndex <> -1) AND (newUser = self.mConnections(tabIndex).MyUser) then
		    if (newUser.IsIdle) then
		      self.ChatTabs.icon(tabIndex) = if(Prefs.StatusIconSet <> Nil AND Prefs.StatusIconSet.Idle <> Nil, Prefs.StatusIconSet.Idle, Nil)
		    else
		      self.ChatTabs.icon(tabIndex) = if(Prefs.StatusIconSet <> Nil AND Prefs.StatusIconSet.Available <> Nil, Prefs.StatusIconSet.Available, Nil)
		    end if
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WiredStatusIconSetChanged(sender As Object)
		  #Pragma Unused sender
		  
		  for i As Integer = 1 to self.mConnections.Ubound  // index(0) is the Connect tab
		    try
		      if (Prefs.StatusIconSet = Nil) then
		        self.ChatTabs.icon(i) = Nil
		        'elseif (self.mConnections(i).IsConnected) AND (self.mConnections(i).IsIdle) then
		        'self.ChatTabs.icon(i) = if(statusIconSet = Nil, Nil, statusIconSet.Idle)
		      elseif (self.mConnections(i).IsConnected) then
		        self.ChatTabs.icon(i) = if(Prefs.StatusIconSet = Nil, Nil, Prefs.StatusIconSet.Available)
		      elseif (NOT self.mConnections(i).IsConnected) then
		        self.ChatTabs.icon(i) = if(Prefs.StatusIconSet = Nil, Nil, Prefs.StatusIconSet.Offline)
		      else
		        self.ChatTabs.icon(i) = Nil
		      end if
		    catch err
		      self.ChatTabs.icon(i) = Nil
		    end try
		  next
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mConnections() As WiredConnection
	#tag EndProperty


#tag EndWindowCode

#tag Events ChatTabs
	#tag Event
		Sub Open()
		  '#if not TargetCocoa
		  'me.Top = me.Top + 6
		  '#endif
		  
		  me.AttachPanel ChatPanel
		  
		  self.ChatTabs.AppendTab Strings.kConnect, Nil, FALSE
		End Sub
	#tag EndEvent
	#tag Event
		Sub PanelPageAdded(panel as pagePanel, page as integer)
		  if (page > 0) then
		    self.AddChatContainer panel, page
		    'self.UpdateChatTab page
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Function CancelRemoveTab(tabIndex as integer) As boolean
		  #Pragma Unused tabIndex
		  
		  Return Self.CancelDisconnect()
		End Function
	#tag EndEvent
	#tag Event
		Sub TabRemoved(tabIndex as integer)
		  if (tabIndex > 0) then
		    me.Value = tabIndex - 1
		  elseif (tabIndex = 0) then
		    me.Value = 1
		  end if
		  
		  DIM connection As WiredConnection = self.mConnections(tabIndex)
		  ObjObserver.Notify connection, Events.kWiredWindowClosing
		  
		  connection.Close
		  
		  self.NewsTabs.RemoveTab (tabIndex - 1)
		  self.FilesTabs.RemoveTab (tabIndex - 1)
		  self.mConnections.Remove tabIndex
		End Sub
	#tag EndEvent
	#tag Event
		Sub TabChanged(tabIndex as integer)
		  #Pragma Unused tabIndex
		  
		  me.Update
		  self.UpdateChatTab tabIndex
		  if (tabIndex > 0) then
		    self.NewsTabs.Value =  tabIndex - 1
		    self.FilesTabs.Value = tabIndex - 1
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events NewsTabs
	#tag Event
		Sub Open()
		  '#if not TargetCocoa
		  'me.Top = me.Top + 6
		  '#endif
		  
		  me.AttachPanel NewsPanel
		End Sub
	#tag EndEvent
	#tag Event
		Sub PanelPageAdded(panel as pagePanel, page as integer)
		  DIM container As NEW SwirlNewsContainer(self.mConnections(self.mConnections.Ubound))
		  container.EmbedWithinPanel panel, page, 0, 0, panel.Width, panel.Height
		End Sub
	#tag EndEvent
	#tag Event
		Sub TabRemoved(tabIndex as integer)
		  if (tabIndex > 0) then
		    me.Value = tabIndex - 1
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Sub TabChanged(tabIndex as integer)
		  #Pragma Unused tabIndex
		  
		  'self.UpdateChatTab tabIndex
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events FilesTabs
	#tag Event
		Sub Open()
		  '#if not TargetCocoa
		  'me.Top = me.Top + 6
		  '#endif
		  
		  me.AttachPanel FilesPanel
		End Sub
	#tag EndEvent
	#tag Event
		Sub PanelPageAdded(panel as pagePanel, page as integer)
		  DIM container As NEW SwirlFilesContainer(self.mConnections(self.mConnections.Ubound))
		  container.EmbedWithinPanel panel, page, 0, 0, panel.Width, panel.Height
		End Sub
	#tag EndEvent
	#tag Event
		Sub TabRemoved(tabIndex as integer)
		  if (tabIndex > 0) then
		    me.Value = tabIndex - 1
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Sub TabChanged(tabIndex as integer)
		  #Pragma Unused tabIndex
		  
		  'self.UpdateChatTab tabIndex
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ChatToolbar1
	#tag Event
		Sub Action(item As ToolItem)
		  select case item.Caption
		  case Strings.kChat
		    self.PagePanel1.Value = 0
		  case Strings.kNews
		    self.PagePanel1.Value = 1
		  case Strings.kFiles
		    self.PagePanel1.Value = 2
		  end select
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
