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
		Sub Error(err As RuntimeException)
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Constructor(aDelegate As NetWiredDataSocketInterface, address As String, port As Integer, path As String, offset As UInt64, hash As String)
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
		Event Connected(path As String, offset As UInt64)
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
		Private mHash As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mOffset As UInt64
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPath As String
	#tag EndProperty


	#tag Constant, Name = EOT, Type = Double, Dynamic = False, Default = \"&u04", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Address"
			Visible=true
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Port"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="SSLConnectionType"
			Visible=true
			Group="Behavior"
			InitialValue="3"
			Type="SSLConnectionTypes"
			EditorType="Enum"
			#tag EnumValues
				"1 - SSLv23"
				"3 - TLSv1"
				"4 - TLSv11"
				"5 - TLSv12"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="SSLEnabled"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="SSLConnected"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="SSLConnecting"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="BytesAvailable"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="BytesLeftToSend"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LastErrorCode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="CertificatePassword"
			Visible=true
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
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
			Name="mBuffer"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
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
	#tag EndViewBehavior
End Class
#tag EndClass
