#tag Module
Protected Module Notifications
	#tag Method, Flags = &h0
		Sub Listen(Extends observer As Object, notification As String)
		  // observer
		  //     Object registering as an observer. This value must not be nil.
		  //
		  // notification
		  //     The name of the notification the observer is registering.
		  //     Notification names can be any string, so long as they follow the same naming convention for method names
		  //
		  // notes
		  //     observers are stored based on the notification they want to receive
		  //     weak references are used, so as not to keep a reference to the observer
		  //     when the notification a method with the notification name will be called
		  
		  
		  DIM observersDict As Dictionary = mNotificationObserversDict.Lookup(notification, NEW Dictionary)
		  
		  DIM observerWeakRef As Xojo.Core.WeakRef = Xojo.Core.WeakRef.Create(observer)
		  if (observersDict.HasKey(observerWeakRef) = FALSE) then     // only add the observer once
		    observersDict.Value(observerWeakRef) = notification
		    mNotificationObserversDict.Value(notification) = observersDict
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Notify(Extends sender As Object, notification As String, ParamArray userInfo As Auto)
		  // sender
		  //     The object posting the notification. This value must not be nil.
		  //
		  // notification
		  //     The notification to post. This value must not be nil.
		  //     Notification names can be any string, so long as they follow the same naming convention for method names.
		  //
		  // userInfo
		  //     Information about the the notification. This value can be Nil.
		  
		  
		  DIM observersDict As Dictionary = mNotificationObserversDict.Lookup(notification, NEW Dictionary)
		  DIM observersDictClone As Dictionary = observersDict.Clone
		  
		  DIM params() As Auto
		  params.Append sender
		  if (UBound(userInfo) > -1) then
		    for each item As Auto in userInfo
		      params.Append item
		    next
		  end if
		  
		  if (observersDictClone.Count > 0) then
		    for each entry As DictionaryEntry in observersDictClone
		      DIM observerWeakRef As Xojo.Core.WeakRef = entry.Key
		      if (observerWeakRef.Value = Nil) then
		        observersDict.Remove observerWeakRef
		      else
		        DIM observer As Object = observerWeakRef.Value
		        DIM methods() As Xojo.Introspection.MethodInfo = Xojo.Introspection.GetType(observer).Methods
		        for i as Integer = 0 to  methods.Ubound
		          if (methods(i).Name = entry.Value) then
		            methods(i).Invoke observer, params
		            exit for i
		          end if
		        next
		      end if
		    next
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub PostUserNotification(title As String, subTitle As String, informativeText As String, contentImage As Picture, Optional identifier As String)
		  #if TargetCocoa
		    Declare Function alloc Lib "Cocoa" Selector "alloc" (classRef As Ptr) As Ptr
		    Declare Function defaultUserNotificationCenter Lib "Cocoa" Selector "defaultUserNotificationCenter" (classRef As Ptr) As Ptr
		    Declare Function init Lib "Cocoa" Selector "init" (classRef As Ptr) As Ptr
		    Declare Function initWithCGImageSize Lib "Cocoa" Selector "initWithCGImage:size:" (classRef As Ptr, CGImageRef As Ptr, size As NSSize) As Ptr
		    Declare Function NSClassFromString Lib "Cocoa" (className As CFStringRef) As Ptr
		    Declare Sub CFRelease Lib "CoreFoundation" (CFTypeRef As Ptr)
		    Declare Sub deliverNotification Lib "Cocoa" Selector "deliverNotification:" (defaultUserNotificationCenter As Ptr, notification As Ptr)
		    Declare Sub setTitle Lib "Cocoa" Selector "setTitle:" (instanceRef As Ptr, caption As CFStringRef)
		    Declare Sub setSubtitle Lib "Cocoa" Selector "setSubtitle:" (instanceRef As Ptr, caption As CFStringRef)
		    Declare Sub setInformativeText Lib "Cocoa" Selector "setInformativeText:" (instanceRef As Ptr, text As CFStringRef)
		    Declare Sub setIdentifier Lib "Cocoa" Selector "setIdentifier:" (instanceRef As Ptr, value As CFStringRef)
		    Declare Sub setContentImage Lib "Cocoa" Selector "setContentImage:" (instanceRef As Ptr, aNSImage As Ptr)
		    
		    Static NSUserNotificationClass As Ptr = NSClassFromString("NSUserNotification")
		    Static NSUserNotificationCenterClass As Ptr = NSClassFromString("NSUserNotificationCenter")
		    Static NSUserNotificationCenterDefaultCenter As Ptr = defaultUserNotificationCenter(NSUserNotificationCenterClass)
		    Static NSImageClass As Ptr = NSClassFromString("NSImage")
		    
		    // create the user notification instance and populate the properties
		    DIM NSUserNotificationInstance As Ptr = init(alloc(NSUserNotificationClass))
		    
		    if (title <> "") then
		      setTitle NSUserNotificationInstance, title
		    end if
		    
		    if (subTitle <> "") then
		      setSubtitle NSUserNotificationInstance, subTitle
		    end if
		    
		    if (informativeText <> "") then
		      setInformativeText NSUserNotificationInstance, informativeText
		    end if
		    
		    if (identifier <> "") then
		      setIdentifier NSUserNotificationInstance, identifier
		    else
		      setIdentifier NSUserNotificationInstance, App.ExecutableFile.Name
		    end if
		    
		    if (contentImage <> Nil) then
		      DIM aCGImage As Ptr = contentImage.CopyOSHandle(Picture.HandleType.MacCGImage)
		      if (aCGImage <> Nil) then
		        DIM size As NSSize
		        DIM aNSImage As Ptr = initWithCGImageSize(alloc(NSImageClass), aCGImage, size)
		        
		        setContentImage NSUserNotificationInstance, aNSImage
		        CFRelease aCGImage
		      end if
		    end if
		    
		    if (NSUserNotificationInstance <> Nil) then
		      deliverNotification NSUserNotificationCenterDefaultCenter, NSUserNotificationInstance
		    end if
		  #endif
		  
		  
		  #Pragma Unused title
		  #Pragma Unused subTitle
		  #Pragma Unused informativeText
		  #Pragma Unused contentImage
		  #Pragma Unused identifier
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub RequestUserAttention(critical As Boolean = FALSE)
		  #if TargetCocoa
		    Declare Function NSClassFromString Lib "Cocoa" (aClassName As CFStringRef) As Ptr
		    Declare Function NSSelectorFromString Lib "Cocoa" (aSelectorName As CFStringRef) As Ptr
		    Declare Function RespondsToSelector Lib "Cocoa" Selector "respondsToSelector:" (NSApp As Ptr, aSelector As Ptr) As Boolean
		    Declare Function SharedApplication Lib "Cocoa" Selector "sharedApplication" (aClass As Ptr) As Ptr
		    Declare Function RequestUserAttention Lib "Cocoa" Selector "requestUserAttention:" (NSApp As Ptr, requestType As Integer) As Integer
		    
		    Const NSCriticalRequest = 0
		    Const NSInformationalRequest = 10
		    
		    DIM NSApp As Ptr = SharedApplication(NSClassFromString("NSApplication"))
		    DIM aSelector As Ptr = NSSelectorFromString("requestUserAttention:")
		    
		    if (RespondsToSelector(NSApp, aSelector)) then
		      if (critical) then
		        Call RequestUserAttention(NSApp, NSCriticalRequest)
		      else
		        Call RequestUserAttention(NSApp, NSInformationalRequest)
		      end if
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Unlisten(Extends observer As Object)
		  // observer
		  //     Observer to remove from the dispatch table.
		  //     Will remove the observer from all notifications
		  
		  
		  for each observersDE As DictionaryEntry in mNotificationObserversDict
		    DIM observersDictClone As Dictionary = Dictionary(observersDE.Value).Clone
		    
		    DIM observerWeakRef As Xojo.Core.WeakRef = Xojo.Core.WeakRef.Create(observer)
		    if (observersDictClone.HasKey(observerWeakRef)) then
		      observersDictClone.Remove observerWeakRef
		      mNotificationObserversDict.Value(observersDE.Key) = observersDictClone
		    end if
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Unlisten(Extends observer As Object, notification As String)
		  // observer
		  //     Observer to remove from the dispatch table.
		  //
		  // notificationName
		  //     Name of the notification to remove from dispatch table.
		  //     Notification names can be any string.
		  
		  
		  DIM observersDict As Dictionary = mNotificationObserversDict.Lookup(notification, NEW Dictionary)
		  DIM observersDictClone As Dictionary = observersDict.Clone
		  
		  DIM observerWeakRef As Xojo.Core.WeakRef = Xojo.Core.WeakRef.Create(observer)
		  if (observersDictClone.HasKey(observerWeakRef)) then
		    observersDictClone.Remove observerWeakRef
		    mNotificationObserversDict.Value(notification) = observersDictClone
		  end if
		End Sub
	#tag EndMethod


	#tag Note, Name = 2.0.0
		
		2018-01-12
		• removed all classes so this can be made external code
	#tag EndNote

	#tag Note, Name = UNLICENSE
		
		This is free and unencumbered software released into the public domain.
		
		Anyone is free to copy, modify, publish, use, compile, sell, or
		distribute this software, either in source code form or as a compiled
		binary, for any purpose, commercial or non-commercial, and by any
		means.
		
		In jurisdictions that recognize copyright laws, the author or authors
		of this software dedicate any and all copyright interest in the
		software to the public domain. We make this dedication for the benefit
		of the public at large and to the detriment of our heirs and
		successors. We intend this dedication to be an overt act of
		relinquishment in perpetuity of all present and future rights to this
		software under copyright law.
		
		THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
		EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
		MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
		IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
		OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
		ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
		OTHER DEALINGS IN THE SOFTWARE.
		
		For more information, please refer to <http://unlicense.org>
	#tag EndNote


	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  Static mNotificationDict As NEW Dictionary
			  Return mNotificationDict
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #Pragma Unused value
			End Set
		#tag EndSetter
		Private mNotificationObserversDict As Dictionary
	#tag EndComputedProperty


	#tag Structure, Name = NSSize, Flags = &h21
		Width As Single
		Height As Single
	#tag EndStructure


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
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
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
