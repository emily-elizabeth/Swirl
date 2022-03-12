#tag Window
Begin ContainerControl ConnectContainer
   AcceptFocus     =   False
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   Compatibility   =   ""
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
   Begin TextField Address
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      CueText         =   "#Strings.kAddress"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   False
      Left            =   428
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   2
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "shaosean.tk"
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   141
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   310
   End
   Begin PushButton AddToFavourites
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "#Strings.kAddToFavourites"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   428
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   2
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   244
      Underline       =   False
      Visible         =   True
      Width           =   172
   End
   Begin Listbox BookmarkList
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   False
      ColumnCount     =   1
      ColumnsResizable=   False
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   False
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
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   2
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   0
      Underline       =   False
      UseFocusRing    =   False
      Visible         =   True
      Width           =   405
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin PushButton ConnectButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "#Strings.kConnect"
      Default         =   True
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   624
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   2
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   243
      Underline       =   False
      Visible         =   True
      Width           =   114
   End
   Begin TextField Login
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      CueText         =   "#Strings.kLogin"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   False
      Left            =   428
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   2
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   175
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   310
   End
   Begin Label Message
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
      Left            =   428
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlign       =   1
      TextColor       =   &c00000000
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   526
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   218
   End
   Begin TextField Password
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      CueText         =   "#Strings.kPassword"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   False
      Left            =   428
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      Password        =   True
      ReadOnly        =   False
      Scope           =   2
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   209
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   310
   End
   Begin ProgressWheel Progress
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   16
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   697
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   2
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   False
      Top             =   515
      Visible         =   False
      Width           =   16
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h21
		Private Sub Connect()
		  // disable the GUI
		  
		  DIM serverParts() As Text = self.Address.Text.ToText.Split(":")
		  if (serverParts.Ubound = 0) then  // only an address
		    serverParts.Append "2000"
		  end if
		  DIM login As Text = self.Login.Text.ToText
		  if (login.Empty) then
		    login = "guest"
		  end if
		  DIM pass As Text = self.Password.Text.ToText
		  if (pass.Length <> 40) then
		    pass = NetWiredSocket.HashPassword(pass)
		  end if
		  
		  DIM connection As NEW WiredConnection
		  connection.Connect serverParts(0), Integer.FromText(serverParts(1)), login, pass
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub InitBookmarkList()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function LoadBookmark(bookmark As Xojo.IO.FolderItem) As URLComponents
		  DIM results As URLComponents
		  
		  if (bookmark <> Nil) AND (bookmark.Exists) then
		    DIM input As Xojo.IO.TextInputStream = Xojo.IO.TextInputStream.Open(bookmark, Xojo.Core.TextEncoding.UTF8)
		    DIM bookmarkData As Text = input.ReadAll()
		    input.Close
		    
		    results = NEW URLComponents(bookmarkData)
		  end if
		  
		  Return results
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LoadBookmarks()
		  self.BookmarkList.DeleteAllRows
		  
		  if (Paths.Bookmarks <> Nil) AND (Paths.Bookmarks.Exists) AND (Paths.Bookmarks.Count > 0) then
		    for each path As xojo.IO.FolderItem in Paths.Bookmarks.Children
		      if (path <> Nil) AND (path.Exists) AND (path.IsVisible) AND (path.Name.Left(1) <> ".") AND (path.Name.IndexOf(".swirlBookmark") > -1) then
		        DIM bookmark As URLComponents = self.LoadBookmark(path)
		        
		        self.BookmarkList.AddRow bookmark.User + " @ " + bookmark.Host + if(bookmark.Port = 2000, "", ":" + bookmark.Port.ToText)
		        self.BookmarkList.RowTag(self.BookmarkList.LastIndex) = bookmark
		      end if
		    next
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LoginFailed()
		  ' connection As WiredConnection, chatID As Integer, userInfo As Variant
		  
		  ' if (connection = self.mConnection) then
		  ' self.Reset
		  ' self.Message.Text = ssWired.kErrorLoginFailed
		  ' self.ConnectButton.Visible = FALSE
		  ' end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Reset()
		  ' self.Address.Enabled = TRUE
		  ' self.Login.Enabled = TRUE
		  ' self.Password.Enabled = TRUE
		  ' self.ConnectButton.Enabled = TRUE
		  ' self.ConnectButton.Visible = TRUE
		  ' self.Progress.Visible = FALSE
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events Address
	#tag Event
		Sub TextChange()
		  ' self.ConnectButton.Enabled = (Trim(me.Text) <> "")
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events AddToFavourites
	#tag Event
		Sub Action()
		  if (NOT self.Address.Text.ToText.Empty) then
		    DIM wiredURL As Text = "wired://" + _
		    if(self.Login.Text.ToText.Empty, "guest", self.Login.Text.ToText) + _
		    if(self.Password.Text.ToText.Empty, "", ":" + NetWiredSocket.HashPassword(self.Password.Text.ToText)) + _
		    "@" + _
		    if(self.Address.Text.ToText.IndexOf(":") > -1, self.Address.Text.ToText, self.Address.Text.ToText + ":2000")
		    
		    DIM bookmarkData As NEW URLComponents(wiredURL)
		    if (bookmarkData <> Nil) then
		      DIM bookmarkName As Text = bookmarkData.Host + "_" + bookmarkData.Port.ToText + "_" + bookmarkData.User + ".swirlBookmark"
		      DIM output As Xojo.IO.TextOutputStream
		      output = Xojo.IO.TextOutputStream.Create(Paths.Bookmarks.Child(bookmarkName), Xojo.Core.TextEncoding.UTF8)
		      output.Write bookmarkData  // URLComponents automatically writes out to text
		      output.Close
		    end if
		    
		    self.LoadBookmarks
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events BookmarkList
	#tag Event
		Sub Open()
		  self.LoadBookmarks
		End Sub
	#tag EndEvent
	#tag Event
		Sub Change()
		  if (me.ListIndex > -1) AND (me.RowTag(me.ListIndex) <> Nil) then
		    DIM bookmark As URLComponents = me.RowTag(me.ListIndex)
		    self.Address.Text = bookmark.Host + if(bookmark.Port = 2000, "", ":" + bookmark.Port.ToText)
		    self.Login.Text = bookmark.User
		    self.Password.Text = bookmark.Password
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Sub ExpandRow(row As Integer)
		  'if (me.Cell(row, 0) = ssWired.kBookmarks) then
		  'if (ssWired.Bookmarks <> Nil) AND (ssWired.Bookmarks.Exists) then
		  'for each path As xojo.IO.FolderItem in ssWired.Bookmarks.Children
		  'if (path.IsVisible) AND (path.Name.Left(1) <> ".") AND (path.Name.IndexOf(".ssWiredBookmark") > -1) then
		  'DIM bookmark As URLComponents = self.LoadBookmark(path)
		  '
		  'me.AddRow bookmark.User + " @ " + bookmark.Host + if(bookmark.Port = 2000, "", ":" + bookmark.Port.ToText)
		  'me.RowTag(me.LastIndex) = bookmark
		  'end if
		  'next
		  'end if
		  'end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ConnectButton
	#tag Event
		Sub Action()
		  self.Connect
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Progress
	#tag Event
		Sub Open()
		  ' me.Top = (self.ConnectButton.Top + 2)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
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
