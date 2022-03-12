#tag Module
Protected Module Colours
	#tag Constant, Name = BadgeColour, Type = Color, Dynamic = False, Default = \"&c99A9C5", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = Black, Type = Color, Dynamic = False, Default = \"&c00000000", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = Blue, Type = Color, Dynamic = False, Default = \"&c0000FF", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = Grey, Type = Color, Dynamic = False, Default = \"&c7F7F8500", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = InactiveHighlight, Type = Color, Dynamic = False, Default = \"&cCACACA00", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = White, Type = Color, Dynamic = False, Default = \"&cFFFFFF00", Scope = Protected
	#tag EndConstant


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
