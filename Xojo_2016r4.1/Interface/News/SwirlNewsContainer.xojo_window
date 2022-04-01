#tag Window
Begin ContainerControl SwirlNewsContainer
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
   Height          =   502
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
   Transparent     =   True
   UseFocusRing    =   False
   Visible         =   True
   Width           =   656
   Begin UINewsViewer Viewer
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   450
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
      Top             =   52
      Visible         =   True
      Width           =   656
   End
   Begin Rectangle Rectangle1
      AutoDeactivate  =   True
      BorderWidth     =   0
      BottomRightColor=   &c00000000
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
      TopLeftColor    =   &c00000000
      Transparent     =   True
      Visible         =   False
      Width           =   656
      Begin TextArea NewPost
         AcceptTabs      =   False
         Alignment       =   0
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   True
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         DataField       =   ""
         DataSource      =   ""
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
         UseFocusRing    =   True
         Visible         =   True
         Width           =   616
      End
      Begin PushButton Post
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
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
      Begin PushButton Cancel
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
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
   Begin PushButton Reload
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
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
   Begin PushButton PostNews
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
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
   Begin PushButton Clear
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
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
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Close()
		  ObjObserver.Unlisten self, Events.kWiredConnectionNewsListEntry
		  ObjObserver.Unlisten self, Events.kWiredConnectionNewsPosted
		  ObjObserver.Unlisten self, Events.kWiredConnectionPrivilegesReceived
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
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
		Private Sub WiredConnectionNewsListEntry(connection As WiredConnection, nick As Text, time As Xojo.Core.Date, message As Text)
		  if (connection = self.mConnection) then
		    self.Viewer.AppendArticle nick, time, message
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WiredConnectionNewsPosted(connection As WiredConnection, nick As Text, time As Xojo.Core.Date, message As Text)
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
		Sub Open()
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
		Sub Action()
		  self.mConnection.PostNews self.NewPost.Text.ToText
		  self.HideNewPost
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Cancel
	#tag Event
		Sub Action()
		  self.HideNewPost
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Reload
	#tag Event
		Sub Action()
		  self.Viewer.Clear
		  self.mConnection.RequestNews
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PostNews
	#tag Event
		Sub Action()
		  self.ShowNewPost
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Clear
	#tag Event
		Sub Action()
		  DIM dialog As NEW MessageDialog
		  dialog.Icon = MessageDialog.GraphicCaution
		  dialog.Message = Strings.kAreYouSureYouWantToClearTheNews
		  dialog.Explanation = Strings.kThisCannotBeUndone
		  dialog.ActionButton.Caption = Strings.kOK
		  dialog.CancelButton.Caption = Strings.kCancel
		  dialog.CancelButton.Visible = TRUE
		  
		  DIM result As MessageDialogButton = dialog.ShowModalWithin(self)
		  
		  if (result = dialog.ActionButton) then
		    self.mConnection.ClearNews
		  end if
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
