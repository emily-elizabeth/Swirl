#tag Class
Protected Class SwirlDataConnection
Implements NetWiredDataSocketInterface
	#tag Method, Flags = &h0
		Sub Connected(path As Text, offset As UInt64)
		  // Part of the NetWiredDataSocketInterface interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(connection As WiredConnection, file As SwirlFileClass)
		  self.mFile = file
		  'self.mDataSocket = NEW NetWiredDataSocket(me, connection.
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DataReceived(data As xojo.Core.MemoryBlock)
		  // Part of the NetWiredDataSocketInterface interface.
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Hash As Text
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDataSocket As NetWiredDataSocket
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mFile As SwirlFileClass
	#tag EndProperty

	#tag Property, Flags = &h0
		Name As Text
	#tag EndProperty

	#tag Property, Flags = &h0
		Path As Text
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Hash"
			Group="Behavior"
			Type="Text"
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
			Name="Path"
			Group="Behavior"
			Type="Text"
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
