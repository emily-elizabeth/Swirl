#tag DesktopWindow
Begin DesktopContainer SwirlPrefsIconsPane
   AllowAutoDeactivate=   True
   AllowFocus      =   False
   AllowFocusRing  =   False
   AllowTabs       =   True
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF00
   Composited      =   False
   Enabled         =   True
   HasBackgroundColor=   False
   Height          =   368
   Index           =   -2147483648
   InitialParent   =   ""
   Left            =   0
   LockBottom      =   False
   LockLeft        =   False
   LockRight       =   False
   LockTop         =   False
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   True
   Tooltip         =   ""
   Top             =   0
   Transparent     =   True
   Visible         =   True
   Width           =   650
   Begin DesktopListBox Icons
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   False
      ColumnCount     =   16
      ColumnsResizable=   False
      ColumnWidths    =   ""
      DefaultRowHeight=   40
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLineStyle   =   0
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
      ShowDropIndicator=   False
      TabIndex        =   24
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   0
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   False
      Visible         =   True
      Width           =   650
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin DesktopButton IconAdd
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "+"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   -78
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
      Top             =   398
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   27
   End
   Begin DesktopButton IconRemove
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "-"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   -39
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
      Top             =   398
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   27
   End
   Begin DesktopButton IconsRefresh
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "#Strings.kRefresh"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   116
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
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   91
   End
   Begin DesktopButton IconPasteFromClipboard
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "📋"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   "Paste from Clipboard"
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   74
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
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   30
   End
   BeginSegmented SegmentedControl SegmentedControl1
      Enabled         =   True
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   12
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      MacControlStyle =   0
      Scope           =   2
      Segments        =   "+\n\nFalse\r-\n\nFalse"
      SelectionType   =   2
      TabIndex        =   29
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   327
      Transparent     =   False
      Visible         =   True
      Width           =   50
   End
End
#tag EndDesktopWindow

#tag WindowCode
	#tag Event
		Sub Opening()
		  self.DisplayIcons
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub DisplayIcons()
		  self.Icons.RemoveAllRows
		  
		  DIM icons() As Pair
		  
		  for each item As FolderItem in Paths.Icons.Children
		    if (item <> Nil) AND (item.Exists) AND (not item.IsFolder) AND (item.Name.Left(1) <> ".") then
		      'DIM classicFile As NEW FolderItem(item.NativePath, FolderItem.PathTypeNative)
		      DIM icon As Picture = Picture.Open(item)
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
		        self.Icons.CellTagAt(row, column) = icons(i)
		        DIM moo1 As String = FolderItem(icons(i).Right).NativePath
		        DIM moo2 As String = Prefs.UserIconPath.NativePath
		        if (moo1 = moo2) then self.Icons.RowTagAt(0) = NEW Pair(row, i)
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
		Function CellPressed(row As Integer, column As Integer, x As Integer, y As Integer) As Boolean
		  #Pragma Unused x
		  #Pragma Unused y
		  
		  try
		    if (me.CellTagAt(row, column) <> Nil) then
		      me.RowTagAt(0) = NEW Pair(row, column)
		      me.Refresh
		      Prefs.UserIconPath = Pair(me.CellTagAt(row, column)).Right
		    end if
		  catch err
		    // ignore
		  end try
		  
		  Return TRUE
		End Function
	#tag EndEvent
	#tag Event
		Function PaintCellText(g as Graphics, row as Integer, column as Integer, x as Integer, y as Integer) As Boolean
		  #Pragma Unused x
		  #Pragma Unused y
		  
		  if (row < me.RowCount) then
		    if (me.CellTagAt(row, column) <> Nil) then
		      DIM tag As Pair = me.CellTagAt(row, column)
		      DIM image As Picture = tag.Left
		      
		      if (me.RowTagAt(0) <> Nil) then
		        DIM selectedRow As Integer = Pair(me.RowTagAt(0)).Left
		        DIM selectedColumn As Integer = Pair(me.RowTagAt(0)).Right
		        
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
		Sub Pressed()
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
		    DIM fNewPath As FolderItem = NEW FolderItem(f.NativePath)
		    fNewPath.CopyTo Paths.Icons
		    self.DisplayIcons
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events IconRemove
	#tag Event
		Sub Pressed()
		  DIM selectedRow As Integer = Pair(self.Icons.RowTagAt(0)).Left
		  DIM selectedColumn As Integer = Pair(self.Icons.RowTagAt(0)).Right
		  
		  if (selectedRow > -1) AND (selectedColumn > -1) then
		    DIM cellPair As Pair = self.Icons.CellTagAt(selectedRow, selectedColumn)
		    DIM iconPath As FolderItem = cellPair.Right
		    IconPath.Delete
		    self.Icons.RowTagAt(0) = NEW Pair(-1, -1)
		    Prefs.UserIconPath = Nil
		    self.DisplayIcons
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events IconsRefresh
	#tag Event
		Sub Pressed()
		  self.DisplayIcons
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events IconPasteFromClipboard
	#tag Event
		Sub Pressed()
		  DIM clip As NEW Clipboard
		  
		  if (clip.PictureAvailable) then
		    DIM icon As Picture
		    'if (clip.Picture.Width > 128) OR (clip.Picture.Height > 128) then
		    'icon = NEW Picture(128, 128)
		    'icon.Graphics.DrawPicture clip.Picture, 0, 0, 128, 128, 0, clip.Picture.Width, clip.Picture.Height
		    'else
		    icon = clip.Picture
		    'end if
		    
		    DIM fileName As String = Microseconds.ToString + ".png"
		    DIM classicPath As FolderItem = NEW FolderItem(Paths.Icons.Child(fileName).NativePath, FolderItem.PathTypeNative)
		    icon.save classicPath, Picture.SaveAsPNG
		    
		    self.DisplayIcons
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SegmentedControl1
	#tag Event
		Sub Action(itemIndex as integer)
		  select case itemIndex
		  case 0 // add
		    DIM jpegType As NEW FileType
		    jpegType.Name = "image/jpeg"
		    jpegType.MacType = "JPEG"
		    jpegType.Extensions = "jpg;jpeg"
		    
		    DIM pngType As NEW FileType
		    pngType.Name = "image/png"
		    pngType.MacType = "PNG "
		    pngType.Extensions = "png"
		    
		    DIM f As FolderItem
		    
		    //The actual FileTypes are converted to strings automatically for use
		    //with GetOpenFolderItem
		    f = GetOpenFolderItem( jpegType + pngType )
		    if (f <>Nil) AND (f.Exists) then
		      DIM fNewPath As FolderItem = NEW FolderItem(f.NativePath)
		      fNewPath.CopyTo Paths.Icons
		      self.DisplayIcons
		    end if
		    
		  case 1 // remove
		    DIM selectedRow As Integer = Pair(self.Icons.RowTagAt(0)).Left
		    DIM selectedColumn As Integer = Pair(self.Icons.RowTagAt(0)).Right
		    
		    if (selectedRow > -1) AND (selectedColumn > -1) then
		      DIM cellPair As Pair = self.Icons.CellTagAt(selectedRow, selectedColumn)
		      DIM iconPath As FolderItem = cellPair.Right
		      IconPath.Delete
		      self.Icons.RowTagAt(0) = NEW Pair(-1, -1)
		      Prefs.UserIconPath = Nil
		      self.DisplayIcons
		    end if
		  end select
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
		Group="Appearance"
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
		Group="Position"
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
		Group="Position"
		InitialValue="300"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
