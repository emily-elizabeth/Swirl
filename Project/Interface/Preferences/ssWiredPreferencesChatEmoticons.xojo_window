#tag DesktopWindow
Begin DesktopContainer ssWiredPreferencesChatEmoticons
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
   Begin DesktopListBox EmoticonList
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
      Height          =   368
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
      TabIndex        =   23
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
      Width           =   250
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin DesktopListBox EmoticonPreview
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
      Height          =   368
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   251
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
      Width           =   399
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
End
#tag EndDesktopWindow

#tag WindowCode
	#tag Method, Flags = &h21
		Private Sub DisplayEmoticons(emoticonSet As FolderItem)
		  'self.EmoticonPreview.DeleteAllRows
		  'self.EmoticonPreview.DefaultRowHeight = 1
		  '
		  'DIM images() As Picture
		  '
		  'for each item As FolderItem in emoticonSet.Children
		  'if (item <> Nil) AND (item.Exists) AND (not item.IsFolder) AND (item.Name.Left(1) <> ".") AND (item.Name.IndexOf("@") = -1) then
		  'try
		  '#Pragma BreakOnExceptions FALSE
		  'DIM classicFile As NEW FolderItem(item.NativePath, FolderItem.PathTypeNative)
		  'DIM image As Picture = Picture.Open(classicFile)
		  '#Pragma BreakOnExceptions Default
		  '
		  'if (image <>Nil) then
		  'if (self.EmoticonPreview.DefaultRowHeight < image.Height + 8) then
		  'self.EmoticonPreview.DefaultRowHeight = image.Height + 8
		  'end if
		  '
		  'if (self.EmoticonPreview.ColumnCount <> Floor(self.EmoticonPreview.Width / (image.Width + 8))) then
		  'self.EmoticonPreview.ColumnCount = Floor(self.EmoticonPreview.Width / (image.Width + 8))
		  'end if
		  '
		  'images.Append image
		  'end if
		  'catch err
		  '// wasn't an image file, so just move on
		  'end try
		  'end if
		  'next
		  '
		  'if (images.Ubound > -1) then
		  'DIM i As Integer = 0
		  'for row as Integer = 0 to images.Ubound Step self.EmoticonPreview.ColumnCount
		  'self.EmoticonPreview.AddRow ""
		  'for column as Integer = 0 to self.EmoticonPreview.ColumnCount
		  'if (i < images.Ubound) then
		  'self.EmoticonPreview.CellTag(row\self.EmoticonPreview.ColumnCount, column) = images(i)
		  'i = i + 1
		  'else
		  'Exit for row
		  'end if
		  'next
		  'next
		  'end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ListEmoticons(lb As DesktopListBox)
		  'lb.DeleteAllRows
		  '
		  'if (Paths.Emoticons <> Nil) AND (Paths.Emoticons.Exists) then
		  'for each file As FolderItem in Paths.Emoticons.Children()
		  'if (file.Visible) AND (file.Name.Left(1) <> ".") AND (file.Name.IndexOf(".AdiumEmoticonset") > -1) then
		  'lb.AddRow file.DisplayName.Replace(".AdiumEmoticonset", "")
		  'lb.RowTag(lb.LastIndex) = file
		  'end if
		  'next
		  'end if
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events EmoticonList
	#tag Event
		Sub Opening()
		  self.ListEmoticons me
		End Sub
	#tag EndEvent
	#tag Event
		Sub SelectionChanged()
		  'if (me.ListIndex <> -1) then
		  'self.DisplayEmoticons me.RowTag(me.ListIndex)
		  'end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events EmoticonPreview
	#tag Event
		Function PaintCellBackground(g As Graphics, row As Integer, column As Integer) As Boolean
		  'if (row < me.ListCount) then
		  'if (me.CellTag(row, column) <> Nil) then
		  'DIM image As Picture = me.CellTag(row, column)
		  'g.DrawPicture image, 4, 4, image.Width, image.Height, 0, 0, image.Width, image.Height
		  'end if
		  'end if
		  '
		  'Return FALSE
		End Function
	#tag EndEvent
	#tag Event
		Function CellPressed(row As Integer, column As Integer, x As Integer, y As Integer) As Boolean
		  #Pragma Unused row
		  #Pragma Unused column
		  #Pragma Unused x
		  #Pragma Unused y
		  
		  Return TRUE
		End Function
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
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
		Type="Color"
		EditorType="Color"
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
		Name="DoubleBuffer"
		Visible=true
		Group="Windows Behavior"
		InitialValue="False"
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
		Name="EraseBackground"
		Visible=true
		Group="Behavior"
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
