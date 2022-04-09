#tag DesktopWindow
Begin DesktopWindow SwirlUserInfoWindow
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF00
   Composite       =   False
   DefaultLocation =   0
   FullScreen      =   False
   HasBackgroundColor=   False
   HasCloseButton  =   True
   HasFullScreenButton=   False
   HasMaximizeButton=   True
   HasMinimizeButton=   True
   Height          =   400
   ImplicitInstance=   True
   MacProcID       =   0
   MaximumHeight   =   32000
   MaximumWidth    =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinimumHeight   =   400
   MinimumWidth    =   300
   Resizeable      =   True
   Title           =   "#Strings.kUserInfoTitle"
   Type            =   0
   Visible         =   True
   Width           =   300
   Begin DesktopCanvas UserIcon
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      Enabled         =   True
      Height          =   46
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   2
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   20
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   260
   End
   BeginSegmented SegmentedControl SegmentedControl1
      Enabled         =   True
      Height          =   24
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      MacControlStyle =   0
      Scope           =   2
      Segments        =   "#Strings.kInfo\n\nFalse\r#Strings.kDownloads\n\nFalse\r#Strings.kUploads\n\nFalse"
      SelectionType   =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   78
      Transparent     =   True
      Visible         =   True
      Width           =   260
   End
   Begin DesktopPagePanel PagePanel1
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   325
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
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   99
      Transparent     =   True
      Value           =   0
      Visible         =   True
      Width           =   300
      Begin DesktopLabel LoginL
         AutoDeactivate  =   True
         Bold            =   False
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "PagePanel1"
         Italic          =   False
         Left            =   20
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   2
         Selectable      =   False
         TabIndex        =   0
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "#Strings.kLogin"
         TextAlign       =   3
         TextColor       =   &c00000000
         TextFont        =   "SmallSystem"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   119
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   61
      End
      Begin DesktopLabel IDL
         AutoDeactivate  =   True
         Bold            =   False
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "PagePanel1"
         Italic          =   False
         Left            =   20
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   2
         Selectable      =   False
         TabIndex        =   1
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "#Strings.kID"
         TextAlign       =   3
         TextColor       =   &c00000000
         TextFont        =   "SmallSystem"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   140
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   61
      End
      Begin DesktopLabel AddressL
         AutoDeactivate  =   True
         Bold            =   False
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "PagePanel1"
         Italic          =   False
         Left            =   20
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   2
         Selectable      =   False
         TabIndex        =   2
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "#Strings.kAddress"
         TextAlign       =   3
         TextColor       =   &c00000000
         TextFont        =   "SmallSystem"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   160
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   61
      End
      Begin DesktopLabel HostL
         AutoDeactivate  =   True
         Bold            =   False
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "PagePanel1"
         Italic          =   False
         Left            =   20
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   2
         Selectable      =   False
         TabIndex        =   3
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "#Strings.kHost"
         TextAlign       =   3
         TextColor       =   &c00000000
         TextFont        =   "SmallSystem"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   180
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   61
      End
      Begin DesktopLabel VersionL
         AutoDeactivate  =   True
         Bold            =   False
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "PagePanel1"
         Italic          =   False
         Left            =   20
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   2
         Selectable      =   False
         TabIndex        =   4
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "#Strings.kVersion"
         TextAlign       =   3
         TextColor       =   &c00000000
         TextFont        =   "SmallSystem"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   200
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   61
      End
      Begin DesktopLabel CIpherL
         AutoDeactivate  =   True
         Bold            =   False
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "PagePanel1"
         Italic          =   False
         Left            =   20
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   2
         Selectable      =   False
         TabIndex        =   5
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "#Strings.kCipher"
         TextAlign       =   3
         TextColor       =   &c00000000
         TextFont        =   "SmallSystem"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   221
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   61
      End
      Begin DesktopLabel LoginTimeL
         AutoDeactivate  =   True
         Bold            =   False
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "PagePanel1"
         Italic          =   False
         Left            =   20
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   2
         Selectable      =   False
         TabIndex        =   6
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "#Strings.kLoginTIme"
         TextAlign       =   3
         TextColor       =   &c00000000
         TextFont        =   "SmallSystem"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   241
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   61
      End
      Begin DesktopLabel IdleTimeL
         AutoDeactivate  =   True
         Bold            =   False
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "PagePanel1"
         Italic          =   False
         Left            =   20
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   2
         Selectable      =   False
         TabIndex        =   7
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "#Strings.kIdleTime"
         TextAlign       =   3
         TextColor       =   &c00000000
         TextFont        =   "SmallSystem"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   261
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   61
      End
      Begin DesktopLabel UserLogin
         AutoDeactivate  =   True
         Bold            =   False
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "PagePanel1"
         Italic          =   False
         Left            =   93
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Multiline       =   False
         Scope           =   2
         Selectable      =   False
         TabIndex        =   8
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   ""
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "SmallSystem"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   118
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   187
      End
      Begin DesktopLabel UserID
         AutoDeactivate  =   True
         Bold            =   False
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "PagePanel1"
         Italic          =   False
         Left            =   93
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Multiline       =   False
         Scope           =   2
         Selectable      =   False
         TabIndex        =   9
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   ""
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "SmallSystem"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   140
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   187
      End
      Begin DesktopLabel UserAddress
         AutoDeactivate  =   True
         Bold            =   False
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "PagePanel1"
         Italic          =   False
         Left            =   93
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Multiline       =   False
         Scope           =   2
         Selectable      =   False
         TabIndex        =   10
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   ""
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "SmallSystem"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   160
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   187
      End
      Begin DesktopLabel UserHost
         AutoDeactivate  =   True
         Bold            =   False
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "PagePanel1"
         Italic          =   False
         Left            =   93
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Multiline       =   False
         Scope           =   2
         Selectable      =   False
         TabIndex        =   11
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   ""
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "SmallSystem"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   180
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   187
      End
      Begin DesktopLabel UserVersion
         AutoDeactivate  =   True
         Bold            =   False
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "PagePanel1"
         Italic          =   False
         Left            =   93
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Multiline       =   False
         Scope           =   2
         Selectable      =   False
         TabIndex        =   12
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   ""
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "SmallSystem"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   200
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   187
      End
      Begin DesktopLabel UserCipher
         AutoDeactivate  =   True
         Bold            =   False
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "PagePanel1"
         Italic          =   False
         Left            =   93
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Multiline       =   False
         Scope           =   2
         Selectable      =   False
         TabIndex        =   13
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   ""
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "SmallSystem"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   221
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   187
      End
      Begin DesktopLabel UserLoginTime
         AutoDeactivate  =   True
         Bold            =   False
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "PagePanel1"
         Italic          =   False
         Left            =   93
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Multiline       =   False
         Scope           =   2
         Selectable      =   False
         TabIndex        =   14
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   ""
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "SmallSystem"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   241
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   187
      End
      Begin DesktopLabel UserIdleTime
         AutoDeactivate  =   True
         Bold            =   False
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "PagePanel1"
         Italic          =   False
         Left            =   93
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Multiline       =   False
         Scope           =   2
         Selectable      =   False
         TabIndex        =   15
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   ""
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "SmallSystem"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   261
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   187
      End
      Begin DesktopListBox DownloadsList
         AutoDeactivate  =   True
         AutoHideScrollbars=   True
         Bold            =   False
         Border          =   True
         ColumnCount     =   1
         ColumnsResizable=   False
         ColumnWidths    =   ""
         DefaultRowHeight=   48
         Enabled         =   True
         EnableDrag      =   False
         EnableDragReorder=   False
         GridLineStyle   =   0
         HasHeading      =   False
         HeadingIndex    =   -1
         Height          =   281
         HelpTag         =   ""
         Hierarchical    =   False
         Index           =   -2147483648
         InitialParent   =   "PagePanel1"
         InitialValue    =   ""
         Italic          =   False
         Left            =   0
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         RequiresSelection=   False
         Scope           =   2
         ScrollbarHorizontal=   False
         ScrollBarVertical=   True
         SelectionType   =   0
         ShowDropIndicator=   False
         TabIndex        =   0
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   119
         Transparent     =   True
         Underline       =   False
         UseFocusRing    =   False
         Visible         =   True
         Width           =   300
         _ScrollOffset   =   0
         _ScrollWidth    =   -1
      End
      Begin DesktopListBox UploadsList
         AutoDeactivate  =   True
         AutoHideScrollbars=   True
         Bold            =   False
         Border          =   True
         ColumnCount     =   1
         ColumnsResizable=   False
         ColumnWidths    =   ""
         DefaultRowHeight=   48
         Enabled         =   True
         EnableDrag      =   False
         EnableDragReorder=   False
         GridLineStyle   =   0
         HasHeading      =   False
         HeadingIndex    =   -1
         Height          =   281
         HelpTag         =   ""
         Hierarchical    =   False
         Index           =   -2147483648
         InitialParent   =   "PagePanel1"
         InitialValue    =   ""
         Italic          =   False
         Left            =   0
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         RequiresSelection=   False
         Scope           =   2
         ScrollbarHorizontal=   False
         ScrollBarVertical=   True
         SelectionType   =   0
         ShowDropIndicator=   False
         TabIndex        =   0
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   119
         Transparent     =   True
         Underline       =   False
         UseFocusRing    =   False
         Visible         =   True
         Width           =   300
         _ScrollOffset   =   0
         _ScrollWidth    =   -1
      End
   End
