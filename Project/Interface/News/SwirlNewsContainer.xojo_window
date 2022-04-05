#tag DesktopWindow
Begin DesktopContainer SwirlNewsContainer
   AllowAutoDeactivate=   True
   AllowFocus      =   False
   AllowFocusRing  =   False
   AllowTabs       =   True
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF00
   Composited      =   False
   Enabled         =   True
   HasBackgroundColor=   False
   Height          =   502
   Index           =   -2147483648
   InitialParent   =   ""
   Left            =   0
   LockBottom      =   True
   LockLeft        =   True
   LockRight       =   True
   LockTop         =   True
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   True
   Tooltip         =   ""
   Top             =   0
   Transparent     =   True
   Visible         =   True
   Width           =   656
   Begin UINewsViewer Viewer
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   450
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
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
      Top             =   52
      Visible         =   True
      Width           =   656
   End
   Begin DesktopRectangle Rectangle1
      AutoDeactivate  =   True
      BorderColor     =   &c000000
      BorderWidth     =   0.0
      CornerSize      =   16.0
      Enabled         =   True
      FillColor       =   &cFFFFFF00
      Height          =   502
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   2
      TabIndex        =   4
      TabPanelIndex   =   0
      Top             =   0
      Transparent     =   True
      Visible         =   False
      Width           =   656
      Begin DesktopTextArea NewPost
         AcceptTabs      =   False
         Alignment       =   0
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   True
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         Enabled         =   True
         Format          =   ""
         Height          =   430
         HelpTag         =   ""
         HideSelection   =   True
         Index           =   -2147483648
         InitialParent   =   "Rectangle1"
         Italic          =   False
         Left            =   20
         LimitText       =   0
         LineHeight      =   0.0
         LineSpacing     =   1.0
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Mask            =   ""
         Multiline       =   True
         ReadOnly        =   False
         Scope           =   2
         ScrollbarHorizontal=   False
         ScrollbarVertical=   True
         Styled          =   True
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   20
         Transparent     =   True
         Underline       =   False
         UnicodeMode     =   0
         UseFocusRing    =   True
         Visible         =   True
         Width           =   616
      End
      Begin DesktopButton Post
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   0
         Cancel          =   False
         Caption         =   "#Strings.kPost"
         Default         =   False
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "Rectangle1"
         Italic          =   False
         Left            =   526
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   False
         Scope           =   2
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   462
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   110
      End
      Begin DesktopButton Cancel
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   0
         Cancel          =   True
         Caption         =   "#Strings.kCancel"
         Default         =   False
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "Rectangle1"
         Italic          =   False
         Left            =   397
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   False
         Scope           =   2
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   462
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   110
      End
   End
   Begin DesktopButton Reload
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "#Strings.kReload"
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
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   16
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   150
   End
   Begin DesktopButton PostNews
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "#Strings.kPostNews"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   182
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   2
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   16
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   150
   End
   Begin DesktopButton Clear
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "#Strings.kClear"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   486
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   2
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   16
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   150
   End
End
#tag EndDesktopWindow

#tag WindowCode
	#tag Event
		Sub Closing()
		  ObjObserver.Unlisten self, Events.kWiredConnectionNewsListEntry
		  ObjObserver.Unlisten self, Events.kWiredConnectionNewsPosted
		  ObjObserver.Unlisten self, Events.kWiredConnectionPrivilegesReceived
		End Sub
	#tag EndEvent

	#tag Event
		Sub Opening()
		  ObjObserver.Listen self, Events.kWiredConnectionNewsListEntry
		  ObjObserver.Listen self, Events.kWiredConnectionNewsPosted
		  ObjObserver.Listen self, Events.kWiredConnectionPrivilegesReceived
		  
		  self.Clear.Enabled = self.mConnection.CanClearNews
		  self.PostNews.Enabled = self.mConnection.CanPostNews
		  
		  if (Prefs.RequestNewsOnLogin) then
		    self.mConnection.RequestNews
		  end if
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function ConnectionPostNews() As Boolean Handles ConnectionPostNews.Action
			self.ShowNewPost
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h0
		Sub Constructor(connection As WiredConnection)
		  self.mConnection = connection
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HideNewPost()
		  self.Viewer.Visible = TRUE
		  self.PostNews.Visible = TRUE
		  self.Clear.Visible = TRUE
		  self.Reload.Visible = TRUE
		  
		  self.Rectangle1.Visible = FALSE
		  self.NewPost.Text = ""
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ShowNewPost()
		  self.Viewer.Visible = FALSE
		  self.PostNews.Visible = FALSE
		  self.Clear.Visible = FALSE
		  self.Reload.Visible = FALSE
		  
		  self.Rectangle1.Visible = TRUE
		  self.NewPost.Text = ""
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WiredConnectionNewsListEntry(connection As WiredConnection, nick As String, time As DateTime, message As String)
		  if (connection = self.mConnection) then
		    self.Viewer.AppendArticle nick, time, message
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WiredConnectionNewsPosted(connection As WiredConnection, nick As String, time As DateTime, message As String)
		  if (connection = self.mConnection) then
		    self.Viewer.PrependArticle nick, time, message
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WiredConnectionPrivilegesReceived(connection As WiredConnection)
		  if (connection = self.mConnection) then
		    self.Clear.Enabled = connection.CanClearNews
		    self.PostNews.Enabled = connection.CanPostNews
		  end if
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mConnection As WiredConnection
	#tag EndProperty


#tag EndWindowCode

#tag Events Viewer
	#tag Event
		Sub Opening()
		  me.Style = Prefs.NewsStylePath
		End Sub
	#tag EndEvent
	#tag Event
		Function CancelLoad(URL As String) As Boolean
		  if (URL.Left(4) ="http") then
		    ShowURL URL
		    Return TRUE
		  else
		    Return FALSE
		  end if
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events Post
	#tag Event
		Sub Pressed()
		  self.mConnection.PostNews self.NewPost.Text
		  self.HideNewPost
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Cancel
	#tag Event
		Sub Pressed()
		  self.HideNewPost
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Reload
	#tag Event
		Sub Pressed()
		  self.Viewer.Clear
		  self.mConnection.RequestNews
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PostNews
	#tag Event
		Sub Pressed()
		  self.ShowNewPost
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Clear
	#tag Event
		Sub Pressed()
		  'DIM dialog As NEW MessageDialog
		  'dialog.Icon = MessageDialog.GraphicCaution
		  'dialog.Message = Strings.kAreYouSureYouWantToClearTheNews
		  'dialog.Explanation = Strings.kThisCannotBeUndone
		  'dialog.ActionButton.Caption = Strings.kOK
		  'dialog.CancelButton.Caption = Strings.kCancel
		  'dialog.CancelButton.Visible = TRUE
		  '
		  'DIM result As MessageDialogButton = dialog.ShowModalWithin(self)
		  '
		  'if (result = dialog.ActionButton) then
		  'self.mConnection.ClearNews
		  'end if
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
