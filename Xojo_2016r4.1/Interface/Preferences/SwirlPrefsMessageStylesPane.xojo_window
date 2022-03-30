#tag Window
Begin ContainerControl SwirlPrefsMessageStylesPane
   AcceptFocus     =   False
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   Compatibility   =   ""
   DoubleBuffer    =   False
   Enabled         =   True
   EraseBackground =   True
   HasBackColor    =   False
   Height          =   520
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
      Left            =   395
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   2
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   406
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   235
   End
   Begin UIChatViewer MessageStylePreview
      AutoDeactivate  =   True
      DefaultFontSize =   0
      Enabled         =   True
      Height          =   245
      HelpTag         =   ""
      Index           =   -2147483648
      Left            =   0
      LockBottom      =   True
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
      Width           =   650
   End
   Begin Listbox Styles
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
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
      Height          =   143
      HelpTag         =   ""
      Hierarchical    =   True
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   231
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
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
      Top             =   257
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   399
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
      Left            =   3
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   2
      TabIndex        =   24
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   556
      Transparent     =   True
      Underline       =   False
      Visible         =   False
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
      Left            =   42
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   2
      TabIndex        =   25
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   556
      Transparent     =   True
      Underline       =   False
      Visible         =   False
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
      Left            =   292
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   2
      TabIndex        =   26
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   406
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   91
   End
   BeginSegmented SegmentedControl SegmentedControl1
      Enabled         =   True
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   231
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      MacControlStyle =   0
      Scope           =   0
      Segments        =   "+\n\nFalse\r-\n\nFalse"
      SelectionType   =   2
      TabIndex        =   27
      TabPanelIndex   =   0
      Top             =   406
      Transparent     =   False
      Visible         =   True
      Width           =   49
   End
   Begin TextField ThemeFontSize
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   231
      LimitText       =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   2
      TabIndex        =   28
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   452
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   49
   End
   Begin Label Label1
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
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   29
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "#Strings.kMessageStyle"
      TextAlign       =   2
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   257
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   199
   End
   Begin Label Label2
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
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   30
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "#Strings.kFontSize"
      TextAlign       =   2
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   452
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   199
   End
   Begin Label DefaultFontSize
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
      Left            =   292
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   31
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlign       =   0
      TextColor       =   &c3F3F3F00
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   453
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   338
   End
   Begin Label NotAllThemesSupportCustomFontSizes
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
      Left            =   231
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   32
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "#Strings.kNotAllThemesSupportCustomFontSize"
      TextAlign       =   0
      TextColor       =   &c3F3F3F00
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   480
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   399
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

	#tag Method, Flags = &h21
		Private Sub SetPreviewFontSize(size As Integer)
		  if (size = 0) then
		    self.MessageStylePreview.ExecuteJavaScript "document.body.style.fontSize='" + self.MessageStylePreview.DefaultFontSize.ToText + "px';"
		  else
		    self.MessageStylePreview.ExecuteJavaScript "document.body.style.fontSize='" + size.ToText + "px';"
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
	#tag Event
		Sub MessageStyleChanged()
		  self.DefaultFontSize.Text = Strings.kDefaultFontSize.Replace("%size%", me.DefaultFontSize.ToText)
		  self.SetPreviewFontSize Prefs.MessageStyleFontSize
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
	#tag Event
		Sub DoubleClick()
		  Prefs.MessageStylePath = self.MessageStylePreview.MessageStylePath
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
#tag Events SegmentedControl1
	#tag Event
		Sub Action(itemIndex as integer)
		  select case itemIndex
		  case 0 // add
		    DIM style As FolderItem = SelectFolder()
		    if (style <> Nil) then  // a folder was selected
		      DIM newFile As NEW xojo.IO.FolderItem(style.NativePath.ToText)
		      self.AddMessageStyle newFile
		    end if
		  case 1 // remove
		    if (self.Styles.ListIndex > -1) then
		      self.RemoveMessageStyle self.Styles.ListIndex
		    end if
		  end select
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ThemeFontSize
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  DIM returnValue As Boolean = FALSE
		  
		  select case asc(Key)
		  case 3, 10, 13
		    self.SetPreviewFontSize Val(me.Text)
		    Prefs.MessageStyleFontSize = Val(me.Text)
		  end select
		  
		  Return returnValue
		End Function
	#tag EndEvent
	#tag Event
		Sub TextChange()
		  self.SetPreviewFontSize Val(me.Text)
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  me.Text = Prefs.MessageStyleFontSize.ToText
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="DoubleBuffer"
		Visible=true
		Group="Windows Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
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
