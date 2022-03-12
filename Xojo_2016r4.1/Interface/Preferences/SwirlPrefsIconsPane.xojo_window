#tag Window
Begin ContainerControl SwirlPrefsIconsPane
   AcceptFocus     =   False
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   Compatibility   =   ""
   Enabled         =   True
   EraseBackground =   True
   HasBackColor    =   False
   Height          =   368
   HelpTag         =   ""
   InitialParent   =   ""
   Left            =   0
   LockBottom      =   False
   LockLeft        =   False
   LockRight       =   False
   LockTop         =   False
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   True
   Top             =   0
   Transparent     =   True
   UseFocusRing    =   False
   Visible         =   True
   Width           =   650
   Begin Listbox Icons
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   False
      ColumnCount     =   16
      ColumnsResizable=   False
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   40
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   False
      HeadingIndex    =   -1
      Height          =   316
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   2
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   24
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   0
      Underline       =   False
      UseFocusRing    =   False
      Visible         =   True
      Width           =   650
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin PushButton IconAdd
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "+"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   2
      TabIndex        =   25
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   328
      Underline       =   False
      Visible         =   True
      Width           =   27
   End
   Begin PushButton IconRemove
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "-"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   59
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   2
      TabIndex        =   26
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   328
      Underline       =   False
      Visible         =   True
      Width           =   27
   End
   Begin PushButton IconsRefresh
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "#Strings.kRefresh"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   98
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   2
      TabIndex        =   27
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   328
      Underline       =   False
      Visible         =   True
      Width           =   91
   End
   Begin PushButton IconPasteFromClipboard
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "#Strings.kPasteFromClipboard"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   262
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   2
      TabIndex        =   28
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   328
      Underline       =   False
      Visible         =   True
      Width           =   368
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  self.DisplayIcons
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub DisplayIcons()
		  self.Icons.DeleteAllRows
		  
		  DIM icons() As Pair
		  
		  for each item As xojo.IO.FolderItem in Paths.Icons.Children
		    if (item <> Nil) AND (item.Exists) AND (not item.IsFolder) AND (item.Name.Left(1) <> ".") then
		      DIM classicFile As NEW FolderItem(item.Path, FolderItem.PathTypeNative)
		      DIM icon As Picture = Picture.Open(classicFile)
		      if (icon <> Nil) then
		        icons.Append NEW Pair(icon, item)
		      end if
		    end if
		  next
		  
		  DIM row As Integer = 0
		  for i as Integer = 0 to icons.Ubound
		    for column As Integer = 0 to 15
		      if (column = 0) then self.Icons.AddRow ""
		      if (i <= icons.Ubound) then
		        self.Icons.CellTag(row, column) = icons(i)
		        DIM moo1 As Text = Xojo.IO.FolderItem(icons(i).Right).Path
		        DIM moo2 As Text = Prefs.UserIconPath.Path
		        if (moo1 = moo2) then self.Icons.RowTag(0) = NEW Pair(row, i)
		        i = i + 1
		      else
		        exit for i
		      end if
		    next
		    row = row + 1
		  next
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events Icons
	#tag Event
		Function CellClick(row as Integer, column as Integer, x as Integer, y as Integer) As Boolean
		  #Pragma Unused x
		  #Pragma Unused y
		  
		  try
		    if (me.CellTag(row, column) <> Nil) then
		      me.RowTag(0) = NEW Pair(row, column)
		      me.Invalidate
		      Prefs.UserIconPath = Pair(me.CellTag(row, column)).Right
		    end if
		  catch err
		    // ignore
		  end try
		  
		  Return TRUE
		End Function
	#tag EndEvent
	#tag Event
		Function CellTextPaint(g As Graphics, row As Integer, column As Integer, x as Integer, y as Integer) As Boolean
		  if (row < me.ListCount) then
		    if (me.CellTag(row, column) <> Nil) then
		      DIM tag As Pair = me.CellTag(row, column)
		      DIM image As Picture = tag.Left
		      
		      if (me.RowTag(0) <> Nil) then
		        DIM selectedRow As Integer = Pair(me.RowTag(0)).Left
		        DIM selectedColumn As Integer = Pair(me.RowTag(0)).Right
		        
		        if ((row = selectedRow) AND (column = selectedColumn)) then // OR (imagePath.Path = Prefs.UserIconPath.Path) then
		          g.ForeColor = HighlightColor
		          g.FillRoundRect 0, 0, 40, 40, 10, 10
		        end if
		      end if
		      
		      g.DrawPicture image, 4, 4, if(image.Width < 32, image.Width, 32), if(image.Height < 32, image.Height, 32), 0, 0, image.Width, image.Height
		    end if
		  end if
		  
		  Return FALSE
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events IconAdd
	#tag Event
		Sub Action()
		  Dim jpegType As New FileType
		  jpegType.Name = "image/jpeg"
		  jpegType.MacType = "JPEG"
		  jpegType.Extensions = "jpg;jpeg"
		  
		  Dim pngType As New FileType
		  pngType.Name = "image/png"
		  pngType.MacType = "PNG "
		  pngType.Extensions = "png"
		  
		  Dim f As FolderItem
		  
		  //The actual FileTypes are converted to strings automatically for use
		  //with GetOpenFolderItem
		  f = GetOpenFolderItem( jpegType + pngType )
		  if (f <>Nil) AND (f.Exists) then
		    DIM fNewPath As xojo.IO.FolderItem = NEW xojo.IO.FolderItem(f.NativePath.ToText)
		    fNewPath.CopyTo Paths.Icons
		    self.DisplayIcons
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events IconRemove
	#tag Event
		Sub Action()
		  DIM selectedRow As Integer = Pair(self.Icons.RowTag(0)).Left
		  DIM selectedColumn As Integer = Pair(self.Icons.RowTag(0)).Right
		  
		  if (selectedRow > -1) AND (selectedColumn > -1) then
		    DIM cellPair As Pair = self.Icons.CellTag(selectedRow, selectedColumn)
		    DIM iconPath As xojo.IO.FolderItem = cellPair.Right
		    IconPath.Delete
		    self.Icons.RowTag(0) = NEW Pair(-1, -1)
		    Prefs.UserIconPath = Nil
		    self.DisplayIcons
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events IconsRefresh
	#tag Event
		Sub Action()
		  self.DisplayIcons
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events IconPasteFromClipboard
	#tag Event
		Sub Action()
		  DIM clip As NEW Clipboard
		  
		  if (clip.PictureAvailable) then
		    DIM icon As Picture
		    'if (clip.Picture.Width > 128) OR (clip.Picture.Height > 128) then
		    'icon = NEW Picture(128, 128)
		    'icon.Graphics.DrawPicture clip.Picture, 0, 0, 128, 128, 0, clip.Picture.Width, clip.Picture.Height
		    'else
		    icon = clip.Picture
		    'end if
		    
		    DIM fileName As Text = Microseconds.ToText + ".png"
		    DIM classicPath As FolderItem = NEW FolderItem(Paths.Icons.Child(fileName).Path, FolderItem.PathTypeNative)
		    icon.save classicPath, Picture.SaveAsPNG
		    
		    self.DisplayIcons
		  end if
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
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Position"
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
		Group="Position"
		InitialValue="300"
		Type="Integer"
	#tag EndViewProperty
#tag EndViewBehavior
