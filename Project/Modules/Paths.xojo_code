#tag Module
Protected Module Paths
	#tag Method, Flags = &h1
		Protected Function ApplicationSupport() As FolderItem
		  Const kBundleIdentifier As String = "ca.emilyelizabethhoward.swirl"
		  
		  Static returnValue As FolderItem  // this folder really shouldn't change during runtime
		  
		  if (returnValue = Nil) OR (not returnValue.Exists) then
		    // check for portable folder, this is a folder next to the application bundle/executable
		    #if TargetCocoa
		      returnValue = NEW FolderItem(App.ExecutableFile.Parent.Parent.Parent.Parent.Child(kBundleIdentifier).NativePath)
		    #else
		      returnValue = NEW FolderItem(App.ExecutableFile.Parent.Child(kBundleIdentifier).NativePath)
		    #endif
		    
		    // no portable folder, so check the SpecialFolder.ApplicationData FolderItem
		    if (returnValue = Nil) OR (not returnValue.Exists) then
		      returnValue = NEW FolderItem(SpecialFolder.ApplicationData.Child(kBundleIdentifier).NativePath)
		    end if
		    
		    // if we can't write to either the portable folder or the SpecialFolder.ApplicationData folder, use the SpecialFolder.Temporary folder
		    if (not returnValue.Parent.IsWriteable) then
		      returnValue = NEW FolderItem(SpecialFolder.Temporary.Child(kBundleIdentifier).NativePath)
		    end if
		    
		    // if the ApplicationSupport folder does not exist then create it (only for SpecialFolder.ApplicationData and SpecialFolder.Temporary)
		    if (not returnValue.Exists) then
		      returnValue.CreateAsFolder
		    end if
		  end if
		  
		  Return returnValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Bookmarks() As FolderItem
		  Static value As FolderItem = Paths.ApplicationSupport.Child("Bookmarks")
		  
		  if (value <> Nil) AND (NOT value.Exists) then
		    value.CreateAsFolder
		  end if
		  
		  Return value
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function DefaultDownloadFolder() As FolderItem
		  #if TargetCocoa
		    Const kUserDomain = -32763 //I did ‘theDomain as Integer=SpecialFolder.DomainUser’ instead.
		    Const kDownloadsFolderType = "down"
		    DIM path As FolderItem = SpecialFolder.GetFromDomainAndCode(kUserDomain, kDownloadsFolderType)
		    Return NEW FolderItem(path.NativePath)
		  #else
		    DIM path As FolderItem = SpecialFolder.Desktop
		    Return NEW FolderItem(path.NativePath)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function DefaultEmoticonSet() As FolderItem
		  Static results As FolderItem = Paths.Resources.Child("DefaultTheme").Child(DefaultEmoticonSetName)
		  Return results
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function DefaultIcon() As FolderItem
		  Static results As FolderItem = Paths.Resources.Child("DefaultTheme").Child(DefaultIconName)
		  Return results
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function DefaultMessageStyle() As FolderItem
		  Static results As FolderItem = Paths.Resources.Child("DefaultTheme").Child(DefaultMessageStyleName)
		  Return results
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function DefaultNewsStyle() As FolderItem
		  Static results As FolderItem = Paths.Resources.Child("DefaultTheme").Child(DefaultNewsStyleName)
		  Return results
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function DefaultSoundSet() As FolderItem
		  Static results As FolderItem = Paths.Resources.Child("DefaultTheme").Child(DefaultSoundSetName)
		  Return results
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function DefaultStatusIconSet() As FolderItem
		  Static results As FolderItem = Paths.Resources.Child("DefaultTheme").Child(DefaultStatusIconSetName)
		  Return results
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Emoticons() As FolderItem
		  Static value As FolderItem = Paths.ApplicationSupport.Child("Emoticons")
		  
		  if (value <> Nil) AND (NOT value.Exists) then
		    value.CreateAsFolder
		  end if
		  
		  Return value
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Icons() As FolderItem
		  Static value As FolderItem = Paths.ApplicationSupport.Child("Icons")
		  
		  if (value <> Nil) AND (NOT value.Exists) then
		    value.CreateAsFolder
		  end if
		  
		  Return value
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function MessageStyles() As FolderItem
		  Static value As FolderItem = Paths.ApplicationSupport.Child("Message Styles")
		  
		  if (value <> Nil) AND (NOT value.Exists) then
		    value.CreateAsFolder
		  end if
		  
		  Return value
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function NewsStyles() As FolderItem
		  Static value As FolderItem = Paths.ApplicationSupport.Child("News Styles")
		  
		  if (value <> Nil) AND (NOT value.Exists) then
		    value.CreateAsFolder
		  end if
		  
		  Return value
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Preferences() As FolderItem
		  // we use our own preference path variable instead of the SpecialFolder.Preferences
		  // because even on Mac OS X we still store the preferences in the SpecialFolder.ApplicationData folder
		  
		  Static returnValue As FolderItem = ApplicationSupport.Child("Preferences")
		  
		  if (returnValue <> Nil) AND (not returnValue.Exists) then
		    returnValue.CreateAsFolder
		  end if
		  
		  Return returnValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Resources() As FolderItem
		  Static value As FolderItem
		  
		  if (value = Nil) OR (NOT value.Exists) then
		    #if TargetCocoa
		      Declare Function NSClassFromString Lib "AppKit" (className As CFStringRef) As Ptr
		      Declare Function mainBundle Lib "AppKit" Selector "mainBundle" (NSBundleClass As Ptr) As Ptr
		      Declare Function resourcePath Lib "AppKit" Selector "resourcePath" (NSBundleRef As Ptr) As CFStringRef
		      
		      DIM NSBundleClass As Ptr = NSClassFromString("NSBundle")
		      DIM NSBundleRef As Ptr = mainBundle(NSBundleClass)
		      DIM path As String = resourcePath(NSBundleRef)
		      
		      value = NEW FolderItem(path)
		      
		    #else
		      DIM resourcesFolderName As String = App.ExecutableFile.Name + " Resources"
		      resourcesFolderName = resourcesFolderName.Replace(".exe", "")
		      
		      value = NEW FolderItem(App.ExecutableFile.Parent.Child(resourcesFolderName).NativePath)
		    #endif
		  end if
		  
		  Return value
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Sounds() As FolderItem
		  Static value As FolderItem = Paths.ApplicationSupport.Child("Sounds")
		  
		  if (value <> Nil) AND (NOT value.Exists) then
		    value.CreateAsFolder
		  end if
		  
		  Return value
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function StatusIcons() As FolderItem
		  Static value As FolderItem = Paths.ApplicationSupport.Child("Status Icons")
		  
		  if (value <> Nil) AND (NOT value.Exists) then
		    value.CreateAsFolder
		  end if
		  
		  Return value
		End Function
	#tag EndMethod


	#tag Constant, Name = DefaultEmoticonSetName, Type = Text, Dynamic = False, Default = \"swirl.AdiumEmoticonset", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = DefaultIconName, Type = Text, Dynamic = False, Default = \"spiral-galaxy-64.png", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = DefaultMessageStyleName, Type = Text, Dynamic = False, Default = \"swirl.AdiumMessageStyle", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = DefaultNewsStyleName, Type = Text, Dynamic = False, Default = \"swirl.viennastyle", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = DefaultPreferencesName, Type = Text, Dynamic = False, Default = \"ca.emilyelizabethhoward.swirl.json", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = DefaultSoundSetName, Type = Text, Dynamic = False, Default = \"swirl.AdiumSoundset", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = DefaultStatusIconSetName, Type = Text, Dynamic = False, Default = \"swirl.AdiumStatusIcons", Scope = Protected
	#tag EndConstant


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
