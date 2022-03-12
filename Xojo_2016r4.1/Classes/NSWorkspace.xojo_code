#tag Class
Class NSWorkspace
	#tag Method, Flags = &h21
		Private Sub Constructor()
		  #if TargetCocoa
		    // DECLARES
		    Declare Function alloc Lib "Cocoa" Selector "alloc" (classRef As Ptr) As Ptr
		    Declare Function init Lib "Cocoa" Selector "init" (classRef As Ptr) As Ptr
		    Declare Function objc_allocateClassPair Lib "Cocoa" (superclass As Ptr, name As CString, extraBytes As Integer) As Ptr
		    Declare Function class_addMethod Lib "Cocoa" (aClass As Ptr, name As Ptr, imp As Ptr, types As CString) As Boolean
		    Declare Sub objc_registerClassPair Lib "Cocoa" (aClass As Ptr)
		    
		    Declare Function NSClassFromString Lib "Cocoa" (aClassName As CFStringRef) As Ptr
		    Declare Function NSSelectorFromString Lib "Cocoa" (aSelector As CFStringRef) As Ptr
		    Declare Function sharedWorkspace Lib "Cocoa" Selector "sharedWorkspace" (id As Ptr) As Ptr
		    Declare Function notificationCenter Lib "Cocoa" Selector "notificationCenter" (id As Ptr) As Ptr
		    Declare Sub addObserver Lib "Cocoa" Selector "addObserver:selector:name:object:" (id As Ptr, notificationObserver As Ptr, notificationSelector As Ptr, notificationName As CFStringRef, connection As Ptr)
		    
		    // create the workspace
		    if (NSWorkspace.Workspace = Nil) then
		      NSWorkspace.Workspace = NSClassFromString("NSWorkspace")
		      NSWorkspace.SharedWorkspace = sharedWorkspace(NSWorkspace.Workspace)
		      NSWorkspace.NotificationCenter = notificationCenter(NSWorkspace.SharedWorkspace)
		    end if
		    
		    // create the notification observer
		    if (NSWorkspace.DelegateClass = Nil) then
		      NSWorkspace.DelegateClass = objc_allocateClassPair(NSClassFromString("NSObject"), "ca.emilyelizabethhoward.wiredclient.observer", 0)
		      objc_registerClassPair NSWorkspace.DelegateClass  // register the class
		      
		      // add the methods to the new class
		      if (not class_addMethod(NSWorkspace.DelegateClass, NSSelectorFromString("DispatchNotification:"), AddressOf NSWorkspace.DispatchNotification, "v@:@")) then Break
		      
		      NSWorkspace.DelegateInstance = init(alloc(NSWorkspace.DelegateClass))
		      
		      // add all the notifications
		      addObserver NSWorkspace.NotificationCenter, NSWorkspace.DelegateInstance, NSSelectorFromString("DispatchNotification:"), Nil, NSWorkspace.SharedWorkspace
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Create() As NSWorkspace
		  DIM returnValue As NSWorkspace
		  
		  #if TargetCocoa
		    if (NSWorkspace.DelegateClassRef = Nil) then
		      NSWorkspace.DelegateClassRef = NEW NSWorkspace
		      returnValue = NSWorkspace.DelegateClassRef
		    end if
		  #endif
		  
		  Return returnValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DispatchNotification(notification As Ptr)
		  #if TargetCocoa
		    Declare Function name Lib "Cocoa" Selector "name" (id As Ptr) As CFStringRef
		    
		    select case name(notification)
		    case "NSWorkspaceWillLaunchApplicationNotification"
		      RaiseEvent NSWorkspaceWillLaunchApplicationNotification
		      
		    case "NSWorkspaceDidLaunchApplicationNotification"
		      RaiseEvent NSWorkspaceDidLaunchApplicationNotification
		      
		    case "NSWorkspaceDidTerminateApplicationNotification"
		      RaiseEvent NSWorkspaceDidTerminateApplicationNotification
		      
		    case "NSWorkspaceSessionDidBecomeActiveNotification"
		      RaiseEvent NSWorkspaceSessionDidBecomeActiveNotification
		      
		    case "NSWorkspaceSessionDidResignActiveNotification"
		      RaiseEvent NSWorkspaceSessionDidResignActiveNotification
		      
		    case "NSWorkspaceDidHideApplicationNotification"
		      RaiseEvent NSWorkspaceDidHideApplicationNotification
		      
		    case "NSWorkspaceDidUnhideApplicationNotification"
		      RaiseEvent NSWorkspaceDidUnhideApplicationNotification
		      
		    case "NSWorkspaceDidActivateApplicationNotification"
		      RaiseEvent NSWorkspaceDidActivateApplicationNotification
		      
		    case "NSWorkspaceDidDeactivateApplicationNotification"
		      RaiseEvent NSWorkspaceDidDeactivateApplicationNotification
		      
		    case "NSWorkspaceDidRenameVolumeNotification"
		      RaiseEvent NSWorkspaceDidRenameVolumeNotification
		      
		    case "NSWorkspaceDidMountNotification"
		      RaiseEvent NSWorkspaceDidMountNotification
		      
		    case "NSWorkspaceWillUnmountNotification"
		      RaiseEvent NSWorkspaceWillUnmountNotification
		      
		    case "NSWorkspaceDidUnmountNotification"
		      RaiseEvent NSWorkspaceDidUnmountNotification
		      
		    case "NSWorkspaceDidPerformFileOperationNotification"
		      RaiseEvent  NSWorkspaceDidPerformFileOperationNotification
		      
		    case "NSWorkspaceDidChangeFileLabelsNotification"
		      RaiseEvent  NSWorkspaceDidChangeFileLabelsNotification
		      
		    case "NSWorkspaceActiveSpaceDidChangeNotification"
		      RaiseEvent  NSWorkspaceActiveSpaceDidChangeNotification
		      
		    case "NSWorkspaceDidWakeNotification"
		      RaiseEvent  NSWorkspaceDidWakeNotification
		      
		    case "NSWorkspaceWillPowerOffNotification"
		      RaiseEvent  NSWorkspaceWillPowerOffNotification
		      
		    case "NSWorkspaceWillSleepNotification"
		      RaiseEvent  NSWorkspaceWillSleepNotification
		      
		    case "NSWorkspaceScreensDidSleepNotification"
		      RaiseEvent  NSWorkspaceScreensDidSleepNotification
		      
		    case "NSWorkspaceScreensDidWakeNotification"
		      RaiseEvent  NSWorkspaceScreensDidWakeNotification
		      
		    else
		      RaiseEvent  NSWorkspaceOtherNotification
		    end select
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub DispatchNotification(id As Ptr, sel As Ptr, notification As Ptr)
		  #pragma Unused id
		  #pragma Unused sel
		  
		  if (notification <> Nil) then
		    NSWorkspace.DelegateClassRef.DispatchNotification notification
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function IconForFileType(fileType As String) As Ptr
		  // returns a NSImage for the file type passed
		  // DIM aNSImage As Ptr = Cocoa.IconForFileType("png")
		  
		  #if TargetCocoa
		    Declare Function iconForFileType Lib "Cocoa" Selector "iconForFileType:" (SharedWorkspace As Ptr, fileType As CFStringRef) As Ptr
		    Return iconForFileType(SharedWorkspace, fileType)
		    
		  #else
		    #pragma Unused fileType
		  #endif
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event NSWorkspaceActiveSpaceDidChangeNotification()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NSWorkspaceDidActivateApplicationNotification()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NSWorkspaceDidChangeFileLabelsNotification()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NSWorkspaceDidDeactivateApplicationNotification()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NSWorkspaceDidHideApplicationNotification()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NSWorkspaceDidLaunchApplicationNotification()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NSWorkspaceDidMountNotification()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NSWorkspaceDidPerformFileOperationNotification()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NSWorkspaceDidRenameVolumeNotification()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NSWorkspaceDidTerminateApplicationNotification()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NSWorkspaceDidUnhideApplicationNotification()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NSWorkspaceDidUnmountNotification()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NSWorkspaceDidWakeNotification()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NSWorkspaceOtherNotification()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NSWorkspaceScreensDidSleepNotification()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NSWorkspaceScreensDidWakeNotification()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NSWorkspaceSessionDidBecomeActiveNotification()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NSWorkspaceSessionDidResignActiveNotification()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NSWorkspaceWillLaunchApplicationNotification()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NSWorkspaceWillPowerOffNotification()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NSWorkspaceWillSleepNotification()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NSWorkspaceWillUnmountNotification()
	#tag EndHook


	#tag Property, Flags = &h21
		Private Shared DelegateClass As Ptr
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared DelegateClassRef As NSWorkspace
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared DelegateInstance As Ptr
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared NotificationCenter As Ptr
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared SharedWorkspace As Ptr
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared Workspace As Ptr
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