End
#tag EndDesktopWindow

#tag WindowCode
	#tag Event
		Sub Closing()
		  Timer.CancelCallLater WeakAddressOf RequestUserInfo
		  
		  ObjObserver.Unlisten self, Events.kWiredConnectionUserChanged
		  ObjObserver.Unlisten self, Events.kWiredConnectionUserIconChanged
		  ObjObserver.Unlisten self, Events.kWiredConnectionUserInfoReceived
		  ObjObserver.Unlisten self, Events.kWiredConnectionUserJoined
		  ObjObserver.Unlisten self, Events.kWiredConnectionUserKicked
		  ObjObserver.Unlisten self, Events.kWiredConnectionUserLeft
		  ObjObserver.Unlisten self, Events.kWiredWindowClosing
		End Sub
	#tag EndEvent

	#tag Event
		Sub Opening()
		  self.Title = Strings.kUserInfoTitle
		  self.Title = self.Title.Replace("%nick%", self.mUser.Nick)
		  self.Title = self.Title.Replace("%servername%", self.mConnection.ServerName)
		  
		  ObjObserver.Listen self, Events.kWiredConnectionUserChanged
		  ObjObserver.Listen self, Events.kWiredConnectionUserIconChanged
		  ObjObserver.Listen self, Events.kWiredConnectionUserInfoReceived
		  ObjObserver.Listen self, Events.kWiredConnectionUserJoined
		  ObjObserver.Listen self, Events.kWiredConnectionUserKicked
		  ObjObserver.Listen self, Events.kWiredConnectionUserLeft
		  ObjObserver.Listen self, Events.kWiredWindowClosing
		  
		  self.mConnection.RequestUserInfo self.mUser
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function Compare(connection As WiredConnection, user As WiredUser) As Boolean
		  Return ((connection = self.mConnection) AND (user = self.mUser))
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
		Shared Sub Exists(connection As WiredConnection, user As WiredUser)
		  DIM results As SwirlUserInfoWindow
		  
		  for i as Integer = 0 to (WindowCount - 1)
		    if (Window(i) IsA SwirlUserInfoWindow) then
		      if (SwirlUserInfoWindow(Window(i)).Compare(connection, user)) then
		        results = SwirlUserInfoWindow(Window(i))
		        exit for i
		      end if
		    end if
		  next
		  
		  if (results = Nil) then
		    results = NEW SwirlUserInfoWindow(connection, user)
		  end if
		  
		  results.Show
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RequestUserInfo()
		  self.mConnection.RequestUserInfo self.mUser
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WiredConnectionUserChanged(connection As WiredConnection, oldUser As WiredUser, newUser As WiredUser)
		  if (connection = self.mConnection) AND (oldUser = self.mUser) then
		    self.mUser = newUser
		    self.UserIcon.Refresh
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WiredConnectionUserIconChanged(connection As WiredConnection, user As WiredUser)
		  if (connection = self.mConnection) then
		    self.UserIcon.Refresh
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WiredConnectionUserInfoReceived(connection As WiredConnection, user As WiredUser, isIdle As Boolean, isAdmin As Boolean, nick As String, login As String, IP As String, host As String, clientVersion As String, cipherName As String, cipherBits As Integer, loginTime As DateTime, idleTime As DateTime, downloads As String, uploads As String, status As String, icon As Picture)
		  if (connection = self.mConnection) AND (user = self.mUser) then
		    self.UserLogin.Text = login
		    self.UserID.Text = Str(user.UserID)
		    self.UserAddress.Text = IP
		    self.UserHost.Text = host
		    self.UserVersion.Text = clientVersion
		    self.UserCipher.Text = cipherName + "/" + Str(cipherBits)
		    self.UserLoginTime.Text = loginTime.ToString()
		    self.UserIdleTime.Text = idleTime.ToString()
		    
		    self.DownloadsList.RemoveAllRows
		    if (NOT downloads.IsEmpty) then
		      DIM tList() As String = downloads.Split(NetWiredSocket.GS)
		      for i as Integer = 0 to tList.Ubound
		        self.DownloadsList.AddRow ""
		        self.DownloadsList.RowTagAt(self.DownloadsList.LastAddedRowIndex) = tList(i)
		      next
		    end if
		    
		    self.UploadsList.RemoveAllRows
		    if (NOT uploads.IsEmpty) then
		      DIM tList() As String = uploads.Split(NetWiredSocket.GS)
		      for i as Integer = 0 to tList.Ubound
		        self.UploadsList.AddRow ""
		        self.UploadsList.RowTagAt(self.UploadsList.LastAddedRowIndex) = tList(i)
		      next
		    end if
		    
		    Timer.CallLater 2000, WeakAddressOf RequestUserInfo
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WiredConnectionUserJoined(connection As WiredConnection, chatID As Integer, user As WiredUser)
		  if (connection = self.mConnection) AND (user.Login = self.mUser.Login) then
		    Timer.CallLater 2000, WeakAddressOf RequestUserInfo
		    self.UserIcon.Refresh
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WiredConnectionUserKicked(connection As WiredConnection, victim As WiredUser, killer As WiredUser, kickMessage As String, isBan As Boolean)
		  if (connection = self.mConnection) AND (victim = self.mUser) then
		    Timer.CancelCallLater WeakAddressOf RequestUserInfo
		    self.UserIcon.Refresh
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WiredConnectionUserLeft(connection As WiredConnection, chatID As Integer, user As WiredUser)
		  if (connection = self.mConnection) AND (user = self.mUser) AND (chatID = 1) then
		    Timer.CancelCallLater WeakAddressOf RequestUserInfo
		    self.UserIcon.Refresh
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WiredWindowClosing(connection As WiredConnection)
		  if (connection = self.mConnection) then
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


