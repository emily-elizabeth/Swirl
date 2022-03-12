#tag Window
Begin Window SwirlUserInfoWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   400
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   400
   MinimizeButton  =   True
   MinWidth        =   300
   Placement       =   0
   Resizeable      =   True
   Title           =   "#Strings.kUserInfoTitle"
   Visible         =   True
   Width           =   300
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
      TabPanelIndex   =   0
      Top             =   78
      Visible         =   True
      Width           =   260
   End
   Begin PagePanel PagePanel1
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
      Value           =   1
      Visible         =   True
      Width           =   300
      Begin Label LoginL
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
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
         TextAlign       =   2
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
      Begin Label IDL
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
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
         TextAlign       =   2
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
      Begin Label AddressL
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
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
         TextAlign       =   2
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
      Begin Label HostL
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
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
         TextAlign       =   2
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
      Begin Label VersionL
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
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
         TextAlign       =   2
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
      Begin Label CIpherL
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
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
         TextAlign       =   2
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
      Begin Label LoginTimeL
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
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
         TextAlign       =   2
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
      Begin Label IdleTimeL
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
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
         TextAlign       =   2
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
      Begin Label UserLogin
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
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
      Begin Label UserID
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
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
      Begin Label UserAddress
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
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
      Begin Label UserHost
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
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
      Begin Label UserVersion
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
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
      Begin Label UserCipher
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
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
      Begin Label UserLoginTime
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
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
      Begin Label UserIdleTime
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
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
      Begin Listbox DownloadsList
         AutoDeactivate  =   True
         AutoHideScrollbars=   True
         Bold            =   False
         Border          =   True
         ColumnCount     =   1
         ColumnsResizable=   False
         ColumnWidths    =   ""
         DataField       =   ""
         DataSource      =   ""
         DefaultRowHeight=   48
         Enabled         =   True
         EnableDrag      =   False
         EnableDragReorder=   False
         GridLinesHorizontal=   0
         GridLinesVertical=   0
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
         TabIndex        =   0
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   119
         Underline       =   False
         UseFocusRing    =   False
         Visible         =   True
         Width           =   300
         _ScrollOffset   =   0
         _ScrollWidth    =   -1
      End
      Begin Listbox UploadsList
         AutoDeactivate  =   True
         AutoHideScrollbars=   True
         Bold            =   False
         Border          =   True
         ColumnCount     =   1
         ColumnsResizable=   False
         ColumnWidths    =   ""
         DataField       =   ""
         DataSource      =   ""
         DefaultRowHeight=   48
         Enabled         =   True
         EnableDrag      =   False
         EnableDragReorder=   False
         GridLinesHorizontal=   0
         GridLinesVertical=   0
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
         TabIndex        =   0
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   119
         Underline       =   False
         UseFocusRing    =   False
         Visible         =   True
         Width           =   300
         _ScrollOffset   =   0
         _ScrollWidth    =   -1
      End
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Close()
		  Xojo.Core.Timer.CancelCall WeakAddressOf RequestUserInfo
		  
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
		Sub Open()
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
		Private Sub WiredConnectionUserInfoReceived(connection As WiredConnection, user As WiredUser, isIdle As Boolean, isAdmin As Boolean, nick As Text, login As Text, IP As Text, host As Text, clientVersion As Text, cipherName As Text, cipherBits As Integer, loginTime As Xojo.Core.Date, idleTime As Xojo.Core.Date, downloads As Text, uploads As Text, status As Text, icon As Picture)
		  if (connection = self.mConnection) AND (user = self.mUser) then
		    self.UserLogin.Text = login
		    self.UserID.Text = Str(user.UserID)
		    self.UserAddress.Text = IP
		    self.UserHost.Text = host
		    self.UserVersion.Text = clientVersion
		    self.UserCipher.Text = cipherName + "/" + Str(cipherBits)
		    self.UserLoginTime.Text = loginTime.ToText()
		    self.UserIdleTime.Text = idleTime.ToText()
		    
		    self.DownloadsList.DeleteAllRows
		    if (NOT downloads.Empty) then
		      DIM tList() As Text = downloads.Split(NetWiredSocket.GS)
		      for i as Integer = 0 to tList.Ubound
		        self.DownloadsList.AddRow ""
		        self.DownloadsList.RowTag(self.DownloadsList.LastIndex) = tList(i)
		      next
		    end if
		    
		    self.UploadsList.DeleteAllRows
		    if (NOT uploads.Empty) then
		      DIM tList() As Text = uploads.Split(NetWiredSocket.GS)
		      for i as Integer = 0 to tList.Ubound
		        self.UploadsList.AddRow ""
		        self.UploadsList.RowTag(self.UploadsList.LastIndex) = tList(i)
		      next
		    end if
		    
		    Xojo.Core.Timer.CallLater 2000, WeakAddressOf RequestUserInfo
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WiredConnectionUserJoined(connection As WiredConnection, chatID As Integer, user As WiredUser)
		  if (connection = self.mConnection) AND (user.Login = self.mUser.Login) then
		    Xojo.Core.Timer.CallLater 2000, WeakAddressOf RequestUserInfo
		    self.UserIcon.Refresh
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WiredConnectionUserKicked(connection As WiredConnection, victim As WiredUser, killer As WiredUser, kickMessage As String, isBan As Boolean)
		  if (connection = self.mConnection) AND (victim = self.mUser) then
		    Xojo.Core.Timer.CancelCall WeakAddressOf RequestUserInfo
		    self.UserIcon.Refresh
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WiredConnectionUserLeft(connection As WiredConnection, chatID As Integer, user As WiredUser)
		  if (connection = self.mConnection) AND (user = self.mUser) AND (chatID = 1) then
		    Xojo.Core.Timer.CancelCall WeakAddressOf RequestUserInfo
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
#tag Events SegmentedControl1
	#tag Event
		Sub Action(itemIndex as integer)
		  self.PagePanel1.Value = itemIndex
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events DownloadsList
	#tag Event
		Function CellTextPaint(g As Graphics, row As Integer, column As Integer, x as Integer, y as Integer) As Boolean
		  #Pragma DisableBackgroundTasks
		  
		  DIM info As String = me.RowTag(row)
		  DIM infoA() As String = info.Split(NetWiredSocket.RS)
		  
		  // draw the progress bar
		  DIM percent As Integer
		  DIM pixels As Integer
		  DIM value As UInt64 = Val(infoA(1))
		  DIM max As UInt64 = Val(infoA(2))
		  
		  percent = value * 100 / max
		  if (percent > 100) then percent = 100
		  pixels = percent * (g.Width - 20) / 100
		  
		  g.ForeColor = &c00FF00
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
#tag Events UploadsList
	#tag Event
		Function CellTextPaint(g As Graphics, row As Integer, column As Integer, x as Integer, y as Integer) As Boolean
		  #Pragma DisableBackgroundTasks
		  
		  DIM info As String = me.RowTag(row)
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
		Name="CloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Frame"
		Visible=true
		Group="Frame"
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
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
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
		InitialValue="400"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Behavior"
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
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		Type="MenuBar"
		EditorType="MenuBar"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinWidth"
		Visible=true
		Group="Size"
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
		Group="Behavior"
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
		Group="Frame"
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
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
	#tag EndViewProperty
#tag EndViewBehavior
