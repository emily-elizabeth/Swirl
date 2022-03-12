#tag Class
Protected Class SwirlFileClass
	#tag Method, Flags = &h0
		Sub Constructor(path As Text, type As Integer, size As UInt64, created As Xojo.Core.Date, modified As Xojo.Core.Date)
		  me.mPath = path
		  me.mType = type
		  me.mSize = size
		  me.mCreated = created
		  me.mModified = modified
		  
		  DIM results() As Text = path.Split("/")
		  me.mName = results(results.Ubound)
		  
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mCreated
			End Get
		#tag EndGetter
		Created As Xojo.Core.Date
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mCreated As Xojo.Core.Date
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mModified As Xojo.Core.Date
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mName As Text
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mModified
			End Get
		#tag EndGetter
		Modified As Xojo.Core.Date
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mPath As Text
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
		Name As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mPath
			End Get
		#tag EndGetter
		Path As Text
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
			Name="Size"
			Group="Behavior"
			Type="UInt64"
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
		#tag ViewProperty
			Name="Type"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
