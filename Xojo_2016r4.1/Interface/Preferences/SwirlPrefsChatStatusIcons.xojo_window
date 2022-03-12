#tag Window
Begin ContainerControl SwirlPrefsChatStatusIcons
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
   Begin PushButton Apply
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
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
      Underline       =   False
      Visible         =   True
      Width           =   610
   End
   Begin Listbox StatusIconsList
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
      TabIndex        =   23
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
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub ListStatusIconSets()
		  self.StatusIconsList.DeleteAllRows
		  
		  self.StatusIconsList.AddRow ""
		  self.StatusIconsList.Cell(self.StatusIconsList.LastIndex, 5) = Strings.kNone
		  self.StatusIconsList.RowTag(self.StatusIconsList.LastIndex) = Nil
		  
		  if (Paths.StatusIcons <>Nil) AND (Paths.StatusIcons.Exists) then
		    for each file As Xojo.IO.FolderItem in Paths.StatusIcons.Children()
		      if (file.IsVisible) AND (file.Name <> ".DS_Store") AND (file.Name.IndexOf(".AdiumStatusIcons") > -1) then
		        self.StatusIconsList.AddRow " "
		        self.StatusIconsList.Cell(self.StatusIconsList.LastIndex, 5) = file.DisplayName.Replace(".AdiumStatusIcons", "").ReplaceAll("&", "&&")
		        self.StatusIconsList.RowTag(self.StatusIconsList.LastIndex) = NEW AdiumStatusIcons(file)
		        
		        if (AdiumStatusIcons(self.StatusIconsList.RowTag(self.StatusIconsList.LastIndex)).Path.Path = Prefs.StatusIconSet.Path.Path) then
		          self.StatusIconsList.ListIndex = self.StatusIconsList.LastIndex
		        end if
		      end if
		    next
		  end if
		  
		  if (self.StatusIconsList.ListIndex = -1) then
		    self.StatusIconsList.ListIndex = 0
		  end if
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events Apply
	#tag Event
		Sub Action()
		  if (self.StatusIconsList.ListIndex > -1) then
		    Prefs.StatusIconSet = self.StatusIconsList.RowTag(self.StatusIconsList.ListIndex)
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events StatusIconsList
	#tag Event
		Sub Open()
		  self.ListStatusIconSets
		End Sub
	#tag EndEvent
	#tag Event
		Sub Change()
		  'if (me.ListIndex > -1) then
		  'self.MessageStylePreview.MessageStylePath = me.RowTag(me.ListIndex)
		  'end if
		End Sub
	#tag EndEvent
	#tag Event
		Function CellBackgroundPaint(g As Graphics, row As Integer, column As Integer) As Boolean
		  ' #pragma DisableBackgroundTasks
		  
		  if (row < me.ListCount) then
		    DIM set As AdiumStatusIcons = me.RowTag(row)
		    
		    if (set <> Nil) then
		      DIM icon As Picture
		      
		      select case column
		      case 0  // available
		        icon = set.Available
		      case 1  // away
		        icon = set.Away
		      case 2  // content
		        icon = set.Content
		      case 3  // idle
		        icon = set.Idle
		      case 4  // offline
		        icon = set.Offline
		      end select
		      
		      if (icon <> Nil) then
		        g.DrawPicture icon, 4, 4, 16, 16, 0, 0, icon.Width, icon.Height
		      end if
		    end if
		  end if
		  
		  Return (column <> 5)
		End Function
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
