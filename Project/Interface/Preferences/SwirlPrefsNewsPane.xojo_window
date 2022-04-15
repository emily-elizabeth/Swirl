#tag DesktopWindow
Begin DesktopContainer SwirlPrefsNewsPane
   AllowAutoDeactivate=   True
   AllowFocus      =   False
   AllowFocusRing  =   False
   AllowTabs       =   True
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF00
   Composited      =   False
   Enabled         =   True
   HasBackgroundColor=   False
   Height          =   392
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
   Begin UINewsViewer Preview
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   340
      Index           =   -2147483648
      InitialParent   =   ""
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
      Tooltip         =   ""
      Top             =   0
      Visible         =   True
      Width           =   400
   End
   Begin DesktopButton StyleApply
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "#Strings.kApplyNewsStyle"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   262
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   2
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   352
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   368
   End
   Begin DesktopListBox Styles
      AllowAutoDeactivate=   True
      AllowAutoHideScrollbars=   True
      AllowExpandableRows=   False
      AllowFocusRing  =   False
      AllowResizableColumns=   False
      AllowRowDragging=   False
      AllowRowReordering=   False
      Bold            =   False
      ColumnCount     =   1
      ColumnWidths    =   ""
      DefaultRowHeight=   -1
      DropIndicatorVisible=   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      GridLineStyle   =   0
      HasBorder       =   True
      HasHeader       =   False
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   True
      HeadingIndex    =   -1
      Height          =   340
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
      RowSelectionType=   0
      Scope           =   2
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   0
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   250
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin DesktopButton NewsStyleAdd
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "+"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   2
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   352
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   27
   End
   Begin DesktopButton NewsStyleRemove
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "-"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   59
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   2
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   352
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   27
   End
   Begin DesktopButton NewsStylesRefresh
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "#Strings.kRefresh"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   98
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   2
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   352
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   91
   End
End
#tag EndDesktopWindow

#tag WindowCode
	#tag Method, Flags = &h21
		Private Sub AddStyle(style As FolderItem)
		  if (style.Name.IndexOf(".viennastyle") > -1) then  // it contains the string
		    style.CopyTo Paths.NewsStyles
		    self.ListStyles
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ListStyles()
		  self.Styles.RemoveAllRows
		  
		  DIM styles As FolderItem = Paths.NewsStyles
		  for each style As FolderItem in styles.Children()
		    if (style.IsFolder) AND (style.Name.Right(12) = ".viennastyle") AND (style.Name.Left(1) <> ".") then
		      self.Styles.AddRow style.DisplayName.Replace(".viennastyle", "")
		      self.Styles.RowTagAt(self.Styles.LastAddedRowIndex) = style
		    end if
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RemoveStyle(row As Integer)
		  // we have a row selected
		  if (row <> -1) then
		    // check if the row is a variant row and then get the parent style row
		    DIM style As FolderItem = self.Styles.RowTagAt(row)
		    DIM result As Integer
		    result = App.RemoveEntireFolder(style, True)
		    App.EnsureDefaultTheme
		    self.ListStyles
		    self.Styles.SelectedRowIndex = 0
		  end if
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events Preview
	#tag Event
		Sub Opening()
		  me.Style = Prefs.NewsStylePath
		  
		  me.AppendArticle Prefs.UserNick, DateTime.Now, "Hello darkness my old friend."
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events StyleApply
	#tag Event
		Sub Pressed()
		  Prefs.NewsStylePath = self.Preview.Style
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Styles
	#tag Event
		Sub Opening()
		  'me.DeleteAllRows
		  '
		  'DIM styles As FolderItem = Paths.NewsStyles
		  'for each style As FolderItem in styles.Children()
		  'if (style.IsFolder) AND (style.Name.Right(12) = ".viennastyle") AND (style.Name.Left(1) <> ".") then
		  'me.AddRow style.DisplayName.Replace(".viennastyle", "")
		  'me.RowTag(me.ListCount - 1) = style
		  'end if
		  'next
		  
		  self.ListStyles
		End Sub
	#tag EndEvent
	#tag Event
		Sub SelectionChanged()
		  if (me.SelectedRowIndex > -1) then
		    self.Preview.Style = me.RowTagAt(me.SelectedRowIndex)
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events NewsStyleAdd
	#tag Event
		Sub Pressed()
		  DIM style As FolderItem = SelectFolder()
		  if (style <> Nil) AND (style.Name.Right(12) = ".viennastyle") then  // a folder was selected
		    DIM newFile As NEW FolderItem(style.NativePath)
		    self.AddStyle newFile
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events NewsStyleRemove
	#tag Event
		Sub Pressed()
		  'if (self.Styles.ListIndex > -1) then
		  'self.RemoveStyle self.Styles.ListIndex
		  'end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events NewsStylesRefresh
	#tag Event
		Sub Pressed()
		  self.ListStyles
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
		Group="Background"
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
		Group="Size"
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
		Group="Size"
		InitialValue="300"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
