#tag Class
Protected Class NetWiredDataSocket
Inherits SSLSocket
	#tag Event
		Sub Connected()
		  if (me.mDelegate.Value = Nil) then
		    RaiseEvent Connected me.mPath, me.mOffset
		  else
		    NetWiredDataSocketInterface(me.mDelegate.Value).Connected me.mPath, me.mOffset
		  end if
		  
		  me.Write ConvertEncoding("TRANSFER " + me.mHash + me.EOT, Encodings.UTF8)
		  me.Flush
		End Sub
	#tag EndEvent

	#tag Event
		Sub DataAvailable()
		  DIM data As String = me.ReadAll()
		  DIM mbc As MemoryBlock = data
		  DIM mb As NEW Xojo.Core.MemoryBlock(mbc, mbc.Size)
		  
		  if (me.mDelegate.Value = Nil) then
		    RaiseEvent DataReceived mb
		  else
		    NetWiredDataSocketInterface(me.mDelegate.Value).DataReceived mb
		  end if
		End Sub
	#tag EndEvent

	#tag Event
		Sub Error()
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Constructor(aDelegate As NetWiredDataSocketInterface, address As String, port As Integer, path As Text, offset As UInt64, hash As Text)
		  me.Secure = TRUE
		  me.ConnectionType = SSLSocket.TLSv1
		  me.Address = address
		  me.Port = port
		  
		  me.mDelegate = NEW WeakRef(aDelegate)
		  me.mPath = path
		  me.mOffset = offset
		  me.mHash = hash
		  
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From TCPSocket
		  // Constructor() -- From SocketCore
		  Super.Constructor
		  
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Connected(path As Text, offset As UInt64)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DataReceived(data As xojo.Core.MemoryBlock)
	#tag EndHook


	#tag Property, Flags = &h0
		mBuffer As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDelegate As WeakRef
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mHash As Text
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mOffset As UInt64
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPath As Text
	#tag EndProperty


	#tag Constant, Name = EOT, Type = Double, Dynamic = False, Default = \"&u04", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="CertificateFile"
			Group="Behavior"
			Type="FolderItem"
			EditorType="File"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CertificatePassword"
			Visible=true
			Group="Behavior"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CertificateRejectionFile"
			Group="Behavior"
			Type="FolderItem"
			EditorType="File"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ConnectionType"
			Visible=true
			Group="Behavior"
			InitialValue="3"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="mBuffer"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Secure"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
