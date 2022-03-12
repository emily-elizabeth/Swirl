#tag Class
Protected Class WiredUser
	#tag Method, Flags = &h0
		Sub Constructor(userID As Integer, isIdle As Boolean, isAdmin As Boolean, nick As Text, login As Text, IP As Text, host As Text, status As Text, icon As Picture)
		  me.mUserID = userID
		  me.mIsIdle = isIdle
		  me.mIsAdmin = isAdmin
		  me.mNick = nick
		  me.mLogin = login
		  me.mIP = IP
		  me.mHost = host
		  me.mStatus = status
		  me.mIcon = icon
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  DIM alpha As UInt8 = if(me.IsIdle, 127, 0)  // if user is idle dim out the colour by setting the alpha value
			  DIM returnValue As Color = RGB(&h00, &h00, &h00, alpha)  // black (guest)
			  
			  if (me.IsAdmin) then
			    returnValue = RGB(&hFF, &h00, &h00, alpha)  // red (admin)
			  elseif (me.Login <> "guest") then
			    returnValue = RGB(&h00, &h80, &hBF, alpha)  // blue (account)
			  end if
			  
			  Return returnValue
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #Pragma Unused value
			End Set
		#tag EndSetter
		Colour As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return me.mHost
			End Get
		#tag EndGetter
		Host As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return me.mIcon
			End Get
		#tag EndGetter
		Icon As Picture
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return me.mIP
			End Get
		#tag EndGetter
		IP As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return me.mIsAdmin
			End Get
		#tag EndGetter
		IsAdmin As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return me.mIsIdle
			End Get
		#tag EndGetter
		IsIdle As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return me.mLogin
			End Get
		#tag EndGetter
		Login As Text
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mHost As Text
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mIcon As Picture
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mIP As Text
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mIsAdmin As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mIsIdle As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLogin As Text
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mNick As Text
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mStatus As Text
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mUserID As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return me.mNick
			End Get
		#tag EndGetter
		Nick As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return me.mStatus
			End Get
		#tag EndGetter
		Status As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return me.mUserID
			End Get
		#tag EndGetter
		UserID As Integer
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Colour"
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Host"
			Group="Behavior"
			Type="Text"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Icon"
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
			Name="IP"
			Group="Behavior"
			Type="Text"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsAdmin"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsIdle"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Login"
			Group="Behavior"
			Type="Text"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Nick"
			Group="Behavior"
			Type="Text"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Status"
			Group="Behavior"
			Type="Text"
			EditorType="MultiLineEditor"
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
			Name="UserID"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
