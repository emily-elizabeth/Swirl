#tag Class
Protected Class SwirlFileClass
	#tag Method, Flags = &h0
		Sub Constructor(path As String, type As Integer, size As UInt64, created As DateTime, modified As DateTime)
		  me.mPath = path
		  me.mType = type
		  me.mSize = size
		  me.mCreated = created
		  me.mModified = modified
		  
		  DIM results() As String = path.Split("/")
		  me.mName = results(results.Ubound)
		  
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mCreated
			End Get
		#tag EndGetter
		Created As DateTime
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mCreated As DateTime
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mModified As DateTime
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mName As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mModified
			End Get
		#tag EndGetter
		Modified As DateTime
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mPath As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSize As UInt64
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mType As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mName
			End Get
		#tag EndGetter
		Name As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mPath
			End Get
		#tag EndGetter
		Path As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mSize
			End Get
		#tag EndGetter
		Size As UInt64
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mType
			End Get
		#tag EndGetter
		Type As Integer
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
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Path"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Text"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Size"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="UInt64"
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
			Name="Type"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
