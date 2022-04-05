#tag Class
Protected Class WiredConnection
Implements NetWiredSocketInterface
	#tag Method, Flags = &h21
		Private Sub AccountExists()
		  // Part of the NetWiredSocketInterface interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub AccountInfoReceived(login As String, password As String, group As String, getUserInfo As Boolean, broadcast As Boolean, postNews As Boolean, clearNews As Boolean, download As Boolean, upload As Boolean, uploadAnywhere As Boolean, createFolders As Boolean, alterFiles As Boolean, deleteFiles As Boolean, viewDropboxes As Boolean, createAccounts As Boolean, editAccounts As Boolean, deleteAccounts As Boolean, elevatePrivileges As Boolean, kickUsers As Boolean, banUsers As Boolean, cannotBeKicked As Boolean, downloadSpeed As UInt64, uploadSpeed As UInt64, downloadLimit As UInt64, uploadLimit As UInt64, changeTopic As Boolean)
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
		Private Sub AccountListEntry(login As String)
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
		Sub BanUserWithMessage(user As WiredUser, message As String = "")
		  me.mControlSocket.KickUser user.UserID, TRUE, message
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ChatReceived(chatID As Integer, userID As Integer, message As String, isAction As Boolean)
		  // Part of the NetWiredSocketInterface interface.
		  
		  if (me.mUsersDict.HasKey(userID)) then
		    ObjObserver.Notify me, Events.kWiredConnectionChatReceived, chatID, self.mUsersDict.Value(userID), message, isAction
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ChatTopicReceived(chatID As Integer, nick As String, login As String, IP As String, time As DateTime, topic As String)
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
		Sub Connect(address As String, port As Integer = 2000, login As String, hashedPassword As String)
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
		  
		  me.SendClient "Swirl/" '+ App.LongVersion + Str(App.NonReleaseVersion) +  "(🌀)"
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
		  me.mUsersDict = NEW Dictionary
		  
		  ObjObserver.Listen me, Events.kMyUserIconChanged
		  ObjObserver.Listen me, Events.kMyUserNickChanged
		  ObjObserver.Listen me, Events.kMyUserStatusChanged
		  
		  WiredConnection.mConnections.Append me
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateAccount(login As String, hashedPassword As String, group As String, getUserInfo As Boolean, broadcast As Boolean, postNews As Boolean, clearNews As Boolean, download As Boolean, upload As Boolean, uploadAnywhere As Boolean, createFolders As Boolean, alterFiles As Boolean, deleteFiles As Boolean, viewDropboxes As Boolean, createAccounts As Boolean, editAccounts As Boolean, deleteAccounts As Boolean, elevatePrivileges As Boolean, kickUsers As Boolean, banUsers As Boolean, cannotBeKicked As Boolean, downloadSpeed As UInt64, uploadSpeed As UInt64, downloadLimit As UInt64, uploadLimit As UInt64, changeTopic As Boolean)
		  me.mControlSocket.CreateAccount login, hashedPassword, group, getUserInfo, broadcast, postNews, _
		  clearNews, download, upload, uploadAnywhere, createFolders, alterFiles, deleteFiles, viewDropboxes, _
		  createAccounts, editAccounts, deleteAccounts, elevatePrivileges, kickUsers, banUsers, cannotBeKicked, _
		  downloadSpeed, downloadLimit, uploadSpeed, uploadLimit, changeTopic
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateGroup(login As String, getUserInfo As Boolean, broadcast As Boolean, postNews As Boolean, clearNews As Boolean, download As Boolean, upload As Boolean, uploadAnywhere As Boolean, createFolders As Boolean, alterFiles As Boolean, deleteFiles As Boolean, viewDropboxes As Boolean, createAccounts As Boolean, editAccounts As Boolean, deleteAccounts As Boolean, elevatePrivileges As Boolean, kickUsers As Boolean, banUsers As Boolean, cannotBeKicked As Boolean, downloadSpeed As UInt64, uploadSpeed As UInt64, downloadLimit As UInt64, uploadLimit As UInt64, changeTopic As Boolean)
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
		Private Sub DownloadConnected(path As String, offset As UInt64)
		  'DIM results() As String = path.Split("/")
		  'DIM fileName As String = results(results.Ubound)
		  '
		  'if (me.mTransfersDict = Nil) then
		  'me.mTransfersDict = NEW Dictionary
		  'end if
		  ''DIM f As NEW FolderItem(Prefs.DownloadFolder.Child(fileName).Path)
		  'me.mTransfersDict.Value(path) = Xojo.IO.BinaryStream.Create(Prefs.DownloadFolder.Child(fileName))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DownloadDataAvailable(path As String, data As String)
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
		Private Sub ErrorAccountExists(message As String)
		  // Part of the NetWiredSocketInterface interface.
		  
		  ObjObserver.Notify self, Events.kWiredConnectionAccountExists, message
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ErrorAccountNotFound(message As String)
		  // Part of the NetWiredSocketInterface interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ErrorBanned(message As String)
		  // Part of the NetWiredSocketInterface interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ErrorCannotBeDisconnected(message As String)
		  // Part of the NetWiredSocketInterface interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ErrorChecksumMismatch(message As String)
		  // Part of the NetWiredSocketInterface interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ErrorClientNotFound(message As String)
		  // Part of the NetWiredSocketInterface interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ErrorCommandFailed(message As String)
		  // Part of the NetWiredSocketInterface interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ErrorCommandNotImplemented(message As String)
		  // Part of the NetWiredSocketInterface interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ErrorCommandNotRecognized(message As String)
		  // Part of the NetWiredSocketInterface interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ErrorFileExists(message As String)
		  // Part of the NetWiredSocketInterface interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ErrorFileNotFound(message As String)
		  // Part of the NetWiredSocketInterface interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ErrorLoginFailed(message As String)
		  // Part of the NetWiredSocketInterface interface.
		  
		  me.mControlSocket.Disconnect
		  
		  ObjObserver.Notify self, Events.kWiredConnectionLoginFailed, message
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ErrorPermissionDenied(message As String)
		  // Part of the NetWiredSocketInterface interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ErrorQueueLimitExceeded(message As String)
		  // Part of the NetWiredSocketInterface interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ErrorSyntaxError(message As String)
		  // Part of the NetWiredSocketInterface interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub FileListEnd(path As String, free As UInt64)
		  // Part of the NetWiredSocketInterface interface.
		  
		  ObjObserver.Notify self, Events.kWiredConnectionFileListEnd, path, free
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub FileListEntry(path As String, type As Integer, size As UInt64, created As DateTime, modified As DateTime)
		  // Part of the NetWiredSocketInterface interface.
		  
		  ObjObserver.Notify self, Events.kWiredConnectionFileListEntry, path, type, size, created, modified
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Get(path As String, offset As UInt64 = 0)
		  me.mControlSocket.Get path, offset
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub GroupInfoReceived(name As String, getUserInfo As Boolean, broadcast As Boolean, postNews As Boolean, clearNews As Boolean, download As Boolean, upload As Boolean, uploadAnywhere As Boolean, createFolders As Boolean, alterFiles As Boolean, deleteFiles As Boolean, viewDropboxes As Boolean, createAccounts As Boolean, editAccounts As Boolean, deleteAccounts As Boolean, elevatePrivileges As Boolean, kickUsers As Boolean, banUsers As Boolean, cannotBeKicked As Boolean, downloadSpeed As UInt64, uploadSpeed As UInt64, downloadLimit As UInt64, uploadLimit As UInt64, changeTopic As Boolean)
		  // Part of the NetWiredSocketInterface interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub GroupListEnd()
		  // Part of the NetWiredSocketInterface interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub GroupListEntry(name As String)
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
		Sub KickUserWithMessage(user As WiredUser, message As String = "")
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
		Private Sub MessageReceived(userID As Integer, message As String, isBroadcast As Boolean)
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
		Private Sub MyUserNickChanged(sender As Object, nick As String)
		  #Pragma Unused sender
		  
		  me.SendNick nick
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub MyUserStatusChanged(sender As Object, status As String)
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
		Private Sub NewsListEntry(nick As String, time As DateTime, message As String)
		  // Part of the NetWiredSocketInterface interface.
		  
		  ObjObserver.Notify self, Events.kWiredConnectionNewsListEntry, nick, time, message
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub NewsPosted(nick As String, time As DateTime, message As String)
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
		Sub PostNews(newsPost As String)
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
		Sub RequestAccountInfo(login As String)
		  me.mControlSocket.RequestAccountInfo login
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RequestAccounts()
		  me.mControlSocket.RequestAccounts
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RequestDirectoryListing(path As String = "/")
		  if (path <> "") then
		    me.mControlSocket.RequestDirectoryListing path
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RequestGroupInfo(groupName As String)
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
		Private Sub SearchListEntry(path As String, type As Integer, size As UInt64, created As DateTime, modified As DateTime)
		  // Part of the NetWiredSocketInterface interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SendChat(chatID As Integer, message As String, isAction As Boolean = FALSE)
		  me.mControlSocket.SendChat chatID, message, isAction
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SendClient(info As String)
		  me.mControlSocket.SendClient info
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SendIcon(icon As Picture)
		  me.mControlSocket.SendIcon icon
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SendLogin(login As String = "guest")
		  me.mLogin = login
		  me.mControlSocket.SendLogin login
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SendMessage(userID As Integer, message As String, isBroadcast As Boolean)
		  me.mControlSocket.SendMessage userID, message, isBroadcast
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SendNick(nick As String)
		  me.mControlSocket.SendNick nick
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SendPass(password As String)
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
		Sub SendStatus(status As String)
		  me.mControlSocket.SendStatus status
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ServerBannerReceived(serverBanner As Picture)
		  // Part of the NetWiredSocketInterface interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ServerInfoReceived(appVersion As String, protocolVersion As String, serverName As String, serverDescription As String, startTime As DateTime, filesCount As UInt64, filesSize As UInt64)
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
		Private Sub TransferQueued(path As String, position As Integer)
		  // Part of the NetWiredSocketInterface interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub TransferReady(path As String, offset As UInt64, hash As String)
		  // Part of the NetWiredSocketInterface interface.
		  
		  'ObjObserver.Notify self, 
		  
		  'me.mControlSocket.Transfer path, offset, hash
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateAccount(login As String, hashedPassword As String, group As String, getUserInfo As Boolean, broadcast As Boolean, postNews As Boolean, clearNews As Boolean, download As Boolean, upload As Boolean, uploadAnywhere As Boolean, createFolders As Boolean, alterFiles As Boolean, deleteFiles As Boolean, viewDropboxes As Boolean, createAccounts As Boolean, editAccounts As Boolean, deleteAccounts As Boolean, elevatePrivileges As Boolean, kickUsers As Boolean, banUsers As Boolean, cannotBeKicked As Boolean, downloadSpeed As UInt64, uploadSpeed As UInt64, downloadLimit As UInt64, uploadLimit As UInt64, changeTopic As Boolean)
		  me.mControlSocket.UpdateAccount login, hashedPassword, group, getUserInfo, broadcast, postNews, _
		  clearNews, download, upload, uploadAnywhere, createFolders, alterFiles, deleteFiles, viewDropboxes, _
		  createAccounts, editAccounts, deleteAccounts, elevatePrivileges, kickUsers, banUsers, cannotBeKicked, _
		  downloadSpeed, downloadLimit, uploadSpeed, uploadLimit, changeTopic
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateGroup(login As String, getUserInfo As Boolean, broadcast As Boolean, postNews As Boolean, clearNews As Boolean, download As Boolean, upload As Boolean, uploadAnywhere As Boolean, createFolders As Boolean, alterFiles As Boolean, deleteFiles As Boolean, viewDropboxes As Boolean, createAccounts As Boolean, editAccounts As Boolean, deleteAccounts As Boolean, elevatePrivileges As Boolean, kickUsers As Boolean, banUsers As Boolean, cannotBeKicked As Boolean, downloadSpeed As UInt64, uploadSpeed As UInt64, downloadLimit As UInt64, uploadLimit As UInt64, changeTopic As Boolean)
		  me.mControlSocket.UpdateGroup login, getUserInfo, broadcast, postNews, _
		  clearNews, download, upload, uploadAnywhere, createFolders, alterFiles, deleteFiles, viewDropboxes, _
		  createAccounts, editAccounts, deleteAccounts, elevatePrivileges, kickUsers, banUsers, cannotBeKicked, _
		  downloadSpeed, downloadLimit, uploadSpeed, uploadLimit, changeTopic
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UserChanged(userID As Integer, isIdle As Boolean, isAdmin As Boolean, nick As String, status As String)
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
		Private Sub UserInfoReceived(userID As Integer, isIdle As Boolean, isAdmin As Boolean, nick As String, login As String, IP As String, host As String, clientVersion As String, cipherName As String, cipherBits As Integer, loginTime As DateTime, idleTime As DateTime, downloads As String, uploads As String, status As String, icon As Picture)
		  // Part of the NetWiredSocketInterface interface.
		  
		  if (me.mUsersDict.HasKey(userID)) then
		    DIM user As WiredUser = me.mUsersDict.Value(userID)
		    ObjObserver.Notify me, Events.kWiredConnectionUserInfoReceived, user, isIdle, isAdmin, nick, login, IP, host, _
		    clientVersion, cipherName, cipherBits, loginTime, idleTime, downloads, uploads, status, icon
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UserJoined(chatID As Integer, userID As Integer, isIdle As Boolean, isAdmin As Boolean, nick As String, login As String, IP As String, host As String, status As String, icon As Picture)
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
		Private Sub UserKicked(victimID As Integer, killerID As Integer, message As String, isBan As Boolean)
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
		Private Sub UserListEntry(chatID As Integer, userID As Integer, isIdle As Boolean, isAdmin As Boolean, nick As String, login As String, IP As String, host As String, status As String, icon As Picture)
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
		Private mLogin As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMyUserID As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPassword As String
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
		Private mServerName As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mServerProtocolVersion As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mServerStartTime As DateTime
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTransfersDict As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mUploadLimit As UInt64
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mUploadSpeed As UInt64
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mUsersDict As Dictionary
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
		ServerName As String
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
		ServerStartTime As DateTime
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
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="CanBanUsers"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="CanBroadcast"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="CanChangeTopic"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="CanClearNews"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="CanCreateAccounts"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="CanCreateFolders"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="CanDeleteAccounts"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="CanDeleteFiles"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="CanDownload"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="CanEditAccounts"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="CanElevatePrivileges"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="CanGetUserInfo"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="CanKickUsers"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="CannotBeKicked"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="CanPostNews"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="CanUpload"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="CanUploadAnywhere"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="CanViewDropboxes"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DownloadLimit"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="UInt64"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DownloadSpeed"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="UInt64"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Handle"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsConnected"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
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
			Name="MyUserID"
			Visible=false
			Group="Behavior"
			InitialValue=""
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
			Name="ServerAddress"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ServerAppVersion"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ServerDescription"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ServerFilesCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="UInt64"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ServerFilesSize"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="UInt64"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ServerName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Text"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ServerProtocolVersion"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
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
			Name="UploadLimit"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="UInt64"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="UploadSpeed"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="UInt64"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