#tag EndWindowCode

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
		  g.ForeColor = DisabledTextColor
		  g.TextSize = 11
		  g.DrawString self.mUser.Status, 44, 32, 0, TRUE
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SegmentedControl1
	#tag Event
		Sub Action(itemIndex as integer)
		  self.PagePanel1.SelectedPanelIndex = itemIndex
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events DownloadsList
	#tag Event
		Function PaintCellText(g as Graphics, row as Integer, column as Integer, x as Integer, y as Integer) As Boolean
		  #Pragma DisableBackgroundTasks
		  
		  DIM info As String = me.RowTagAt(row)
		  DIM infoA() As String = info.Split(NetWiredSocket.RS)
		  
		  // draw the progress bar
		  DIM percent As Integer
		  DIM pixels As Integer
		  DIM value As UInt64 = Val(infoA(1))
		  DIM max As UInt64 = Val(infoA(2))
		  
		  percent = value * 100 / max
		  if (percent > 100) then percent = 100
		  pixels = percent * (g.Width - 20) / 100
		  
		  g.ForeColor = Color.Green
		  g.FillRoundRect 9, g.TextHeight + 6, pixels, g.Height - g.TextHeight - 24, 6.0, 6.0
		  g.ForeColor = Color.LightGray
		  g.DrawRoundRect 9, g.TextHeight + 6, g.Width - 20, g.Height - g.TextHeight - 24, 6.0, 6.0
		  
		  // draw the path of the download
		  g.ForeColor = Color.TextColor
		  g.DrawString infoA(0), 9, g.TextHeight
		  
		  // draw the status line
		  g.TextSize = 10
		  g.DrawString FormatByteCount(Val(infoA(1)), FormatByteCount.ByteCountFormatterStyle.Binary) + " of " + _
		  FormatByteCount(Val(infoA(2)), FormatByteCount.ByteCountFormatterStyle.Binary) + " - " + _
		  FormatByteCount(Val(infoA(3)), FormatByteCount.ByteCountFormatterStyle.Binary) + "/s", 9, g.Height - 6
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events UploadsList
	#tag Event
		Function PaintCellText(g as Graphics, row as Integer, column as Integer, x as Integer, y as Integer) As Boolean
		  #Pragma DisableBackgroundTasks
		  
		  DIM info As String = me.RowTagAt(row)
		  DIM infoA() As String = info.Split(NetWiredSocket.RS)
		  
		  // draw the progress bar
		  DIM percent As Integer
		  DIM pixels As Integer
		  DIM value As UInt64 = Val(infoA(1))
		  DIM max As UInt64 = Val(infoA(2))
		  
		  percent = value * 100 / max
		  if (percent > 100) then percent = 100
		  pixels = percent * (g.Width - 20) / 100
		  
		  g.ForeColor = &c0000FF
		  g.FillRoundRect 9, g.TextHeight + 6, pixels, g.Height - g.TextHeight - 24, 6.0, 6.0
		  g.ForeColor = &c888888
		  g.DrawRoundRect 9, g.TextHeight + 6, g.Width - 20, g.Height - g.TextHeight - 24, 6.0, 6.0
		  
		  // draw the path of the download
		  g.ForeColor = Colours.Black
		  g.DrawString infoA(0), 9, g.TextHeight
		  
		  // draw the status line
		  g.TextSize = 10
		  g.DrawString FormatByteCount(Val(infoA(1)), FormatByteCount.ByteCountFormatterStyle.Binary) + " of " + _
		  FormatByteCount(Val(infoA(2)), FormatByteCount.ByteCountFormatterStyle.Binary) + " - " + _
		  FormatByteCount(Val(infoA(3)), FormatByteCount.ByteCountFormatterStyle.Binary) + "/s", 9, g.Height - 6
		End Function
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
		Type="Color"
		EditorType="Color"
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
		Name="Composite"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Behavior"
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
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		InitialValue=""
		Type="MenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=false
		Group="Behavior"
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
		Group="Frame"
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
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
