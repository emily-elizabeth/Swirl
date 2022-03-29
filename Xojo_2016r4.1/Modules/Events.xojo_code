#tag Module
Protected Module Events
	#tag Constant, Name = kAppearanceChanged, Type = String, Dynamic = False, Default = \"AppearanceChanged", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kMyUserIconChanged, Type = String, Dynamic = False, Default = \"MyUserIconChanged", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kMyUserNickChanged, Type = String, Dynamic = False, Default = \"MyUserNickChanged", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kMyUserStatusChanged, Type = String, Dynamic = False, Default = \"MyUserStatusChanged", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kNSWorkspaceWillPowerOff, Type = String, Dynamic = False, Default = \"NSWorkspaceWillPowerOff", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kNSWorkspaceWillSleep, Type = String, Dynamic = False, Default = \"NSWorkspaceWillSleep", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kSCInitTransferWithConnection, Type = String, Dynamic = False, Default = \"SCInitTransferWithConnection", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kWiredConnectionAccountExists, Type = String, Dynamic = False, Default = \"WiredConnectionAccountExists", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kWiredConnectionAccountInfoReceived, Type = String, Dynamic = False, Default = \"WiredConnectionAccountInfoReceived", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kWiredConnectionAccountListEntry, Type = String, Dynamic = False, Default = \"WiredConnectionAccountListEntry", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kWiredConnectionChatReceived, Type = String, Dynamic = False, Default = \"WiredConnectionChatReceived", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kWiredConnectionChatTopicReceived, Type = String, Dynamic = False, Default = \"WiredConnectionChatTopicReceived", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kWiredConnectionConnected, Type = String, Dynamic = False, Default = \"WiredConnectionConnected", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kWiredConnectionDisconnected, Type = String, Dynamic = False, Default = \"WiredConnectionDisconnected", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kWiredConnectionFileListEnd, Type = String, Dynamic = False, Default = \"WiredConnectionFileListEnd", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kWiredConnectionFileListEntry, Type = String, Dynamic = False, Default = \"WiredConnectionFileListEntry", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kWiredConnectionGroupListEntry, Type = String, Dynamic = False, Default = \"WiredConnectionGroupListEntry", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kWiredConnectionLoginFailed, Type = String, Dynamic = False, Default = \"WiredConnectionLoginFailed", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kWiredConnectionLoginSuccessful, Type = String, Dynamic = False, Default = \"WiredConnectionLoginSuccessful", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kWiredConnectionMessageReceived, Type = String, Dynamic = False, Default = \"WiredConnectionMessageReceived", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kWiredConnectionNewsListEntry, Type = String, Dynamic = False, Default = \"WiredConnectionNewsListEntry", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kWiredConnectionNewsPosted, Type = String, Dynamic = False, Default = \"WiredConnectionNewsPosted", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kWiredConnectionPrivateChatCreated, Type = String, Dynamic = False, Default = \"WiredConnectionPrivateChatCreated", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kWiredConnectionPrivateChatDeclined, Type = String, Dynamic = False, Default = \"WiredConnectionPrivateChatDeclined", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kWiredConnectionPrivateChatInvitationReceived, Type = String, Dynamic = False, Default = \"WiredConnectionPrivateChatInvitationReceived", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kWiredConnectionPrivilegesReceived, Type = String, Dynamic = False, Default = \"WiredConnectionPrivilegesReceived", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kWiredConnectionServerInfoReceived, Type = String, Dynamic = False, Default = \"WiredConnectionServerInfoReceived", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kWiredConnectionUserChanged, Type = String, Dynamic = False, Default = \"WiredConnectionUserChanged", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kWiredConnectionUserIconChanged, Type = String, Dynamic = False, Default = \"WiredConnectionUserIconChanged", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kWiredConnectionUserInfoReceived, Type = String, Dynamic = False, Default = \"WiredConnectionUserInfoReceived", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kWiredConnectionUserJoined, Type = String, Dynamic = False, Default = \"WiredConnectionUserJoined", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kWiredConnectionUserKicked, Type = String, Dynamic = False, Default = \"WiredConnectionUserKicked", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kWiredConnectionUserLeft, Type = String, Dynamic = False, Default = \"WiredConnectionUserLeft", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kWiredConnectionUserListEntry, Type = String, Dynamic = False, Default = \"WiredConnectionUserListEntry", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kWiredMessageStyleChanged, Type = String, Dynamic = False, Default = \"WiredMessageStyleChanged", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kWiredMessageStyleFontSizeChanged, Type = String, Dynamic = False, Default = \"WiredMessageStyleFontSizeChanged", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kWiredNewConnection, Type = String, Dynamic = False, Default = \"WiredNewConnection", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kWiredNewsStyleChanged, Type = String, Dynamic = False, Default = \"NewsStyleChanged", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kWiredStatusIconSetChanged, Type = Text, Dynamic = False, Default = \"WiredStatusIconSetChanged", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kWiredWindowClosing, Type = String, Dynamic = False, Default = \"WiredWindowClosing", Scope = Protected
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
