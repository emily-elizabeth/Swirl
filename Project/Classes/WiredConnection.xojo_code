#tag Class
Protected Class WiredConnection
Implements NetWiredSocketInterface
	#tag Method, Flags = &h21
		Private Sub AccountExists()
		  // Part of the NetWiredSocketInterface interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub AccountInfoReceived(login As Text, password As Text, group As Text, getUserInfo As Boolean, broadcast As Boolean, postNews As Boolean, clearNews As Boolean, download As Boolean, upload As Boolean, uploadAnywhere As Boolean, createFolders As Boolean, alterFiles As Boolean, deleteFiles As Boolean, viewDropboxes As Boolean, createAccounts As Boolean, editAccounts As Boolean, deleteAccounts As Boolean, elevatePrivileges As Boolean, kickUsers As Boolean, banUsers As Boolean, cannotBeKicked As Boolean, downloadSpeed As UInt64, uploadSpeed As UInt64, downloadLimit As UInt64, uploadLimit As UInt64, changeTopic As Boolean)
		  // Part of the NetWiredSocketInterface interface.
		  
		  ObjObserver.Notify self, Events.kWiredConnectionAccountInfoReceived, login, password, group, _
		  getUserInfo, broadcast, postNews, clearNews, download, upload, uploadAnywhere, createFolders, _
		  alterFiles, deleteFiles, viewDropboxes, createAccounts, editAccounts, deleteAccounts, elevatePrivileges, _
		  kickUsers, banUsers, cannotBeKicked, downloadSpeed, downloadLimit, uploadSpeed, uploadLimit, changeTopic
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub AccountListEnd()
		  // Part of the NetWiredSocketInterface interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub AccountListEntry(login As Text)
		  // Part of the NetWiredSocketInterface interface.
		  
		  ObjObserver.Notify self, Events.kWiredConnectionAccountListEntry, login
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub AccountNotFound()
		  // Part of the NetWiredSocketInterface interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub BanUserWithMessage(user As WiredUser, message As Text = "")
		  me.mControlSocket.KickUser user.UserID, TRUE, message
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ChatReceived(chatID As Integer, userID As Integer, message As Text, isAction As Boolean)
		  // Part of the NetWiredSocketInterface interface.
		  
		  if (me.mUsersDict.HasKey(userID)) then
		    ObjObserver.Notify me, Events.kWiredConnectionChatReceived, chatID, self.mUsersDict.Value(userID), message, isAction
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ChatTopicReceived(chatID As Integer, nick As Text, login As Text, IP As Text, time As Xojo.Core.Date, topic As Text)
		  // Part of the NetWiredSocketInterface interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ClearNews()
		  me.mControlSocket.ClearNews
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Close()
		  mConnections.Remove (mConnections.IndexOf(me))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Connect(address As Text, port As Integer = 2000, login As Text, hashedPassword As Text)
		  try
		    me.mLogin = login
		    me.mPassword = hashedPassword
		    me.mControlSocket.Address = address
		    me.mControlSocket.Port = port
		    me.mControlSocket.Connect
		  end try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Connected()
		  // Part of the NetWiredSocketInterface interface.
		  
		  REDIM me.mPrivateChatRequests(-1)
		  me.mUsersDict.RemoveAll
		  
		  me.SendClient "Swirl/" + App.LongVersion.ToText + Str(App.NonReleaseVersion).ToText +  "(🌀)"
		  me.SendNick Prefs.UserNick
		  me.SendStatus Prefs.UserStatus
		  me.SendIcon Prefs.UserIcon
		  me.SendLogin self.mLogin
		  me.SendPass self.mPassword
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  // create the control socket
		  me.mControlSocket = NEW NetWiredSocket(me)
		  me.mUsersDict = NEW Xojo.Core.Dictionary
		  
		  ObjObserver.Listen me, Events.kMyUserIconChanged
		  ObjObserver.Listen me, Events.kMyUserNickChanged
		  ObjObserver.Listen me, Events.kMyUserStatusChanged
		  
		  WiredConnection.mConnections.Append me
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateAccount(login As Text, hashedPassword As Text, group As Text, getUserInfo As Boolean, broadcast As Boolean, postNews As Boolean, clearNews As Boolean, download As Boolean, upload As Boolean, uploadAnywhere As Boolean, createFolders As Boolean, alterFiles As Boolean, deleteFiles As Boolean, viewDropboxes As Boolean, createAccounts As Boolean, editAccounts As Boolean, deleteAccounts As Boolean, elevatePrivileges As Boolean, kickUsers As Boolean, banUsers As Boolean, cannotBeKicked As Boolean, downloadSpeed As UInt64, uploadSpeed As UInt64, downloadLimit As UInt64, uploadLimit As UInt64, changeTopic As Boolean)
		  me.mControlSocket.CreateAccount login, hashedPassword, group, getUserInfo, broadcast, postNews, _
		  clearNews, download, upload, uploadAnywhere, createFolders, alterFiles, deleteFiles, viewDropboxes, _
		  createAccounts, editAccounts, deleteAccounts, elevatePrivileges, kickUsers, banUsers, cannotBeKicked, _
		  downloadSpeed, downloadLimit, uploadSpeed, uploadLimit, changeTopic
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateGroup(login As Text, getUserInfo As Boolean, broadcast As Boolean, postNews As Boolean, clearNews As Boolean, download As Boolean, upload As Boolean, uploadAnywhere As Boolean, createFolders As Boolean, alterFiles As Boolean, deleteFiles As Boolean, viewDropboxes As Boolean, createAccounts As Boolean, editAccounts As Boolean, deleteAccounts As Boolean, elevatePrivileges As Boolean, kickUsers As Boolean, banUsers As Boolean, cannotBeKicked As Boolean, downloadSpeed As UInt64, uploadSpeed As UInt64, downloadLimit As UInt64, uploadLimit As UInt64, changeTopic As Boolean)
		  me.mControlSocket.CreateGroup login, getUserInfo, broadcast, postNews, _
		  clearNews, download, upload, uploadAnywhere, createFolders, alterFiles, deleteFiles, viewDropboxes, _
		  createAccounts, editAccounts, deleteAccounts, elevatePrivileges, kickUsers, banUsers, cannotBeKicked, _
		  downloadSpeed, downloadLimit, uploadSpeed, uploadLimit, changeTopic
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreatePrivateChat(userID As Integer)
		  me.mPrivateChatRequests.Append userID
		  me.mControlSocket.CreatePrivateChat
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeclineInvitationToPrivateChat(chatID As Integer)
		  me.mControlSocket.DeclinePrivateChatInvitation chatID
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Disconnect()
		  me.mControlSocket.Disconnect
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DownloadConnected(path As Text, offset As UInt64)
		  'DIM results() As Text = path.Split("/")
		  'DIM fileName As Text = results(results.Ubound)
		  '
		  'if (me.mTransfersDict = Nil) then
		  'me.mTransfersDict = NEW xojo.Core.Dictionary
		  'end if
		  ''DIM f As NEW FolderItem(Prefs.DownloadFolder.Child(fileName).Path)
		  'me.mTransfersDict.Value(path) = Xojo.IO.BinaryStream.Create(Prefs.DownloadFolder.Child(fileName))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DownloadDataAvailable(path As Text, data As String)
		  '// Part of the NetWiredSocketInterface interface.
		  '
		  'DIM bs As Xojo.IO.BinaryStream = me.mTransfersDict.Value(path)
		  'dim mbc as MemoryBlock = data
		  'dim mb as new Xojo.Core.MemoryBlock( mbc, mbc.Size )
		  '
		  'bs.Write mb
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Error()
		  // Part of the NetWiredSocketInterface interface.
		  
		  select case me.mControlSocket.LastErrorCode
		  case 102  // This code means that you lost your connection.
		    // You will get this error if the remote side disconnects (whether its forcibly- 
		    // by pulling their ethernet cable out of the computer), or gracefully (by calling
		    // SocketCore's Close method). This may or not be a true error situation. If the
		    // remote side closed the connection, then it is not truly an error; it's just a 
		    // status indication. But if they pulled the ethernet cable out of the computer,
		    // then it really is an error; but the results are the same. The connection was lost.
		    // You will also get this error if you call the Disconnect method of TCPSocket.
		    ObjObserver.Notify self, Events.kWiredConnectionDisconnected
		    Xojo.Core.Timer.CancelCall WeakAddressOf PingTimerAction
		    
		  else
		    MsgBox "github issue this" //+ EndOfLine + Str(err.ErrorNumber)
		  end select
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ErrorAccountExists(message As Text)
		  // Part of the NetWiredSocketInterface interface.
		  
		  ObjObserver.Notify self, Events.kWiredConnectionAccountExists, message
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ErrorAccountNotFound(message As Text)
		  // Part of the NetWiredSocketInterface interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ErrorBanned(message As Text)
		  // Part of the NetWiredSocketInterface interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ErrorCannotBeDisconnected(message As Text)
		  // Part of the NetWiredSocketInterface interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ErrorChecksumMismatch(message As Text)
		  // Part of the NetWiredSocketInterface interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ErrorClientNotFound(message As Text)
		  // Part of the NetWiredSocketInterface interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ErrorCommandFailed(message As Text)
		  // Part of the NetWiredSocketInterface interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ErrorCommandNotImplemented(message As Text)
		  // Part of the NetWiredSocketInterface interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ErrorCommandNotRecognized(message As Text)
		  // Part of the NetWiredSocketInterface interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ErrorFileExists(message As Text)
		  // Part of the NetWiredSocketInterface interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ErrorFileNotFound(message As Text)
		  // Part of the NetWiredSocketInterface interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ErrorLoginFailed(message As Text)
		  // Part of the NetWiredSocketInterface interface.
		  
		  me.mControlSocket.Disconnect
		  
		  ObjObserver.Notify self, Events.kWiredConnectionLoginFailed, message
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ErrorPermissionDenied(message As Text)
		  // Part of the NetWiredSocketInterface interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ErrorQueueLimitExceeded(message As Text)
		  // Part of the NetWiredSocketInterface interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ErrorSyntaxError(message As Text)
		  // Part of the NetWiredSocketInterface interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub FileListEnd(path As Text, free As UInt64)
		  // Part of the NetWiredSocketInterface interface.
		  
		  ObjObserver.Notify self, Events.kWiredConnectionFileListEnd, path, free
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub FileListEntry(path As Text, type As Integer, size As UInt64, created As Xojo.Core.Date, modified As Xojo.Core.Date)
		  // Part of the NetWiredSocketInterface interface.
		  
		  ObjObserver.Notify self, Events.kWiredConnectionFileListEntry, path, type, size, created, modified
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Get(path As Text, offset As UInt64 = 0)
		  me.mControlSocket.Get path, offset
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub GroupInfoReceived(name As Text, getUserInfo As Boolean, broadcast As Boolean, postNews As Boolean, clearNews As Boolean, download As Boolean, upload As Boolean, uploadAnywhere As Boolean, createFolders As Boolean, alterFiles As Boolean, deleteFiles As Boolean, viewDropboxes As Boolean, createAccounts As Boolean, editAccounts As Boolean, deleteAccounts As Boolean, elevatePrivileges As Boolean, kickUsers As Boolean, banUsers As Boolean, cannotBeKicked As Boolean, downloadSpeed As UInt64, uploadSpeed As UInt64, downloadLimit As UInt64, uploadLimit As UInt64, changeTopic As Boolean)
		  // Part of the NetWiredSocketInterface interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub GroupListEnd()
		  // Part of the NetWiredSocketInterface interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub GroupListEntry(name As Text)
		  // Part of the NetWiredSocketInterface interface.
		  
		  ObjObserver.Notify self, Events.kWiredConnectionGroupListEntry, name
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InviteUserToPrivateChat(userID As Integer, chatID As Integer)
		  me.mControlSocket.InviteUserToPrivateChat userID, chatID
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub JoinPrivateChat(chatID As Integer)
		  me.mControlSocket.JoinPrivateChat chatID
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub KickUserWithMessage(user As WiredUser, message As Text = "")
		  me.mControlSocket.KickUser user.UserID, FALSE, message
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LeavePrivateChat(chatID As Integer)
		  self.mControlSocket.LeavePrivateChat chatID
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LoginSuccessful(myUserID As Integer)
		  // Part of the NetWiredSocketInterface interface.
		  
		  me.mMyUserID = myUserID
		  me.RequestPrivileges
		  
		  ObjObserver.Notify me, Events.kWiredConnectionLoginSuccessful
		  
		  Xojo.Core.Timer.CallLater 60000, WeakAddressOf PingTimerAction
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub MessageReceived(userID As Integer, message As Text, isBroadcast As Boolean)
		  // Part of the NetWiredSocketInterface interface.
		  
		  if (me.mUsersDict.HasKey(userID)) then
		    ObjObserver.Notify self, Events.kWiredConnectionMessageReceived, me.mUsersDict.Value(userID), message, isBroadcast
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub MyUserIconChanged(sender As Object)
		  #Pragma Unused sender
		  
		  me.SendIcon Prefs.UserIcon
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub MyUserNickChanged(sender As Object, nick As Text)
		  #Pragma Unused sender
		  
		  me.SendNick nick
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub MyUserStatusChanged(sender As Object, status As Text)
		  #Pragma Unused sender
		  
		  me.SendStatus status
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub NewsListEnd()
		  // Part of the NetWiredSocketInterface interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub NewsListEntry(nick As Text, time As Xojo.Core.Date, message As Text)
		  // Part of the NetWiredSocketInterface interface.
		  
		  ObjObserver.Notify self, Events.kWiredConnectionNewsListEntry, nick, time, message
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub NewsPosted(nick As Text, time As Xojo.Core.Date, message As Text)
		  // Part of the NetWiredSocketInterface interface.
		  
		  ObjObserver.Notify self, Events.kWiredConnectionNewsPosted, nick, time, message
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PingTimerAction()
		  me.SendPing
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PongReceived()
		  // Part of the NetWiredSocketInterface interface.
		  
		  Xojo.Core.Timer.CallLater 60000, WeakAddressOf PingTimerAction
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PostNews(newsPost As Text)
		  if (newsPost <> "") then
		    me.mControlSocket.PostNews newsPost
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PrivateChatCreated(chatID As Integer)
		  // Part of the NetWiredSocketInterface interface.
		  
		  DIM userID As Integer = me.mPrivateChatRequests(0)
		  me.mPrivateChatRequests.Remove 0
		  
		  if (me.mUsersDict.HasKey(userID)) then
		    ObjObserver.Notify me, Events.kWiredConnectionPrivateChatCreated, chatID, userID
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PrivateChatDeclined(chatID As Integer, userID As Integer)
		  // Part of the NetWiredSocketInterface interface.
		  
		  if (me.mUsersDict.HasKey(userID)) then
		    ObjObserver.Notify me, Events.kWiredConnectionPrivateChatDeclined, chatID, me.mUsersDict.Value(userID)
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PrivateChatInvitationReceived(chatID As Integer, userID As Integer)
		  // Part of the NetWiredSocketInterface interface.
		  
		  if (me.mUsersDict.HasKey(userID)) then
		    if (Prefs.AutoDeclinePrivateChatRequests) then
		      me.DeclineInvitationToPrivateChat chatID
		    else
		      ObjObserver.Notify me, Events.kWiredConnectionPrivateChatInvitationReceived, chatID, me.mUsersDict.Value(userID)
		    end if
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PrivilegesReceived(getUserInfo As Boolean, broadcast As Boolean, postNews As Boolean, clearNews As Boolean, download As Boolean, upload As Boolean, uploadAnywhere As Boolean, createFolders As Boolean, alterFiles As Boolean, deleteFiles As Boolean, viewDropboxes As Boolean, createAccounts As Boolean, editAccounts As Boolean, deleteAccounts As Boolean, elevatePrivileges As Boolean, kickUsers As Boolean, banUsers As Boolean, cannotBeKicked As Boolean, downloadSpeed As UInt64, uploadSpeed As UInt64, downloadLimit As UInt64, uploadLimit As UInt64, changeTopic As Boolean)
		  // Part of the NetWiredSocketInterface interface.
		  
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
		  
		  ObjObserver.Notify self, Events.kWiredConnectionPrivilegesReceived
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Reconnect()
		  me.mControlSocket.Connect
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RequestAccountInfo(login As Text)
		  me.mControlSocket.RequestAccountInfo login
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RequestAccounts()
		  me.mControlSocket.RequestAccounts
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RequestDirectoryListing(path As Text = "/")
		  if (path <> "") then
		    me.mControlSocket.RequestDirectoryListing path
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RequestGroupInfo(groupName As Text)
		  me.mControlSocket.RequestGroupInfo groupName
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RequestGroups()
		  self.mControlSocket.RequestGroups
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RequestNews()
		  me.mControlSocket.RequestNews
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RequestPrivileges()
		  me.mControlSocket.RequestPrivileges
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RequestUserInfo(user As WiredUser)
		  me.mControlSocket.RequestUserInfo user.UserID
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RequestUserList(chatID As Integer)
		  me.mControlSocket.RequestUserList chatID
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SaveAsBookmark()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SearchListEnd()
		  // Part of the NetWiredSocketInterface interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SearchListEntry(path As Text, type As Integer, size As UInt64, created As Xojo.Core.Date, modified As Xojo.Core.Date)
		  // Part of the NetWiredSocketInterface interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SendChat(chatID As Integer, message As Text, isAction As Boolean = FALSE)
		  me.mControlSocket.SendChat chatID, message, isAction
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SendClient(info As Text)
		  me.mControlSocket.SendClient info
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SendIcon(icon As Picture)
		  me.mControlSocket.SendIcon icon
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SendLogin(login As Text = "guest")
		  me.mLogin = login
		  me.mControlSocket.SendLogin login
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SendMessage(userID As Integer, message As Text, isBroadcast As Boolean)
		  me.mControlSocket.SendMessage userID, message, isBroadcast
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SendNick(nick As Text)
		  me.mControlSocket.SendNick nick
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SendPass(password As Text)
		  me.mPassword = password
		  me.mControlSocket.SendPass password
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SendPing()
		  me.mControlSocket.SendPing
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SendStatus(status As Text)
		  me.mControlSocket.SendStatus status
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ServerBannerReceived(serverBanner As Picture)
		  // Part of the NetWiredSocketInterface interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ServerInfoReceived(appVersion As Text, protocolVersion As Text, serverName As Text, serverDescription As Text, startTime As Xojo.Core.Date, filesCount As UInt64, filesSize As UInt64)
		  // Part of the NetWiredSocketInterface interface.
		  
		  me.mServerAppVersion = appVersion
		  me.mServerProtocolVersion = protocolVersion
		  me.mServerName = serverName
		  me.mServerDescription = serverDescription
		  me.mServerStartTime = startTime
		  me.mServerFilesCount = filesCount
		  me.mServerFilesSize = filesSize
		  
		  ObjObserver.Notify self, Events.kWiredConnectionServerInfoReceived
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub TransferQueued(path As Text, position As Integer)
		  // Part of the NetWiredSocketInterface interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub TransferReady(path As Text, offset As UInt64, hash As Text)
		  // Part of the NetWiredSocketInterface interface.
		  
		  'ObjObserver.Notify self, 
		  
		  'me.mControlSocket.Transfer path, offset, hash
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateAccount(login As Text, hashedPassword As Text, group As Text, getUserInfo As Boolean, broadcast As Boolean, postNews As Boolean, clearNews As Boolean, download As Boolean, upload As Boolean, uploadAnywhere As Boolean, createFolders As Boolean, alterFiles As Boolean, deleteFiles As Boolean, viewDropboxes As Boolean, createAccounts As Boolean, editAccounts As Boolean, deleteAccounts As Boolean, elevatePrivileges As Boolean, kickUsers As Boolean, banUsers As Boolean, cannotBeKicked As Boolean, downloadSpeed As UInt64, uploadSpeed As UInt64, downloadLimit As UInt64, uploadLimit As UInt64, changeTopic As Boolean)
		  me.mControlSocket.UpdateAccount login, hashedPassword, group, getUserInfo, broadcast, postNews, _
		  clearNews, download, upload, uploadAnywhere, createFolders, alterFiles, deleteFiles, viewDropboxes, _
		  createAccounts, editAccounts, deleteAccounts, elevatePrivileges, kickUsers, banUsers, cannotBeKicked, _
		  downloadSpeed, downloadLimit, uploadSpeed, uploadLimit, changeTopic
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateGroup(login As Text, getUserInfo As Boolean, broadcast As Boolean, postNews As Boolean, clearNews As Boolean, download As Boolean, upload As Boolean, uploadAnywhere As Boolean, createFolders As Boolean, alterFiles As Boolean, deleteFiles As Boolean, viewDropboxes As Boolean, createAccounts As Boolean, editAccounts As Boolean, deleteAccounts As Boolean, elevatePrivileges As Boolean, kickUsers As Boolean, banUsers As Boolean, cannotBeKicked As Boolean, downloadSpeed As UInt64, uploadSpeed As UInt64, downloadLimit As UInt64, uploadLimit As UInt64, changeTopic As Boolean)
		  me.mControlSocket.UpdateGroup login, getUserInfo, broadcast, postNews, _
		  clearNews, download, upload, uploadAnywhere, createFolders, alterFiles, deleteFiles, viewDropboxes, _
		  createAccounts, editAccounts, deleteAccounts, elevatePrivileges, kickUsers, banUsers, cannotBeKicked, _
		  downloadSpeed, downloadLimit, uploadSpeed, uploadLimit, changeTopic
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UserChanged(userID As Integer, isIdle As Boolean, isAdmin As Boolean, nick As Text, status As Text)
		  // Part of the NetWiredSocketInterface interface.
		  
		  if (self.mUsersDict.HasKey(userID)) then
		    DIM oldUser As WiredUser = self.mUsersDict.Value(userID)
		    DIM newUser As NEW WiredUser(userID, isIdle, isAdmin, nick, oldUser.Login, oldUser.IP, oldUser.Host, status, oldUser.Icon)
		    self.mUsersDict.Value(userID) = newUser
		    
		    ObjObserver.Notify me, Events.kWiredConnectionUserChanged, oldUser, newUser
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UserIconChanged(userID As Integer, icon As Picture)
		  // Part of the NetWiredSocketInterface interface.
		  
		  if (self.mUsersDict.HasKey(userID)) then
		    DIM oldUser As WiredUser = self.mUsersDict.Value(userID)
		    DIM newUser As NEW WiredUser(userID, oldUser.IsIdle, oldUser.IsAdmin, oldUser.Nick, oldUser.Login, oldUser.IP, oldUser.Host, oldUser.Status, icon)
		    self.mUsersDict.Value(userID) = newUser
		    
		    ObjObserver.Notify me, Events.kWiredConnectionUserIconChanged, newUser
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UserInfoReceived(userID As Integer, isIdle As Boolean, isAdmin As Boolean, nick As Text, login As Text, IP As Text, host As Text, clientVersion As Text, cipherName As Text, cipherBits As Integer, loginTime As Xojo.Core.Date, idleTime As Xojo.Core.Date, downloads As Text, uploads As Text, status As Text, icon As Picture)
		  // Part of the NetWiredSocketInterface interface.
		  
		  if (me.mUsersDict.HasKey(userID)) then
		    DIM user As WiredUser = me.mUsersDict.Value(userID)
		    ObjObserver.Notify me, Events.kWiredConnectionUserInfoReceived, user, isIdle, isAdmin, nick, login, IP, host, _
		    clientVersion, cipherName, cipherBits, loginTime, idleTime, downloads, uploads, status, icon
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UserJoined(chatID As Integer, userID As Integer, isIdle As Boolean, isAdmin As Boolean, nick As Text, login As Text, IP As Text, host As Text, status As Text, icon As Picture)
		  // Part of the NetWiredSocketInterface interface.
		  
		  DIM user As WiredUser
		  if (NOT me.mUsersDict.HasKey(userID)) then
		    me.mUsersDict.Value(userID) = NEW WiredUser(userID, isIdle, isAdmin, nick, login, IP, host, status, icon)
		  end if
		  user = me.mUsersDict.Value(userID)
		  
		  ObjObserver.Notify me, Events.kWiredConnectionUserJoined, chatID, user
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UserKicked(victimID As Integer, killerID As Integer, message As Text, isBan As Boolean)
		  // Part of the NetWiredSocketInterface interface.
		  
		  if (me.mUsersDict.HasKey(victimID)) AND (me.mUsersDict.HasKey(killerID)) then
		    DIM victim As WiredUser = me.mUsersDict.Value(victimID)
		    DIM killer As WiredUser = me.mUsersDict.Value(killerID)
		    me.mUsersDict.Remove victimID
		    
		    ObjObserver.Notify me, Events.kWiredConnectionUserKicked, victim, killer, message, isBan
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UserLeft(chatID As Integer, userID As Integer)
		  // Part of the NetWiredSocketInterface interface.
		  
		  if (me.mUsersDict.HasKey(userID)) then
		    DIM user As WiredUser = me.mUsersDict.Value(userID)
		    
		    if (chatID = 1) then
		      me.mUsersDict.Remove userID
		    end if
		    
		    ObjObserver.Notify me, Events.kWiredConnectionUserLeft, chatID, user
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UserListEnd(chatID As Integer)
		  // Part of the NetWiredSocketInterface interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UserListEntry(chatID As Integer, userID As Integer, isIdle As Boolean, isAdmin As Boolean, nick As Text, login As Text, IP As Text, host As Text, status As Text, icon As Picture)
		  // Part of the NetWiredSocketInterface interface.
		  
		  DIM user As WiredUser
		  if (NOT me.mUsersDict.HasKey(userID)) then
		    me.mUsersDict.Value(userID) = NEW WiredUser(userID, isIdle, isAdmin, nick, login, IP, host, status, icon)
		  end if
		  user = me.mUsersDict.Value(userID)
		  
		  ObjObserver.Notify me, Events.kWiredConnectionUserListEntry, chatID, user
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

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return self.mControlSocket.Handle
			End Get
		#tag EndGetter
		Handle As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return self.mControlSocket.IsConnected
			End Get
		#tag EndGetter
		IsConnected As Boolean
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
		Private Shared mConnections() As WiredConnection
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mControlSocket As NetWiredSocket
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDownloadLimit As UInt64
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDownloadSpeed As UInt64
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLogin As Text
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMyUserID As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPassword As Text
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPrivateChatRequests() As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mServerAppVersion As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mServerDescription As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mServerFilesCount As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mServerFilesSize As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mServerName As Text
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mServerProtocolVersion As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mServerStartTime As Xojo.Core.Date
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTransfersDict As xojo.Core.Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mUploadLimit As UInt64
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mUploadSpeed As UInt64
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mUsersDict As Xojo.Core.Dictionary
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if (self.mUsersDict.HasKey(self.MyUserID)) then
			    Return self.mUsersDict.Value(self.MyUserID)
			  else
			    Return Nil
			  end if
			End Get
		#tag EndGetter
		MyUser As WiredUser
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mMyUserID
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #Pragma Unused value
			End Set
		#tag EndSetter
		MyUserID As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return me.mControlSocket.Address
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  me.mControlSocket.Address = value
			End Set
		#tag EndSetter
		ServerAddress As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return me.mServerAppVersion
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #Pragma Unused value
			End Set
		#tag EndSetter
		ServerAppVersion As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return me.mServerDescription
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #Pragma Unused value
			End Set
		#tag EndSetter
		ServerDescription As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return me.mServerFilesCount
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #Pragma Unused value
			End Set
		#tag EndSetter
		ServerFilesCount As UInt64
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return me.mServerFilesSize
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #Pragma Unused value
			End Set
		#tag EndSetter
		ServerFilesSize As UInt64
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return me.mServerName
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #Pragma Unused value
			End Set
		#tag EndSetter
		ServerName As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return me.mServerProtocolVersion
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #Pragma Unused value
			End Set
		#tag EndSetter
		ServerProtocolVersion As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return me.mServerStartTime
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #Pragma Unused value
			End Set
		#tag EndSetter
		ServerStartTime As Xojo.Core.Date
	#tag EndComputedProperty

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
			Name="Handle"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsConnected"
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
			Name="MyUserID"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ServerAddress"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ServerAppVersion"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ServerDescription"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ServerFilesCount"
			Group="Behavior"
			Type="UInt64"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ServerFilesSize"
			Group="Behavior"
			Type="UInt64"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ServerName"
			Group="Behavior"
			Type="Text"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ServerProtocolVersion"
			Group="Behavior"
			Type="String"
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
