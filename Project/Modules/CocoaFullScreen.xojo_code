#tag Module
Protected Module CocoaFullScreen
	#tag Method, Flags = &h0
		Function IsFullScreen(Extends W As DesktopWindow) As Boolean
		  #if TargetCocoa then
		    try
		      Soft Declare Function GetStyleMask Lib "AppKit" Selector "styleMask" (target As Ptr) As Integer
		      Dim Value As Integer = GetStyleMask(w.handle)
		      return Bitwise.BitAnd(Value,NSFullScreenWindowMask) = NSFullScreenWindowMask
		    catch err As RuntimeException
		      'ignore
		    end try
		  #else
		    #pragma Unused W
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub NSWindowDelegate_AddObserver(Extends w As DesktopWindow, Assigns sharedMethodToBeCalled As Ptr)
		  // Possible notifications: DidEnter, DidExit, WillEnter, WillExit
		  // NSWindow*FullScreenNotification where * is one of the 4 above values
		  
		  // Begin Receiving - w.Handle is the Window handle
		  #if TargetCocoa then
		    try
		      Soft Declare Function CFNotificationCenterGetLocalCenter Lib "CoreFoundation" () As Integer
		      Soft Declare Sub CFNotificationCenterAddObserver Lib "CoreFoundation" (center As Integer, observer As Integer, callback As Ptr, name As CFStringRef, target As Ptr, suspensionBehavior As Integer)
		      CFNotificationCenterAddObserver(CFNotificationCenterGetLocalCenter(), 0, sharedMethodToBeCalled, "NSWindowWillEnterFullScreenNotification", w.handle, 0)
		      CFNotificationCenterAddObserver(CFNotificationCenterGetLocalCenter(), 0, sharedMethodToBeCalled, "NSWindowWillExitFullScreenNotification", w.handle, 0)
		      CFNotificationCenterAddObserver(CFNotificationCenterGetLocalCenter(), 0, sharedMethodToBeCalled, "NSWindowDidEnterFullScreenNotification", w.handle, 0)
		      CFNotificationCenterAddObserver(CFNotificationCenterGetLocalCenter(), 0, sharedMethodToBeCalled, "NSWindowDidExitFullScreenNotification", w.handle, 0)
		    catch err As RuntimeException
		      'ignore
		    end try
		    
		  #else
		    #pragma Unused w
		    #pragma Unused sharedMethodToBeCalled
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub NSWindowDelegate_RemoveObserver(Extends w As DesktopWindow)
		  // Possible notifications: DidEnter, DidExit, WillEnter, WillExit
		  // NSWindow*FullScreenNotification where * is one of the 4 above values
		  
		  // Stop Receiving - w.Handle is the Window handle
		  #if TargetCocoa then
		    try
		      Soft Declare Function CFNotificationCenterGetLocalCenter Lib "CoreFoundation" () As Integer
		      Soft Declare Sub CFNotificationCenterRemoveObserver Lib "CoreFoundation" (center As Integer, observer As Integer, name As CFStringRef, target As Ptr)
		      CFNotificationCenterRemoveObserver(CFNotificationCenterGetLocalCenter(), 0, "NSWindowWillEnterFullScreenNotification", w.handle)
		      CFNotificationCenterRemoveObserver(CFNotificationCenterGetLocalCenter(), 0, "NSWindowWillExitFullScreenNotification", w.handle)
		      CFNotificationCenterRemoveObserver(CFNotificationCenterGetLocalCenter(), 0, "NSWindowDidEnterFullScreenNotification", w.handle)
		      CFNotificationCenterRemoveObserver(CFNotificationCenterGetLocalCenter(), 0, "NSWindowDidExitFullScreenNotification", w.handle)
		    catch err As RuntimeException
		      'ignore
		    end try
		    
		  #else
		    #pragma Unused w
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetCollectionBehavior(Extends w As DesktopWindow, Assigns pval As NSWindowCollectionBehavior)
		  #if TargetCocoa then
		    try
		      Soft Declare Sub setCollectionBehavior Lib "AppKit" Selector "setCollectionBehavior:" (ptrToWindow As Ptr, valNSWindowCollectionBehavior As Integer)
		      setCollectionBehavior(Ptr(w.Handle), Integer(pval))
		    catch err As RuntimeException
		      'ignore
		    end try
		  #else
		    #pragma Unused w
		    #pragma Unused pval
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetPresentationOptions(Extends a As Application, Assigns value As NSApplicationPresentation)
		  #pragma Unused a
		  
		  #if TargetCocoa then
		    try
		      Soft Declare Function NSClassFromString Lib "Cocoa" (aClassName as CFStringRef) As Ptr
		      Soft Declare Function sharedApplication Lib "Cocoa" Selector "sharedApplication" (class_id as Ptr) As Ptr
		      Soft Declare Sub setPresentationOptions Lib "Cocoa" Selector "setPresentationOptions:" (ptrToApp As Ptr, valNSApplicationPresentationOptions As Integer)
		      
		      Dim ptrToSharedApplication As Ptr = sharedApplication(NSClassFromString("NSApplication"))
		      setPresentationOptions(ptrToSharedApplication, Integer(value))
		    catch err As RuntimeException
		      'ignore
		    end try
		  #else
		    #pragma Unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ToggleFullScreen(Extends W As DesktopWindow)
		  #if TargetCocoa then
		    try
		      Soft Declare Sub NSWindowToggleFullScreen Lib "AppKit" Selector "toggleFullScreen:" (target As Ptr, sender As Ptr)
		      NSWindowToggleFullScreen(w.handle,nil)
		    catch err As RuntimeException
		      'ignore
		    end try
		  #else
		    #pragma Unused W
		  #endif
		End Sub
	#tag EndMethod


	#tag Note, Name = Info
		http://www.jr-tools.ch/realbasic/lioncocoadeclares/
		
		Renamed the module name, as it pretty much only does the full screen feature
		
	#tag EndNote


	#tag Constant, Name = NSFullScreenWindowMask, Type = Double, Dynamic = False, Default = \"16384", Scope = Private
	#tag EndConstant


	#tag Enum, Name = NSApplicationPresentation, Flags = &h0
		Default=0
		  AutoHideDock=1
		  HideDock=2
		  AutoHideMenuBar=4
		  HideMenuBar=8
		  DisableAppleMenu=16
		  DisableProcessSwitching=32
		  DisableForceQuit=64
		  DisableSessionTermination=128
		  DisableHideApplication=256
		  DisableMenuBarTransparency=512
		  FullScreen=1024
		AutoHideToolbar=2048
	#tag EndEnum

	#tag Enum, Name = NSWindowCollectionBehavior, Flags = &h0
		Default=0
		  CanJoinAllSpaces=1
		  MoveToActiveSpace=2
		  Managed=4
		  Transient=8
		  Stationary=16
		  ParticipatesInCycle=32
		  IgnoresCycle=64
		  FullScreenPrimary=128
		FullScreenAuxiliary=256
	#tag EndEnum


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
			InitialValue="-2147483648"
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
	#tag EndViewBehavior
End Module
#tag EndModule
