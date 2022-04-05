#tag Class
Protected Class DELETE_WiredNewsEntry
	#tag Method, Flags = &h0
		Sub Constructor(nick As String, time As DateTime, message As String)
		  self.mNick = nick
		  self.mTime = time
		  self.mMessage = message
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mMessage
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #Pragma Unused value
			End Set
		#tag EndSetter
		Message As String
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mMessage As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mNick As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTime As DateTime
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mNick
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #Pragma Unused value
			End Set
		#tag EndSetter
		Nick As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mTime
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #Pragma Unused value
			End Set
		#tag EndSetter
		Time As DateTime
	#tag EndComputedProperty


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
			Name="Message"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Text"
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
			Name="Nick"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Text"
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
End Class
#tag EndClass
