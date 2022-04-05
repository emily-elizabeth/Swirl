#tag DesktopWindow
Begin DesktopContainer SwirlPrefsChatStatusIcons
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
   Begin DesktopButton Apply
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "#Strings.kApplyStatusIconSet"
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
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   328
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   610
   End
   Begin DesktopListBox StatusIconsList
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   False
      ColumnCount     =   6
      ColumnsResizable=   False
      ColumnWidths    =   "24,24,24,24,24,*"
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   24
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   1
      GridLinesVertical=   1
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
      RequiresSelection=   True
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
      Width           =   650
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
End
#tag EndDesktopWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub ListStatusIconSets()
		  'self.StatusIconsList.DeleteAllRows
		  '
		  'self.StatusIconsList.AddRow ""
		  'self.StatusIconsList.Cell(self.StatusIconsList.LastIndex, 5) = Strings.kNone
		  'self.StatusIconsList.RowTag(self.StatusIconsList.LastIndex) = Nil
		  '
		  'if (Paths.StatusIcons <>Nil) AND (Paths.StatusIcons.Exists) then
		  'for each file As FolderItem in Paths.StatusIcons.Children()
		  'if (file.Visible) AND (file.Name <> ".DS_Store") AND (file.Name.IndexOf(".AdiumStatusIcons") > -1) then
		  'self.StatusIconsList.AddRow " "
		  'self.StatusIconsList.Cell(self.StatusIconsList.LastIndex, 5) = file.DisplayName.Replace(".AdiumStatusIcons", "").ReplaceAll("&", "&&")
		  'self.StatusIconsList.RowTag(self.StatusIconsList.LastIndex) = NEW AdiumStatusIcons(file)
		  '
		  'if (AdiumStatusIcons(self.StatusIconsList.RowTag(self.StatusIconsList.LastIndex)).Path.NativePath = Prefs.StatusIconSet.Path.NativePath) then
		  'self.StatusIconsList.ListIndex = self.StatusIconsList.LastIndex
		  'end if
		  'end if
		  'next
		  'end if
		  '
		  'if (self.StatusIconsList.ListIndex = -1) then
		  'self.StatusIconsList.ListIndex = 0
		  'end if
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events Apply
	#tag Event
		Sub Pressed()
		  'if (self.StatusIconsList.ListIndex > -1) then
		  'Prefs.StatusIconSet = self.StatusIconsList.RowTag(self.StatusIconsList.ListIndex)
		  'end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events StatusIconsList
	#tag Event
		Sub Opening()
		  self.ListStatusIconSets
		End Sub
	#tag EndEvent
	#tag Event
		Sub SelectionChanged()
		  'if (me.ListIndex > -1) then
		  'self.MessageStylePreview.MessageStylePath = me.RowTag(me.ListIndex)
		  'end if
		End Sub
	#tag EndEvent
	#tag Event
		Function PaintCellBackground(g As Graphics, row As Integer, column As Integer) As Boolean
		  '' #pragma DisableBackgroundTasks
		  '
		  'if (row < me.ListCount) then
		  'DIM set As AdiumStatusIcons = me.RowTag(row)
		  '
		  'if (set <> Nil) then
		  'DIM icon As Picture
		  '
		  'select case column
		  'case 0  // available
		  'icon = set.Available
		  'case 1  // away
		  'icon = set.Away
		  'case 2  // content
		  'icon = set.Content
		  'case 3  // idle
		  'icon = set.Idle
		  'case 4  // offline
		  'icon = set.Offline
		  'end select
		  '
		  'if (icon <> Nil) then
		  'g.DrawPicture icon, 4, 4, 16, 16, 0, 0, icon.Width, icon.Height
		  'end if
		  'end if
		  'end if
		  '
		  'Return (column <> 5)
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
