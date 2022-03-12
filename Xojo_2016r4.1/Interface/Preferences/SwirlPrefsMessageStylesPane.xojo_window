#tag Window
Begin ContainerControl SwirlPrefsMessageStylesPane
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
   Begin PushButton StyleApply
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "#Strings.kApplyMessageStyle"
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
      TabIndex        =   10
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
   Begin AdiumMessageViewer MessageStylePreview
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   316
      HelpTag         =   ""
      Index           =   -2147483648
      Left            =   250
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Renderer        =   1
      Scope           =   2
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      Visible         =   True
      Width           =   400
   End
   Begin Listbox Styles
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
      Height          =   316
      HelpTag         =   ""
      Hierarchical    =   True
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
      Width           =   250
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin PushButton MessageStyleAdd
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
      TabIndex        =   24
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
   Begin PushButton MessageStyleRemove
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
   Begin PushButton MessageStylesRefresh
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
      TabIndex        =   26
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
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h21
		Private Sub AddMessageStyle(style As Xojo.IO.FolderItem)
		  if (style.Name.IndexOf(".AdiumMessageStyle") > -1) then  // it contains the string
		    // check if the message style is valid
		    if (style.Child("Contents").Child("Resources").Exists) AND (style.Child("Contents").Child("Info.plist").Exists) then
		      App.CopySourceFolderToDestinationFolder style, Paths.MessageStyles
		      self.ListMessageStyles
		    end if
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ListMessageStyles()
		  self.Styles.DeleteAllRows
		  
		  if (Paths.MessageStyles <>Nil) AND (Paths.MessageStyles.Exists) then
		      DIM children() As Text
		      for each file As Xojo.IO.FolderItem in Paths.MessageStyles.Children()
		          children.Append file.DisplayName
		      next file
		      children.Sort
		      
		      for each ch As Text in children
		          DIM path As Xojo.IO.FolderItem = Paths.MessageStyles.Child(ch)
		          if (path <> Nil) AND (path.Exists) AND (path.IsVisible) AND (path.Name <> ".DS_Store") AND (path.Name.IndexOf(".AdiumMessageStyle") > -1) then
		              if (path.Child("Contents").Child("Resources").Child("Variants").Exists) then
		                  self.Styles.AddFolder path.DisplayName.Replace(".AdiumMessageStyle", "")
		              else
		                  self.Styles.AddRow path.DisplayName.Replace(".AdiumMessageStyle", "")
		              end if
		              self.Styles.RowTag(self.Styles.LastIndex) = path
		          end if
		      next ch
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RemoveMessageStyle(row As Integer)
		  // we have a row selected
		  if (row <> -1) then
		    // check if the row is a variant row and then get the parent style row
		    if (self.Styles.CellTag(row, 0) <> Nil) then
		      row = self.Styles.CellTag(row, 0)
		    end if
		    DIM style As Xojo.IO.FolderItem = self.Styles.RowTag(row)
		    DIM result As Integer
		    result = App.RemoveEntireFolder(style, True)
		    App.EnsureDefaultTheme
		    self.ListMessageStyles
		    self.Styles.ListIndex = 0
		  end if
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events StyleApply
	#tag Event
		Sub Action()
		  Prefs.MessageStylePath = self.MessageStylePreview.MessageStylePath
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events MessageStylePreview
	#tag Event
		Sub Open()
		  me.MessageStylePath = Prefs.MessageStylePath
		  
		  DIM iconPath As FolderItem = NEW FolderItem(Paths.DefaultIcon.Path, FolderItem.PathTypeNative)
		  DIM icon As Picture = Picture.Open(iconPath)
		  
		  me.AppendChat Xojo.Core.Date.Now, 1, Prefs.UserNick, Prefs.UserIcon, "So a priest, rabbi, and a chicken walk in to a bar.", FALSE
		  me.AppendChat Xojo.Core.Date.Now, 2, "Emily", icon, "I'm pretty sure I've heard this one before", TRUE
		  me.AppendChat Xojo.Core.Date.Now, 2, "Emily", icon, "So what happens next?", TRUE
		  me.AppendChat Xojo.Core.Date.Now, 1, Prefs.UserNick, Prefs.UserIcon, "If I remember correctly, they explode outward at the speed of light.", FALSE
		  me.AppendChat Xojo.Core.Date.Now, 1, Prefs.UserNick, Prefs.UserIcon, "But that might be if you cross the streams...", FALSE
		  me.AppendChat Xojo.Core.Date.Now, 2, "Emily", icon, "... thus negating all existence!", TRUE
		  me.AppendChat Xojo.Core.Date.Now, 1, Prefs.UserNick, Prefs.UserIcon, "Exactly! It's a risk one takes whenever one walks in to a bar, especially if one is a chicken.", FALSE
		  me.AppendNotification Xojo.Core.Date.Now, "away", "Emily went away"
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Styles
	#tag Event
		Sub Open()
		  self.ListMessageStyles
		End Sub
	#tag EndEvent
	#tag Event
		Sub ExpandRow(row As Integer)
		  'me.ListMessageStyleVariants(row)
		  
		  DIM path As Xojo.IO.FolderItem = me.RowTag(row)
		  DIM variantPath As Xojo.IO.FolderItem = path.Child("Contents").Child("Resources").Child("Variants")
		  
		  if (variantPath <> Nil) AND (variantPath.Exists) AND (variantPath.IsFolder) then
		      DIM currentrow As Integer = row
		      for each variantStyle As Xojo.IO.FolderItem in variantPath.Children()
		          if (variantStyle.Name <> ".DS_Store") AND (NOT variantStyle.IsFolder) AND (variantStyle.Name.Right(4) = ".css") then
		              currentrow = currentrow + 1
		              me.AddRow variantStyle.DisplayName.Replace(".css", "").ReplaceAll("&", "&&").ReplaceAll("_", " ")
		              me.RowTag(currentrow) = variantStyle  // store the path to the variant
		              me.CellTag(currentrow, 0) = row  // store the row of the parent style
		          end if
		      next
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Sub Change()
		  if (me.ListIndex > -1) then
		    self.MessageStylePreview.MessageStylePath = me.RowTag(me.ListIndex)
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events MessageStyleAdd
	#tag Event
		Sub Action()
		  DIM style As FolderItem = SelectFolder()
		  if (style <> Nil) then  // a folder was selected
		    DIM newFile As NEW xojo.IO.FolderItem(style.NativePath.ToText)
		    self.AddMessageStyle newFile
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events MessageStyleRemove
	#tag Event
		Sub Action()
		  if (self.Styles.ListIndex > -1) then
		    self.RemoveMessageStyle self.Styles.ListIndex
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events MessageStylesRefresh
	#tag Event
		Sub Action()
		  self.ListMessageStyles
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
