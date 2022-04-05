#tag Class
Protected Class WiredPrivileges
	#tag Method, Flags = &h0
		Sub Constructor(getUserInfo As Boolean, broadcast As Boolean, postNews As Boolean, clearNews As Boolean, download As Boolean, upload As Boolean, uploadAnywhere As Boolean, createFolders As Boolean, alterFiles As Boolean, deleteFiles As Boolean, viewDropboxes As Boolean, createAccounts As Boolean, editAccounts As Boolean, deleteAccounts As Boolean, elevatePrivileges As Boolean, kickUsers As Boolean, banUsers As Boolean, cannotBeKicked As Boolean, downloadSpeed As UInt64, uploadSpeed As UInt64, downloadLimit As UInt64, uploadLimit As UInt64, changeTopic As Boolean)
		  self.mCanGetUserInfo = getUserInfo
		  self.mCanBroadcast = broadcast
		  self.mCanPostNews = postNews
		  self.mCanClearNews = clearNews
		  self.mCanDownload = download
		  self.mCanUpload = upload
		  self.mCanUploadAnywhere = uploadAnywhere
		  self.mCanCreateFolders = createFolders
		  self.mCanAlterFiles = alterFiles
		  self.mCanDeleteFiles = deleteFiles
		  self.mCanViewDropboxes = viewDropboxes
		  self.mCanCreateAccounts = createAccounts
		  self.mCanEditAccounts = editAccounts
		  self.mCanDeleteAccounts = deleteAccounts
		  self.mCanElevatePrivileges = elevatePrivileges
		  self.mCanKickUsers = kickUsers
		  self.mCanBanUsers = banUsers
		  self.mCannotBeKicked = cannotBeKicked
		  self.mDownloadSpeed = downloadSpeed
		  self.mUploadSpeed = uploadSpeed
		  self.mDownloadLimit = downloadLimit
		  self.mUploadLimit = uploadLimit
		  self.mCanChangeTopic = changeTopic
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mCanAlterFiles
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #Pragma Unused value
			End Set
		#tag EndSetter
		CanAlterFiles As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mCanBanUsers
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #Pragma Unused value
			End Set
		#tag EndSetter
		CanBanUsers As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mCanBroadcast
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #Pragma Unused value
			End Set
		#tag EndSetter
		CanBroadcast As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mCanChangeTopic
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #Pragma Unused value
			End Set
		#tag EndSetter
		CanChangeTopic As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mCanClearNews
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #Pragma Unused value
			End Set
		#tag EndSetter
		CanClearNews As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mCanCreateAccounts
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #Pragma Unused value
			End Set
		#tag EndSetter
		CanCreateAccounts As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mCanCreateFolders
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #Pragma Unused value
			End Set
		#tag EndSetter
		CanCreateFolders As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mCanDeleteAccounts
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #Pragma Unused value
			End Set
		#tag EndSetter
		CanDeleteAccounts As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mCanDeleteFiles
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #Pragma Unused value
			End Set
		#tag EndSetter
		CanDeleteFiles As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mCanDownload
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #Pragma Unused value
			End Set
		#tag EndSetter
		CanDownload As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mCanEditAccounts
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #Pragma Unused value
			End Set
		#tag EndSetter
		CanEditAccounts As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mCanElevatePrivileges
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #Pragma Unused value
			End Set
		#tag EndSetter
		CanElevatePrivileges As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mCanGetUserInfo
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #Pragma Unused value
			End Set
		#tag EndSetter
		CanGetUserInfo As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mCanKickUsers
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #Pragma Unused value
			End Set
		#tag EndSetter
		CanKickUsers As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mCannotBeKicked
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #Pragma Unused value
			End Set
		#tag EndSetter
		CannotBeKicked As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mCanPostNews
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #Pragma Unused value
			End Set
		#tag EndSetter
		CanPostNews As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mCanUpload
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #Pragma Unused value
			End Set
		#tag EndSetter
		CanUpload As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mCanUploadAnywhere
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #Pragma Unused value
			End Set
		#tag EndSetter
		CanUploadAnywhere As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mCanViewDropboxes
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #Pragma Unused value
			End Set
		#tag EndSetter
		CanViewDropboxes As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mDownloadLimit
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #Pragma Unused value
			End Set
		#tag EndSetter
		DownloadLimit As UInt64
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mDownloadSpeed
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #Pragma Unused value
			End Set
		#tag EndSetter
		DownloadSpeed As UInt64
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mCanAlterFiles As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCanBanUsers As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCanBroadcast As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCanChangeTopic As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCanClearNews As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCanCreateAccounts As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCanCreateFolders As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCanDeleteAccounts As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCanDeleteFiles As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCanDownload As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCanEditAccounts As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCanElevatePrivileges As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCanGetUserInfo As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCanKickUsers As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCannotBeKicked As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCanPostNews As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCanUpload As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCanUploadAnywhere As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCanViewDropboxes As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDownloadLimit As UInt64
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDownloadSpeed As UInt64
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mUploadLimit As UInt64
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mUploadSpeed As UInt64
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mUploadLimit
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #Pragma Unused value
			End Set
		#tag EndSetter
		UploadLimit As UInt64
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mUploadSpeed
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #Pragma Unused value
			End Set
		#tag EndSetter
		UploadSpeed As UInt64
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="CanAlterFiles"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CanBanUsers"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CanBroadcast"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CanChangeTopic"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CanClearNews"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CanCreateAccounts"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CanCreateFolders"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CanDeleteAccounts"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CanDeleteFiles"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CanDownload"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CanEditAccounts"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CanElevatePrivileges"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CanGetUserInfo"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CanKickUsers"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CannotBeKicked"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CanPostNews"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CanUpload"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CanUploadAnywhere"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CanViewDropboxes"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DownloadLimit"
			Group="Behavior"
			Type="UInt64"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DownloadSpeed"
			Group="Behavior"
			Type="UInt64"
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
			Name="UploadLimit"
			Group="Behavior"
			Type="UInt64"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UploadSpeed"
			Group="Behavior"
			Type="UInt64"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
