#tag Class
Protected Class AdiumSoundSet
	#tag Method, Flags = &h0
		Sub Constructor(path As FolderItem)
		  if (path <> Nil) AND (path.Exists) AND (path.IsFolder) AND ((path.Child("Sounds.plist").Exists) OR (path.Child(path.DisplayName + ".txt").Exists)) then
		    me.mDisplayName = path.DisplayName  //.Replace(".AdiumSoundSet", "")  // removed 2.0.0
		    me.mPath = path
		    
		    if (path.Child("Sounds.plist").Exists) then
		      me.ConstructorPlist path.Child("Sounds.plist")
		    elseif(path.Child(me.mDisplayName + ".txt").Exists) then
		      me.ConstructorTextFile path.Child(me.mDisplayName + ".txt")
		    end if
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ConstructorPlist(path As FolderItem)
		  DIM file As NEW FolderItem(path.NativePath, FolderItem.PathTypeNative)
		  DIM doc As NEW XmlDocument(file)
		  DIM node As XmlNode = doc.FirstChild.FirstChild
		  
		  DIM childNode As XmlNode = node.FirstChild
		  while childNode <> Nil
		    DIM key As String = childNode.FirstChild.Value
		    childNode = childNode.NextSibling
		    
		    select case key
		    case "Info"
		      me.mInfo = childNode.FirstChild.Value
		    case "Sounds"
		      childNode = childNode.FirstChild
		    else
		      me.LoadSoundFromKeyAndFileName key, childNode.FirstChild.Value
		    end select
		    
		    if (key <> "Sounds") then
		      childNode = childNode.NextSibling
		    end if
		  wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ConstructorTextFile(inPath As FolderItem)
		  if (inPath <> Nil) AND (inPath.Exists) AND (NOT inPath.IsFolder) then
		    DIM stream As TextInputStream = TextInputStream.Open(inPath)
		    DIM data As String = stream.ReadAll
		    stream.Close
		    
		    DIM aRegEx As NEW RegEx
		    aRegEx.SearchPattern = "^\""(?P<name>.+)\""\s*(?P<filename>.+)$"
		    
		    DIM match As RegExMatch = aRegEx.Search(data)
		    while (match <> Nil)
		      DIM key As String = match.SubExpressionString(1)
		      DIM filename As String = match.SubExpressionString(2)
		      
		      me.LoadSoundFromKeyAndFileName key, filename
		      
		      match = aRegEx.Search()
		    wend
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LoadSoundFromKeyAndFileName(key As String, soundFileName As String)
		  if (me.mPath.Child(soundFileName).Exists) then
		    DIM aSound As Sound = me.OpenAsSound(me.mPath.Child(soundFileName))
		    
		    select case key
		    case "Message Received", "Chat Received", "ChatReceived"
		      me.mChatReceived = aSound
		    case "Error"
		      me.mError = aSound
		    case "Message Sent", "New Mail Received", "MessageReceived"
		      me.mReceivedMessage = aSound
		    case "Notification Received", "News Posted", "NewsPosted"
		      me.mNewsPosted = aSound
		    case "Contact Invites You to Chat", "Private Chat Invitation Received", "PrivateChatInvitationReceived"
		      me.mReceivedPrivateChatInvitation = aSound
		    case "Connected", "Server Connected", "ServerConnected"
		      me.mServerConnected = aSound
		    case "Disconnected", "Server Disconnected", "ServerDisconnected"
		      me.mServerDisconnected = aSound
		    case "File Transfer Complete", "Transfer Finished", "TransferFinished"
		      me.mTransferFinished = aSound
		    case "File Transfer Began", "Transfer Started", "TransferStarted"
		      me.mTransferStarted = aSound
		    case "Notification received", "User Nick Changed", "UserNickChanged"
		      me.mUserNickChanged = aSound
		    case "Notification received", "User Status Changed", "UserStatusChanged"
		      me.mUserStatusChanged = aSound
		    case "Contact Joins", "Contact Signed On", "User Joined", "UserJoined"
		      me.mUserJoined = aSound
		    case "Contact Leaves", "Contact Signed Off", "User Left", "UserLeft"
		      me.mUserLeft = aSound
		    end select
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function OpenAsSound(inPath As FolderItem) As Sound
		  DIM results As Sound
		  
		  if (inPath <> Nil) AND (inPath.Exists) then
		    DIM file As NEW FolderItem(inPath.NativePath, FolderItem.PathTypeNative)
		    results = file.OpenAsSound
		  end if
		  
		  Return results
		End Function
	#tag EndMethod


	#tag Note, Name = 2.0.0
		
		2018-01-26
		• removed the check for the .AdiumSoundset file extension
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
			  Return me.mChatReceived
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #Pragma Unused value
			End Set
		#tag EndSetter
		ChatReceived As Sound
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
		DisplayName As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return me.mError
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #Pragma Unused value
			End Set
		#tag EndSetter
		Error As Sound
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return me.mInfo
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #Pragma Unused value
			End Set
		#tag EndSetter
		Info As String
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mChatReceived As Sound
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDisplayName As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mError As Sound
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return me.mReceivedMessage
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #Pragma Unused value
			End Set
		#tag EndSetter
		MessageReceived As Sound
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mInfo As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mNewsPosted As Sound
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPath As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mReceivedMessage As Sound
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mReceivedPrivateChatInvitation As Sound
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mServerConnected As Sound
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mServerDisconnected As Sound
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTransferFinished As Sound
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTransferStarted As Sound
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mUserJoined As Sound
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mUserLeft As Sound
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mUserNickChanged As Sound
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mUserStatusChanged As Sound
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return me.mNewsPosted
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #Pragma Unused value
			End Set
		#tag EndSetter
		NewsPosted As Sound
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
		Path As FolderItem
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return me.mReceivedPrivateChatInvitation
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #Pragma Unused value
			End Set
		#tag EndSetter
		PrivateChatInvitationReceived As Sound
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return me.mServerConnected
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #Pragma Unused value
			End Set
		#tag EndSetter
		ServerConnected As Sound
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return me.mServerDisconnected
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #Pragma Unused value
			End Set
		#tag EndSetter
		ServerDisconnected As Sound
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return me.mTransferFinished
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #Pragma Unused value
			End Set
		#tag EndSetter
		TransferFinished As Sound
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return me.mTransferStarted
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #Pragma Unused value
			End Set
		#tag EndSetter
		TransferStarted As Sound
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return me.mUserJoined
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #Pragma Unused value
			End Set
		#tag EndSetter
		UserJoined As Sound
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return me.mUserLeft
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #Pragma Unused value
			End Set
		#tag EndSetter
		UserLeft As Sound
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return me.mUserNickChanged
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #Pragma Unused value
			End Set
		#tag EndSetter
		UserNickChanged As Sound
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return me.mUserStatusChanged
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #Pragma Unused value
			End Set
		#tag EndSetter
		UserStatusChanged As Sound
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="ChatReceived"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Sound"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DisplayName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Text"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Error"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Sound"
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
			Name="Info"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Text"
			EditorType="MultiLineEditor"
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
			Name="MessageReceived"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Sound"
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
			Name="NewsPosted"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Sound"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="PrivateChatInvitationReceived"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Sound"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ServerConnected"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Sound"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ServerDisconnected"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Sound"
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
		#tag ViewProperty
			Name="TransferFinished"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Sound"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TransferStarted"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Sound"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="UserJoined"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Sound"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="UserLeft"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Sound"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="UserNickChanged"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Sound"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="UserStatusChanged"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Sound"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
