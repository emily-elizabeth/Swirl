#tag Module
Protected Module FormatByteCount
	#tag Method, Flags = &h0
		Function FormatByteCount(byteCount As UInt64, formatterStyle As ByteCountFormatterStyle = ByteCountFormatterStyle.Decimal) As String
		  DIM returnValue As String
		  
		  DIM kilobyte As UInt64 = if(formatterStyle = ByteCountFormatterStyle.Decimal, 1000, 1024)
		  
		  if (byteCount = 1) then
		    returnValue = Replace(oneByte, "%number%", "1")
		  elseif (byteCount < kilobyte) then
		    returnValue = Replace(numberBytes, "%number%", Str(byteCount))
		  else
		    DIM exp As Integer = (Log(byteCount) / Log(kilobyte))
		    DIM sizeLabel As String = Mid("KMGTPE", exp, 1) + if(formatterStyle = ByteCountFormatterStyle.Decimal, "B", "iB")
		    returnValue = Format((byteCount / (kilobyte ^ exp)), "-#.0") + " " + sizeLabel
		  end if
		  
		  Return returnValue
		End Function
	#tag EndMethod


	#tag Constant, Name = numberBytes, Type = String, Dynamic = True, Default = \"", Scope = Private
		#Tag Instance, Platform = Any, Language = en, Definition  = \"%number% bytes"
	#tag EndConstant

	#tag Constant, Name = oneByte, Type = String, Dynamic = True, Default = \"", Scope = Private
		#Tag Instance, Platform = Any, Language = en, Definition  = \"%number% byte"
	#tag EndConstant


	#tag Enum, Name = ByteCountFormatterStyle, Flags = &h0
		Decimal = 2
		Binary = 3
	#tag EndEnum


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
End Module
#tag EndModule
