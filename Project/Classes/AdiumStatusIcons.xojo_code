#tag Class
Protected Class AdiumStatusIcons
	#tag Method, Flags = &h0
		Sub Constructor(path As Xojo.IO.FolderItem)
		  try
		    me.mPath = path
		    me.mDisplayName = path.DisplayName
		    
		    if (path.Child("Icons.plist").Exists) then
		      me.LoadFromPath path.Child("Icons.plist")
		    else
		      Raise NEW IOException
		    end if
		  end try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LoadFromPath(path As Xojo.IO.FolderItem)
		  try
		    DIM stream As Xojo.IO.TextInputStream = Xojo.IO.TextInputStream.Open(path, Xojo.Core.TextEncoding.UTF8)
		    DIM data As Text = stream.ReadAll
		    stream.Close
		    
		    DIM rg As NEW RegEx
		    rg.SearchPattern = "<key>(.*)<\/key>\R\s*<string>(.*)<\/string>"
		    
		    DIM myMatch As RegExMatch
		    myMatch = rg.Search(data)
		    
		    do
		      if (myMatch <> Nil) then
		        select case myMatch.SubExpressionString(1)
		        case "Generic Available"
		          me.mAvailable = me.OpenAsPicture(myMatch.SubExpressionString(2).ToText)
		        case "Generic Away"
		          me.mAway = me.OpenAsPicture(myMatch.SubExpressionString(2).ToText)
		        case "Idle"
		          me.mIdle = me.OpenAsPicture(myMatch.SubExpressionString(2).ToText)
		        case "Offline"
		          me.mOffline = me.OpenAsPicture(myMatch.SubExpressionString(2).ToText)
		        case "Content"
		          me.mContent = me.OpenAsPicture(myMatch.SubExpressionString(2).ToText)
		        end select
		      end if
		      
		      myMatch = rg.Search
		    loop until myMatch = Nil
		  end try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function OpenAsPicture(value As Text) As Picture
		  DIM results As Picture
		  
		  for each f As Xojo.IO.FolderItem in me.mPath.Children
		    if (value = f.Name) OR (value = f.DisplayName) then
		      DIM classicFolderItem As FolderItem = NEW FolderItem(f.Path, FolderItem.PathTypeNative)
		      results = Picture.Open(classicFolderItem)
		    end if
		  next
		  
		  Return results
		End Function
	#tag EndMethod


	#tag Note, Name = 2.0.0
		
		2018-01-26
		• removed the check for the .AdiumStatusIcons file extension
		• moved out of the FreeLibs module/namespace (this allows it to be used as external code)
		
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


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return me.mAvailable
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #Pragma Unused value
			End Set
		#tag EndSetter
		Available As Picture
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return me.mAway
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #Pragma Unused value
			End Set
		#tag EndSetter
		Away As Picture
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return me.mContent
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #Pragma Unused value
			End Set
		#tag EndSetter
		Content As Picture
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return me.mDisplayName
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #Pragma Unused value
			End Set
		#tag EndSetter
		DisplayName As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return me.mIdle
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #Pragma Unused value
			End Set
		#tag EndSetter
		Idle As Picture
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mAvailable As Picture
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mAway As Picture
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mContent As Picture
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDisplayName As Text
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mIdle As Picture
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mOffline As Picture
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPath As Xojo.IO.FolderItem
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return me.mOffline
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #Pragma Unused value
			End Set
		#tag EndSetter
		Offline As Picture
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return me.mPath
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #Pragma Unused value
			End Set
		#tag EndSetter
		Path As Xojo.IO.FolderItem
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Available"
			Group="Behavior"
			Type="Picture"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Away"
			Group="Behavior"
			Type="Picture"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Content"
			Group="Behavior"
			Type="Picture"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DisplayName"
			Group="Behavior"
			Type="Text"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Idle"
			Group="Behavior"
			Type="Picture"
		#tag EndViewProperty
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
			Name="Offline"
			Group="Behavior"
			Type="Picture"
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
