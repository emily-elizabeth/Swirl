#tag Class
Protected Class VibrancyCanvas
Inherits DesktopCanvas
	#tag Event
		Sub Closing()
		  #if TargetMacOS
		    Declare Sub Release Lib "Foundation" Selector "release" (id As Ptr)
		    Release(oHandle)
		  #endif
		End Sub
	#tag EndEvent

	#tag Event
		Sub Opening()
		  #if TargetMacOS
		    Declare Function GetFrame Lib "AppKit" Selector "frame" (id As Ptr) As NSRect
		    Declare Function InitWithFrame Lib "AppKit" Selector "initWithFrame:" (id As Ptr, frame As NSRect) As Ptr
		    Declare Function Alloc Lib "Foundation" Selector "alloc" (id As Ptr) As Ptr
		    Declare Function NSClassFromString Lib "Foundation" (className As CFStringRef) As Ptr
		    Declare Sub SetAutoresizingMask Lib "AppKit" Selector "setAutoresizingMask:" (id As Ptr, value As UInteger)
		    Declare Function GetSuperview Lib "AppKit" Selector "superview" (id As Ptr) As Ptr
		    Declare Sub AddSubviewPositionedRelativeTo Lib "AppKit" Selector "addSubview:positioned:relativeTo:" (id As Ptr, aView As Ptr, place As Int8, otherView As Ptr)
		    
		    Var oFrame As NSRect = GetFrame(Self.Handle)
		    oHandle = InitWithFrame(Alloc(NSClassFromString("NSVisualEffectView")), oFrame)
		    SetAutoresizingMask(oHandle, 18)
		    
		    Var oSuperview As Ptr = GetSuperview(Self.Handle)
		    AddSubviewPositionedRelativeTo(oSuperview, oHandle, -1, Self.Handle)
		  #endif
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h21
		Private oHandle As Ptr
	#tag EndProperty


	#tag Structure, Name = NSPoint, Flags = &h0
		x as CGFloat
		y as CGFloat
	#tag EndStructure

	#tag Structure, Name = NSRect, Flags = &h0
		Origin as NSPoint
		Size_ as NSSize
	#tag EndStructure

	#tag Structure, Name = NSSize, Flags = &h0
		width as CGFloat
		height as CGFloat
	#tag EndStructure


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="Integer"
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
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			InitialValue="False"
			Type="Boolean"
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
			Name="AllowAutoDeactivate"
			Visible=true
			Group="Appearance"
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
			InitialValue="False"
			Type="Boolean"
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
	#tag EndViewBehavior
End Class
#tag EndClass
