#tag Class
Protected Class AdiumMessageViewer
Inherits HTMLViewer
	#tag Event
		Sub Close()
		  #if TargetCocoa OR TargetLinux
		    Xojo.Core.Timer.CancelCall WeakAddressOf ScrollChat
		  #endif
		End Sub
	#tag EndEvent

	#tag Event
		Sub DocumentComplete(URL as String)
		  #Pragma Unused URL
		  
		  
		  #if TargetCocoa
		    me.ExecuteJavaScript "document.body.style.fontFamily='Lucida Grande';"
		  #elseif TargetWindows
		    me.ExecuteJavaScript "document.body.style.fontFamily=""Segoe UI Emoji"", ""Segoe UI Symbol"";"
		  #endif
		  me.ExecuteJavaScript "document.body.style.fontSize='" + str(me.mDefaultFontSize) + "px';"
		  
		  me.ReloadChat
		  
		  RaiseEvent MessageStyleChanged
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AppendChat(time As Xojo.Core.Date, userID As Integer, nick As Text, icon As Picture, chat As Text, isChatIncoming As Boolean)
		  if (chat.Length > 4) AND ((chat.Left(4) <> "<img") OR (chat.Left(6) <> "<video")) then
		    DIM theRegex As RegEx = new RegEx
		    theRegex.Options.DotMatchAll = true
		    theRegex.Options.Greedy = True
		    theRegex.SearchPattern = "\b(https?://|www\.)([^<>\s]+)"
		    theRegex.ReplacementPattern = "<a href=""\1\2"">\1\2</a>\3"
		    theRegex.Options.ReplaceAllMatches = True
		    chat = theRegex.Replace(chat).ToText
		  end if
		  
		  DIM data As NEW Xojo.Core.Dictionary
		  data.Value("type") = "chat"
		  data.Value("time") = time
		  data.Value("userID") = userID
		  data.Value("nick") = me.Escape(nick)
		  data.Value("icon") = icon
		  data.Value("chat") = me.Escape(chat)
		  data.Value("isChatIncoming") = isChatIncoming
		  data.Value("isChatConsecutive") = (userID = me.mLastUserID)
		  
		  me.AppendDictionary data
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub AppendDictionary(data As Xojo.Core.Dictionary)
		  if (me.mChatItems.IndexOf(data) = -1) then
		    me.mChatItems.Append data
		  end if
		  
		  select case data.Value("type")
		  case "chat"
		    DIM envelope As Text = me.ContentEnvelope(data.Value("isChatConsecutive"), data.Value("isChatIncoming"))
		    
		    envelope = ReplaceNick(envelope, data.Value("nick"))
		    envelope = ReplaceIcon(envelope, data.Value("icon"))
		    envelope = ReplaceTime(envelope, data.Value("time"))
		    
		    envelope = envelope.ReplaceAll("%message%", data.Value("chat"))
		    envelope = envelope.ReplaceAll("%service%", "")
		    envelope = envelope.ReplaceAll("%status%", "")
		    
		    if (me.mMessageStyleVariantPath <> Nil) then
		      DIM variantName As Text = me.mMessageStyleVariantPath.Name
		      variantName = variantName.ReplaceAll(" ", "_")
		      envelope = envelope.ReplaceAll("%variant%", variantName)
		    end if
		    
		    DIM messageClasses As Text = "message " + if(data.Value("isChatIncoming"), "incoming", "outgoing")
		    if (data.Value("isChatConsecutive")) AND (NOT me.mDisableCombineConsecutive) then
		      messageClasses = messageClasses + " consecutive"
		      envelope = envelope.Replace("%messageClasses%", messageClasses)
		      me.ExecuteJavaScript "appendNextMessage('" + envelope + "');"
		    else
		      envelope = envelope.Replace("%messageClasses%", messageClasses)
		      me.ExecuteJavaScript "appendMessage('" + envelope + "');"
		    end if
		    
		    me.mLastUserID = data.Value("userID")
		    
		  else
		    DIM envelope As Text = me.mStatus
		    
		    envelope = ReplaceTime(envelope, data.Value("time"))
		    envelope = envelope.ReplaceAll("%message%", data.Value("message"))
		    envelope = envelope.ReplaceAll("%status%", data.Value("type"))
		    envelope = envelope.ReplaceAll("%service%", "")
		    envelope = envelope.ReplaceAll("%messageClasses%", "event")
		    envelope = envelope.ReplaceAll("%event%", data.Value("type"))
		    
		    if (me.mMessageStyleVariantPath <> Nil) then
		      DIM variantName As Text = me.mMessageStyleVariantPath.Name
		      variantName = variantName.ReplaceAll(" ", "_")
		      envelope = envelope.ReplaceAll("%variant%", variantName)
		    end if
		    
		    me.ExecuteJavaScript "appendMessage('" + envelope + "');"
		    me.mLastUserID = -1
		  end select
		  
		  
		  // only scroll the chat if macOS Monterey
		  #if TargetCocoa
		    if (me.SystemVersion = "10.0.0") OR (me.SystemVersion.Left(2) = "12") then
		      Xojo.Core.Timer.CancelCall WeakAddressOf ScrollChat
		      Xojo.Core.Timer.CallLater 100, WeakAddressOf ScrollChat
		    end if
		  #elseif TargetLinux
		    Xojo.Core.Timer.CancelCall WeakAddressOf ScrollChat
		    Xojo.Core.Timer.CallLater 100, WeakAddressOf ScrollChat
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AppendNotification(time As Xojo.Core.Date, type As Text, message As Text)
		  DIM data As NEW Xojo.Core.Dictionary
		  data.Value("type") = type
		  data.Value("time") = time
		  data.Value("message") = me.Escape(message)
		  
		  me.AppendDictionary data
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Clear()
		  REDIM me.mChatItems(-1)
		  me.mLastUserID = -1
		  me.LoadPage me.mTemplate, GetTemporaryFolderItem()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  me.Renderer = 1  // WebKit
		  me.mProperties = NEW Xojo.Core.Dictionary
		  
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ContentEnvelope(isChatConsecutive As Boolean, isChatIncoming As Boolean) As Text
		  DIM value As Integer = 0
		  
		  // incoming and consecutive
		  if (isChatConsecutive) AND (NOT me.mDisableCombineConsecutive) then
		    value = value + 1
		  end if
		  
		  // we sent the chat
		  if (NOT isChatIncoming) then
		    value = value + 2
		  end if
		  
		  // what envelope to return
		  DIM returnValue As Text
		  select case value
		  case 0  // incoming
		    returnValue = me.mIncomingContent
		  case 1  // incoming and consecutive
		    returnValue = me.mIncomingNextContent
		  case 2  // outgoing
		    returnValue = me.mOutgoingContent
		  case 3  // outgoing and consecutive
		    returnValue = me.mOutgoingNextContent
		  end select
		  
		  Return returnValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CreateFolderItems()
		  // me.mStylePath is populated in the Constructor
		  // me.mVariantPath is populated in the Constructor
		  
		  
		  // contents
		  me.mContentsFolder = me.mMessageStylePath.Child("Contents")
		  if (me.mContentsFolder = Nil) OR (NOT me.mContentsFolder.Exists) then
		    me.mContentsFolder = me.mMessageStylePath
		  end if
		  
		  // resources
		  me.mResourcesFolder = me.mContentsFolder.Child("Resources")
		  if (me.mResourcesFolder = Nil) OR (NOT me.mResourcesFolder.Exists) then
		    me.mResourcesFolder = me.mMessageStylePath.Child("Resources")
		  end if
		  if(me.mResourcesFolder = Nil) OR (NOT me.mResourcesFolder.Exists) then
		    me.mResourcesFolder = me.mMessageStylePath
		  end if
		  
		  // incoming
		  if (me.mResourcesFolder.Child("Incoming").Exists) then
		    me.mIncomingFolder = me.mResourcesFolder.Child("Incoming")
		  end if
		  
		  // outgoing
		  if (me.mResourcesFolder.Child("Outgoing").Exists) then
		    me.mOutgoingFolder = me.mResourcesFolder.Child("Outgoing")
		  end if
		  
		  // variants
		  if (me.mResourcesFolder.Child("Variants").Exists) then
		    me.mVariantsFolder = me.mResourcesFolder.Child("Variants")
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Escape(value As Text) As Text
		  value = value.ReplaceAll("\", "\\")   // slashes
		  value = value.ReplaceAll("""", "\""")  // quotes
		  value = value.ReplaceAll("'", "\'")     // apostrophes
		  value = value.ReplaceAll(Chr(9).ToText, "") // TAB
		  value = ReplaceLineEndings(value, "").ToText
		  
		  Return value
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub GrantAccessToFolder(inFolder as Xojo.IO.FolderItem)
		  #if (TargetMacOS) AND (XojoVersion >= 2020.01) then
		    // copied from https://forum.xojo.com/t/new-problem-with-htmlviewer-loadpage-since-version-2020-r1/56514/7
		    // --- Originally created in July 2020. <--- Leave this info here so it's easier to track which version of the code.
		    //     Published Sep 1st 2020.
		    //     written by Sam Rowlands of Ohanaware.com
		    //     Apple documentation for this API: https://developer.apple.com/documentation/webkit/wkwebview/1414973-loadfileurl?language=objc
		    
		    Declare Function NSClassFromString Lib "Foundation" (inClassName As CFStringRef) As Integer
		    Declare Function NSURLfileURLWithPathIsDirectory Lib "Foundation" Selector "fileURLWithPath:isDirectory:" (NSURLClass As Integer, path As CFStringRef, directory As Boolean) As Integer
		    Declare Function WKWebViewloadFileURL Lib "WebKit" Selector "loadFileURL:allowingReadAccessToURL:" (HTMLViewer As Integer, URL As Integer, readAccessURL As Integer) As Integer
		    
		    // --- Create a NSURL object from a Xojo Folderitem.
		    DIM folderURL As Integer = NSURLfileURLWithPathIsDirectory(NSClassFromString("NSURL"), inFolder.Path, inFolder.IsFolder)
		    
		    // --- This bit is not technically correct. The first parameter after the instance should actually be the page that you're trying to load.
		    //     But as we're not loading a page per say... For the purpose of just setting access rights, we ignore the return
		    //     value as we don't need to display progress.
		    Call WKWebViewloadFileURL(me.Handle, folderURL, folderURL)
		  #EndIf
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LoadDefaultVariant()
		  if (me.mMessageStyleVariantPath = Nil) then
		    if (me.mMessageViewVersion < 3) then  // view versions 0, 1 or 2
		      me.mMessageStyleVariantPath = me.mResourcesFolder.Child("main.css")
		    else
		      if (me.mDefaultVariant = "") OR (me.mVariantsFolder = Nil) OR (NOT me.mVariantsFolder.Exists) OR (NOT me.mVariantsFolder.Child(me.mDefaultVariant + ".css").Exists) then
		        me.mMessageStyleVariantPath = me.mResourcesFolder.Child("main.css")
		      else
		        me.mMessageStyleVariantPath = me.mVariantsFolder.Child(me.mDefaultVariant + ".css")
		      end if
		    end if
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LoadHtmlComponents()
		  // topic
		  if (me.mResourcesFolder.Child("Topic.html").Exists) then
		    me.mTopic = OpenAsText(me.mResourcesFolder.Child("Topic.html"))
		    me.mTopic = Escape(me.mTopic)
		  end if
		  
		  // status
		  if (me.mResourcesFolder.Child("Status.html").Exists) then
		    me.mStatus = OpenAsText(me.mResourcesFolder.Child("Status.html"))
		    me.mStatus = Escape(me.mStatus)
		  end if
		  
		  // incoming
		  if (me.mIncomingFolder <> Nil) AND (me.mIncomingFolder.Child("Content.html").Exists) then
		    me.mIncomingContent = OpenAsText(me.mIncomingFolder.Child("Content.html"))
		    me.mIncomingContent = Escape(me.mIncomingContent)
		  else
		    me.mIncomingContent = OpenAsText(me.mResourcesFolder.Child("Content.html"))
		    me.mIncomingContent = Escape(me.mIncomingContent)
		  end if
		  
		  // incoming next content
		  if (me.mIncomingFolder <> Nil) AND (me.mIncomingFolder.Child("NextContent.html").Exists) then
		    me.mIncomingNextContent = OpenAsText(me.mIncomingFolder.Child("NextContent.html"))
		    me.mIncomingNextContent = Escape(me.mIncomingNextContent)
		  else
		    me.mIncomingNextContent = me.mIncomingContent
		  end if
		  
		  // outgoing content
		  if (me.mOutgoingFolder <> Nil) AND (me.mOutgoingFolder.Child("Content.html").Exists) then
		    me.mOutgoingContent = OpenAsText(me.mOutgoingFolder.Child("Content.html"))
		    me.mOutgoingContent = Escape(me.mOutgoingContent)
		  else
		    me.mOutgoingContent = me.mIncomingContent
		  end if
		  
		  // outgoing next content
		  if (me.mOutgoingFolder <> Nil) AND (me.mOutgoingFolder.Child("NextContent.html").Exists) then
		    me.mOutgoingNextContent = OpenAsText(me.mOutgoingFolder.Child("NextContent.html"))
		    me.mOutgoingNextContent = Escape(me.mOutgoingNextContent)
		  else
		    if (me.mIncomingFolder <> Nil) AND (me.mIncomingFolder.Child("NextContent.html").Exists) then
		      me.mOutgoingNextContent = OpenAsText(me.mIncomingFolder.Child("NextContent.html"))
		      me.mOutgoingNextContent = Escape(me.mOutgoingNextContent)
		    else
		      me.mOutgoingNextContent = me.mOutgoingContent
		    end if
		  end if
		  
		  // header
		  if (me.mResourcesFolder.Child("Header.html").Exists) then
		    me.mHeader = OpenAsText(me.mResourcesFolder.Child("Header.html"))
		    me.mHeader = Escape(me.mHeader)
		  end if
		  
		  // footer
		  if (me.mResourcesFolder.Child("Footer.html").Exists) then
		    me.mFooter = OpenAsText(me.mResourcesFolder.Child("Footer.html"))
		    me.mFooter = Escape(me.mFooter)
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LoadHtmlTemplate()
		  me.mTemplate = me.kTemplate
		  
		  if (me.mResourcesFolder.Child("Template.html").Exists) then
		    me.mTemplate = OpenAsText(me.mResourcesFolder.Child("Template.html"))
		  end if
		  
		  // set the base href path
		  me.mTemplate = me.mTemplate.Replace("%@", me.mResourcesFolder.URLPath)
		  
		  // set the css
		  DIM templateCountFields() As Text = me.mTemplate.Split("%@")
		  
		  if (templateCountFields.Ubound() = 4) then
		    me.mTemplate = me.mTemplate.Replace("%@", if(me.mResourcesFolder.Child("main.css").Exists, "@import url(""main.css"");", ""))
		    me.mTemplate = me.mTemplate.Replace("%@", me.mMessageStyleVariantPath.URLPath)
		  else
		    me.mTemplate = me.mTemplate.Replace("%@", if(me.mMessageStyleVariantPath <> Nil AND me.mMessageStyleVariantPath.Name <> "main.css", "variants/" + me.mMessageStyleVariantPath.Name, "main.css"))
		  end if
		  me.mTemplate = me.mTemplate.Replace("%@", "")  // header
		  me.mTemplate = me.mTemplate.Replace("%@", "")  // footer
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function MessageStylePathFromVariant(path As Xojo.IO.FolderItem) As Xojo.IO.FolderItem
		  DIM value As Xojo.IO.FolderItem = path
		  
		  do until (value.Name = "Contents")
		    value = value.Parent
		  loop
		  
		  Return value
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function OpenAsText(path As Xojo.IO.FolderItem) As Text
		  DIM value As Text
		  
		  if (path <> Nil) AND (path.Exists) AND (NOT path.IsFolder) then
		    DIM stream As Xojo.IO.TextInputStream = Xojo.IO.TextInputStream.Open(path, Xojo.Core.TextEncoding.UTF8)
		    value = stream.ReadAll()
		    stream.Close()
		  end if
		  
		  Return value
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ParseInfoPlist()
		  DIM classicFolderItem As NEW FolderItem(me.mContentsFolder.Child("Info.plist").URLPath, FolderItem.PathTypeURL)
		  DIM infoDocument As NEW XmlDocument(classicFolderItem)
		  DIM documentNode As XmlNode = infoDocument.FirstChild.FirstChild
		  DIM childNode As XmlNode = documentNode.FirstChild
		  
		  while childNode <> Nil
		    DIM key As Text
		    
		    if (childNode.Name = "key") then
		      key = childNode.FirstChild.Value.ToText.Replace(" ", "")
		      childNode = childNode.NextSibling
		    end if
		    
		    if (childNode.FirstChild <> Nil) then
		      if (childNode.Name = "true") OR (childNode.Name = "false") then
		        if (key = "MessageViewVersion") then
		          me.mProperties.Value(key) = 1
		        else
		          me.mProperties.Value(key) = (childNode.Name = "true")
		        end if
		      elseif (childNode.Name = "integer") then
		        me.mProperties.Value(key) = Integer.FromText(childNode.FirstChild.Value.ToText)
		      elseif (childNode.Name = "real") then
		        me.mProperties.Value(key) = Integer.FromText(childNode.FirstChild.Value.ToText.Left(1))
		      else
		        if (key = "DefaultFontSize") OR (key = "MessageViewVersion") then
		          me.mProperties.Value(key) = Integer.FromText(childNode.FirstChild.Value.ToText)
		        else
		          me.mProperties.Value(key) = childNode.FirstChild.Value.ToText
		        end if
		      end if
		    end if
		    
		    childNode = childNode.NextSibling
		  wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ReloadChat()
		  me.mLastUserID = -1
		  
		  if (UBound(me.mChatItems) > -1) then
		    for i as Integer = 0 to UBound(me.mChatItems)
		      me.AppendDictionary me.mChatItems(i)
		    next
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ReplaceIcon(envelope As Text, icon As Picture) As Text
		  // convert the icon to string
		  DIM iconAsString As String
		  if (icon <> Nil) then
		    DIM aMemoryBlock As MemoryBlock = icon.GetData(Picture.FormatPNG)
		    iconAsString = "data:image/png;base64," + EncodeBase64(aMemoryBlock, 0)
		  end if
		  
		  // add the icon to the envelope
		  envelope = envelope.ReplaceAll("%userIconPath%", iconAsString.ToText)
		  envelope = envelope.ReplaceAll("%senderStatusIcon%", iconAsString.ToText)
		  
		  Return envelope
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ReplaceNick(envelope As Text, nick As Text) As Text
		  DIM value As Text = envelope
		  
		  value = value.ReplaceAll("%senderScreenName%", nick)
		  value = value.ReplaceAll("%sender%", nick)
		  value = value.ReplaceAll("%senderDisplayName%", nick)
		  
		  Return value
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ReplaceTime(envelope As Text, time As Xojo.Core.Date) As Text
		  if (time <> Nil) then
		    envelope = envelope.ReplaceAll("%time%", time.ToText(Xojo.Core.Locale.Current, Xojo.Core.Date.FormatStyles.None, Xojo.Core.Date.FormatStyles.Medium))
		    envelope = envelope.ReplaceAll("%shortTime%", time.ToText(Xojo.Core.Locale.Current, Xojo.Core.Date.FormatStyles.None, Xojo.Core.Date.FormatStyles.Short))
		    
		    DIM aRegExOptions As NEW RegExOptions
		    aRegExOptions.Greedy = FALSE
		    
		    DIM aRegEx As NEW RegEx
		    aRegEx.SearchPattern = "\%time{(.*)}\%"
		    aRegEx.Options = aRegExOptions
		    
		    DIM match As RegExMatch
		    match = aRegEx.Search(envelope)
		    if (match <> Nil) then
		      do
		        #if TargetCocoa
		          Declare Function Alloc Lib "Cocoa" Selector "alloc" (inClass As Ptr) As Ptr
		          Declare Function Init Lib "Cocoa" Selector "init" (inClass As Ptr) As Ptr
		          Declare Function NSClassFromString Lib "Cocoa" (className As CFStringRef) As Ptr
		          Declare Function DateWithTimeIntervalSince1970 Lib "Cocoa" Selector "dateWithTimeIntervalSince1970:" (classRef As Ptr, seconds As Double) As Ptr
		          Declare Function StringFromDate Lib "Cocoa" Selector "stringFromDate:" (inNSDateFormatter As Ptr, inNSDate As Ptr) As CFStringRef
		          Declare Sub SetDateFormat Lib "Cocoa" Selector "setDateFormat:" (inNSDateFormatter As Ptr, formatString As CFStringRef)
		          
		          DIM NSDateClass As Ptr = NSClassFromString("NSDate")
		          DIM aNSDate As Ptr = DateWithTimeIntervalSince1970(NSDateClass, time.SecondsFrom1970)
		          
		          DIM dateFormatterString As Text = match.SubExpressionString(1).ReplaceAll("%", "").ToText
		          DIM NSDateFormatterClass As Ptr = Init(Alloc(NSClassFromString("NSDateFormatter")))
		          SetDateFormat NSDateFormatterClass, dateFormatterString
		          
		          DIM findText As Text = match.SubExpressionString(0).ToText
		          DIM replacementText As Text = StringFromDate(NSDateFormatterClass, aNSDate)
		          envelope = envelope.ReplaceAll(findText, replacementText)
		        #endif
		        
		        match = aRegEx.Search
		      loop until match is Nil
		    end if
		  end if
		  
		  Return envelope
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Reset()
		  // reset the folder items
		  me.mContentsFolder = Nil
		  me.mResourcesFolder = Nil
		  me.mIncomingFolder = Nil
		  me.mOutgoingFolder = Nil
		  me.mVariantsFolder = Nil
		  me.mMessageStylePath = Nil
		  me.mMessageStyleVariantPath = Nil
		  me.mPath = Nil
		  me.mVariantsFolder = Nil
		  
		  me.mFooter = ""
		  me.mHeader = ""
		  me.mIncomingNextContent = ""
		  me.mOutgoingContent = ""
		  me.mOutgoingNextContent = ""
		  me.mStatus = ""
		  me.mTemplate = ""
		  me.mTopic = ""
		  
		  me.mProperties = NEW Xojo.Core.Dictionary
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ScrollChat()
		  me.ExecuteJavaScript "window.scrollTo(0, document.body.scrollHeight + 20);"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function SystemVersion() As Text
		  Dim noerror As Boolean
		  Dim result As Integer
		  Dim sver As Text
		  Dim sversion As Text
		  
		  noerror=System.Gestalt("sysv",result)
		  If noerror Then
		    sver=Hex(result).ToText
		    sversion= sver.Left(2) + "." + sver.Mid(3,1) + "." + sver.Right(1)
		  End If
		  
		  Return sversion
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event MessageStyleChanged()
	#tag EndHook


	#tag Note, Name = 2.0.0
		
		2018-01-26
		• removed the check for the .AdiumMessageStyle file extension
		• moved out of the FreeLibs module/namespace (this allows it to be used as external code)
		
	#tag EndNote

	#tag Note, Name = UNLICENSE
		
		This is free and unencumbered software released into the public domain.
		
		Anyone is free to copy, modify, publish, use, compile, sell, or
		distribute this software, either in source code form or as a compiled
		binary, for any purpose, commercial or non-commercial, and by any
		means.
		
		In jurisdictions that recognize copyright laws, the author or authors
		of this software dedicate any and all copyright interest in the
		software to the public domain. We make this dedication for the benefit
		of the public at large and to the detriment of our heirs and
		successors. We intend this dedication to be an overt act of
		relinquishment in perpetuity of all present and future rights to this
		software under copyright law.
		
		THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
		EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
		MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
		IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
		OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
		ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
		OTHER DEALINGS IN THE SOFTWARE.
		
		For more information, please refer to <http://unlicense.org>
	#tag EndNote


	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  Return me.mProperties.Lookup("CFBundleIdentifier", "")
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #Pragma Unused value
			End Set
		#tag EndSetter
		Private mCFBundleIdentifier As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  Return me.mProperties.Lookup("CFBundleName", "")
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #Pragma Unused value
			End Set
		#tag EndSetter
		Private mCFBundleName As Text
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mChatItems() As Xojo.Core.Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mContentsFolder As Xojo.IO.FolderItem
	#tag EndProperty

	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  Return me.mProperties.Lookup("DefaultFontFamily", "System")
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #Pragma Unused value
			End Set
		#tag EndSetter
		Private mDefaultFontFamily As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  Return me.mProperties.Lookup("DefaultFontSize", 12)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #Pragma Unused value
			End Set
		#tag EndSetter
		Private mDefaultFontSize As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  Return me.mProperties.Lookup("DefaultVariant", "")
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #Pragma Unused value
			End Set
		#tag EndSetter
		Private mDefaultVariant As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  Return me.mProperties.Lookup("DisableCombineConsecutive", FALSE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #Pragma Unused value
			End Set
		#tag EndSetter
		Private mDisableCombineConsecutive As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  Return me.mProperties.Lookup("DisableCustomBackground", FALSE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #Pragma Unused value
			End Set
		#tag EndSetter
		Private mDisableCustomBackground As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  Return me.mProperties.Lookup("DisplayNameForNoVariant", "Default")
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #Pragma Unused value
			End Set
		#tag EndSetter
		Private mDisplayNameForNoVariant As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return if(me.mMessageStyleVariantPath = Nil, me.mMessageStylePath, me.mMessageStyleVariantPath)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  if (value <> Nil) AND (value.Exists) then
			    me.Reset
			    
			    me.mMessageStylePath = value
			    me.mMessageStyleVariantPath = Nil
			    
			    if (value.Name.Right(4) = ".css") then
			      me.mMessageStylePath = me.MessageStylePathFromVariant(value)
			      me.mMessageStyleVariantPath = value
			    end if
			    
			    me.CreateFolderItems
			    me.ParseInfoPlist
			    me.LoadDefaultVariant
			    me.LoadHtmlTemplate
			    me.LoadHtmlComponents
			    
			    me.GrantAccessToFolder me.mMessageStylePath
			    me.LoadPage me.mTemplate, GetTemporaryFolderItem()
			  end if
			End Set
		#tag EndSetter
		MessageStylePath As Xojo.IO.FolderItem
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mFooter As Text
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mHeader As Text
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mIncomingContent As Text
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mIncomingFolder As Xojo.IO.FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mIncomingNextContent As Text
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLastUserID As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			populated in the Constructor
		#tag EndNote
		Private mMessageStylePath As Xojo.IO.FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			populated in the Constructor
		#tag EndNote
		Private mMessageStyleVariantPath As Xojo.IO.FolderItem
	#tag EndProperty

	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  Return me.mProperties.Lookup("MessageViewVersion", 1)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #Pragma Unused value
			End Set
		#tag EndSetter
		Private mMessageViewVersion As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mOutgoingContent As Text
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mOutgoingFolder As Xojo.IO.FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mOutgoingNextContent As Text
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPath As Xojo.IO.FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mProperties As Xojo.Core.Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mResourcesFolder As Xojo.IO.FolderItem
	#tag EndProperty

	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  Return me.mProperties.Lookup("ShowUserIcons", TRUE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #Pragma Unused value
			End Set
		#tag EndSetter
		Private mShowUserIcons As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mStatus As Text
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTemplate As Text
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTopic As Text
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mVariantsFolder As Xojo.IO.FolderItem
	#tag EndProperty


	#tag Constant, Name = ContactJoined, Type = Text, Dynamic = False, Default = \"contact_joined", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ContactKicked, Type = Text, Dynamic = False, Default = \"contact_kicked", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ContactLeft, Type = Text, Dynamic = False, Default = \"contact_left", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kTemplate, Type = Text, Dynamic = False, Default = \"<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01//EN\" \"http://www.w3.org/TR/html4/strict.dtd\">\n<html>\n<head>\n\t<meta http-equiv\x3D\"content-type\" content\x3D\"text/html; charset\x3Dutf-8\" />\n\t<base href\x3D\"%@\">\n\t<script type\x3D\"text/javascript\" defer\x3D\"defer\">\n\t\t// NOTE:\n\t\t// Any percent signs in this file must be escaped!\n\t\t// Use two escape signs (%%) to display it\x2C this is passed through a format call!\n\t\t\n\t\tfunction appendHTML(html) {\n\t\t\tvar node \x3D document.getElementById(\"Chat\");\n\t\t\tvar range \x3D document.createRange();\n\t\t\trange.selectNode(node);\n\t\t\tvar documentFragment \x3D range.createContextualFragment(html);\n\t\t\tnode.appendChild(documentFragment);\n\t\t}\n\n\t\t// a coalesced HTML object buffers and outputs DOM objects en masse.\n\t\t// saves A LOT of CSS recalculation time when loading many messages.\n\t\t// (ex. a long twitter timeline)\n\t\tfunction CoalescedHTML() {\n\t\t\tvar self \x3D this;\n\t\t\tthis.fragment \x3D document.createDocumentFragment();\n\t\t\tthis.timeoutID \x3D 0;\n\t\t\tthis.coalesceRounds \x3D 0;\n\t\t\tthis.isCoalescing \x3D false;\n\t\t\tthis.isConsecutive \x3D undefined;\n\t\t\tthis.shouldScroll \x3D undefined;\n\n\t\t\tvar appendElement \x3D function (elem) {\n\t\t\t\tdocument.getElementById(\"Chat\").appendChild(elem);\n\t\t\t};\n\n\t\t\tfunction outputHTML() {\n\t\t\t\tvar insert \x3D document.getElementById(\"insert\");\n\t\t\t\tif(!!insert && self.isConsecutive) {\n\t\t\t\t\tinsert.parentNode.replaceChild(self.fragment\x2C insert);\n\t\t\t\t} else {\n\t\t\t\t\tif(insert)\n\t\t\t\t\t\tinsert.parentNode.removeChild(insert);\n\t\t\t\t\t// insert the documentFragment into the live DOM\n\t\t\t\t\tappendElement(self.fragment);\n\t\t\t\t}\n\t\t\t\talignChat(self.shouldScroll);\n\n\t\t\t\t// reset state to empty/non-coalescing\n\t\t\t\tself.shouldScroll \x3D undefined;\n\t\t\t\tself.isConsecutive \x3D undefined;\n\t\t\t\tself.isCoalescing \x3D false;\n\t\t\t\tself.coalesceRounds \x3D 0;\n\t\t\t}\n\n\t\t\t// creates and returns a new documentFragment\x2C containing all content nodes\n\t\t\t// which can be inserted as a single node.\n\t\t\tfunction createHTMLNode(html) {\n\t\t\t\tvar range \x3D document.createRange();\n\t\t\t\trange.selectNode(document.getElementById(\"Chat\"));\n\t\t\t\treturn range.createContextualFragment(html);\n\t\t\t}\n\n\t\t\t// removes first insert node from the internal fragment.\n\t\t\tfunction rmInsertNode() {\n\t\t\t\tvar insert \x3D self.fragment.querySelector(\"#insert\");\n\t\t\t\tif(insert)\n\t\t\t\t\tinsert.parentNode.removeChild(insert);\n\t\t\t}\n\n\t\t\tfunction setShouldScroll(flag) {\n\t\t\t\tif(flag && undefined \x3D\x3D\x3D self.shouldScroll)\n\t\t\t\t\tself.shouldScroll \x3D flag;\n\t\t\t}\n\n\t\t\t// hook in a custom method to append new data\n\t\t\t// to the chat.\n\t\t\tthis.setAppendElementMethod \x3D function (func) {\n\t\t\t\tif(typeof func \x3D\x3D\x3D \'function\')\n\t\t\t\t\tappendElement \x3D func;\n\t\t\t}\n\n\t\t\t// (re)start the coalescing timer.\n\t\t\t//   we wait 25ms for a new message to come in.\n\t\t\t//   If we get one\x2C restart the timer and wait another 10ms.\n\t\t\t//   If not\x2C run outputHTML()\n\t\t\t//  We do this a maximum of 400 times\x2C for 10s max that can be spent\n\t\t\t//  coalescing input\x2C since this will block display.\n\t\t\tthis.coalesce \x3D function() {\n\t\t\t\twindow.clearTimeout(self.timeoutID);\n\t\t\t\tself.timeoutID \x3D window.setTimeout(outputHTML\x2C 25);\n\t\t\t\tself.isCoalescing \x3D true;\n\t\t\t\tself.coalesceRounds +\x3D 1;\n\t\t\t\tif(400 < self.coalesceRounds)\n\t\t\t\t\tself.cancel();\n\t\t\t}\n\n\t\t\t// if we need to append content into an insertion div\x2C\n\t\t\t// we need to clear the buffer and cancel the timeout.\n\t\t\tthis.cancel \x3D function() {\n\t\t\t\tif(self.isCoalescing) {\n\t\t\t\t\twindow.clearTimeout(self.timeoutID);\n\t\t\t\t\toutputHTML();\n\t\t\t\t}\n\t\t\t}\n\n\n\t\t\t// coalased analogs to the global functions\n\n\t\t\tthis.append \x3D function(html\x2C shouldScroll) {\n\t\t\t\t// if we started this fragment with a consecuative message\x2C\n\t\t\t\t// cancel and output before we continue\n\t\t\t\tif(self.isConsecutive) {\n\t\t\t\t\tself.cancel();\n\t\t\t\t}\n\t\t\t\tself.isConsecutive \x3D false;\n\t\t\t\trmInsertNode();\n\t\t\t\tvar node \x3D createHTMLNode(html);\n\t\t\t\tself.fragment.appendChild(node);\n\n\t\t\t\tnode \x3D null;\n\n\t\t\t\tsetShouldScroll(shouldScroll);\n\t\t\t\tself.coalesce();\n\t\t\t}\n\n\t\t\tthis.appendNext \x3D function(html\x2C shouldScroll) {\n\t\t\t\tif(undefined \x3D\x3D\x3D self.isConsecutive)\n\t\t\t\t\tself.isConsecutive \x3D true;\n\t\t\t\tvar node \x3D createHTMLNode(html);\n\t\t\t\tvar insert \x3D self.fragment.querySelector(\"#insert\");\n\t\t\t\tif(insert) {\n\t\t\t\t\tinsert.parentNode.replaceChild(node\x2C insert);\n\t\t\t\t} else {\n\t\t\t\t\tself.fragment.appendChild(node);\n\t\t\t\t}\n\t\t\t\tnode \x3D null;\n\t\t\t\tsetShouldScroll(shouldScroll);\n\t\t\t\tself.coalesce();\n\t\t\t}\n\n\t\t\tthis.replaceLast \x3D function (html\x2C shouldScroll) {\n\t\t\t\trmInsertNode();\n\t\t\t\tvar node \x3D createHTMLNode(html);\n\t\t\t\tvar lastMessage \x3D self.fragment.lastChild;\n\t\t\t\tlastMessage.parentNode.replaceChild(node\x2C lastMessage);\n\t\t\t\tnode \x3D null;\n\t\t\t\tsetShouldScroll(shouldScroll);\n\t\t\t}\n\t\t}\n\t\tvar coalescedHTML;\n\n\t\t//Appending new content to the message view\n\t\tfunction appendMessage(html) {\n\t\t\tvar shouldScroll;\n\n\t\t\t// Only call nearBottom() if should scroll is undefined.\n\t\t\tif(undefined \x3D\x3D\x3D coalescedHTML.shouldScroll) {\n\t\t\t\tshouldScroll \x3D nearBottom();\n\t\t\t} else {\n\t\t\t\tshouldScroll \x3D coalescedHTML.shouldScroll;\n\t\t\t}\n\t\t\tappendMessageNoScroll(html\x2C shouldScroll);\n\t\t}\n\n\t\tfunction appendMessageNoScroll(html\x2C shouldScroll) {\n\t\t\tshouldScroll \x3D shouldScroll || false;\n\t\t\t// always try to coalesce new\x2C non-griuped\x2C messages\n\t\t\tcoalescedHTML.append(html\x2C shouldScroll)\n\t\t}\n\n\t\tfunction appendNextMessage(html){\n\t\t\tvar shouldScroll;\n\t\t\tif(undefined \x3D\x3D\x3D coalescedHTML.shouldScroll) {\n\t\t\t\tshouldScroll \x3D nearBottom();\n\t\t\t} else {\n\t\t\t\tshouldScroll \x3D coalescedHTML.shouldScroll;\n\t\t\t}\n\t\t\tappendNextMessageNoScroll(html\x2C shouldScroll);\n\t\t}\n\n\t\tfunction appendNextMessageNoScroll(html\x2C shouldScroll){\n\t\t\tshouldScroll \x3D shouldScroll || false;\n\t\t\t// only group next messages if we\'re already coalescing input\n\t\t\tcoalescedHTML.appendNext(html\x2C shouldScroll);\n\t\t}\n\n\t\tfunction replaceLastMessage(html){\n\t\t\tvar shouldScroll;\n\t\t\t// only replace messages if we\'re already coalescing\n\t\t\tif(coalescedHTML.isCoalescing){\n\t\t\t\tif(undefined \x3D\x3D\x3D coalescedHTML.shouldScroll) {\n\t\t\t\t\tshouldScroll \x3D nearBottom();\n\t\t\t\t} else {\n\t\t\t\t\tshouldScroll \x3D coalescedHTML.shouldScroll;\n\t\t\t\t}\n\t\t\t\tcoalescedHTML.replaceLast(html\x2C shouldScroll);\n\t\t\t} else {\n\t\t\t\tshouldScroll \x3D nearBottom();\n\t\t\t\t//Retrieve the current insertion point\x2C then remove it\n\t\t\t\t//This requires that there have been an insertion point... is there a better way to retrieve the last element\? -evands\n\t\t\t\tvar insert \x3D document.getElementById(\"insert\");\n\t\t\t\tif(insert){\n\t\t\t\t\tvar parentNode \x3D insert.parentNode;\n\t\t\t\t\tparentNode.removeChild(insert);\n\t\t\t\t\tvar lastMessage \x3D document.getElementById(\"Chat\").lastChild;\n\t\t\t\t\tdocument.getElementById(\"Chat\").removeChild(lastMessage);\n\t\t\t\t}\n\n\t\t\t\t//Now append the message itself\n\t\t\t\tappendHTML(html);\n\n\t\t\t\talignChat(shouldScroll);\n\t\t\t}\n\t\t}\n\n\t\t//Auto-scroll to bottom.  Use nearBottom to determine if a scrollToBottom is desired.\n\t\tfunction nearBottom() {\n\t\t\treturn ( document.body.scrollTop >\x3D ( document.body.offsetHeight - ( window.innerHeight * 1.2 ) ) );\n\t\t}\n\t\tfunction scrollToBottom() {\n\t\t\tdocument.body.scrollTop \x3D document.body.offsetHeight;\n\t\t}\n\n\t\t//Dynamically exchange the active stylesheet\n\t\tfunction setStylesheet( id\x2C url ) {\n\t\t\tvar code \x3D \"<style id\x3D\\\"\" + id + \"\\\" type\x3D\\\"text/css\\\" media\x3D\\\"screen\x2Cprint\\\">\";\n\t\t\tif( url.length )\n\t\t\t\tcode +\x3D \"@import url( \\\"\" + url + \"\\\" );\";\n\t\t\tcode +\x3D \"</style>\";\n\t\t\tvar range \x3D document.createRange();\n\t\t\tvar head \x3D document.getElementsByTagName( \"head\" ).item(0);\n\t\t\trange.selectNode( head );\n\t\t\tvar documentFragment \x3D range.createContextualFragment( code );\n\t\t\thead.removeChild( document.getElementById( id ) );\n\t\t\thead.appendChild( documentFragment );\n\t\t}\n\n\t\t/* Converts emoticon images to textual emoticons; all emoticons in message if alt is held */\n\t\tdocument.onclick \x3D function imageCheck() {\n\t\t\tvar node \x3D event.target;\n\t\t\tif (node.tagName.toLowerCase() !\x3D \'img\')\n\t\t\t\treturn;\n\n\t\t\timageSwap(node\x2C false);\n\t\t}\n\n\t\t/* Converts textual emoticons to images if textToImagesFlag is true\x2C otherwise vice versa */\n\t\tfunction imageSwap(node\x2C textToImagesFlag) {\n\t\t\tvar shouldScroll \x3D nearBottom();\n\n\t\t\tvar images \x3D [node];\n\t\t\tif (event.altKey) {\n\t\t\t\twhile (node.id !\x3D \"Chat\" && node.parentNode.id !\x3D \"Chat\")\n\t\t\t\t\tnode \x3D node.parentNode;\n\t\t\t\timages \x3D node.querySelectorAll(textToImagesFlag \? \"a\" : \"img\");\n\t\t\t}\n\n\t\t\tfor (var i \x3D 0; i < images.length; i++) {\n\t\t\t\ttextToImagesFlag \? textToImage(images[i]) : imageToText(images[i]);\n\t\t\t}\n\n\t\t\talignChat(shouldScroll);\n\t\t}\n\n\t\tfunction textToImage(node) {\n\t\t\tif (!node.getAttribute(\"isEmoticon\"))\n\t\t\t\treturn;\n\t\t\t//Swap the image/text\n\t\t\tvar img \x3D document.createElement(\'img\');\n\t\t\timg.setAttribute(\'src\'\x2C node.getAttribute(\'src\'));\n\t\t\timg.setAttribute(\'alt\'\x2C node.firstChild.nodeValue);\n\t\t\timg.setAttribute(\'width\'\x2C node.getAttribute(\'width\'));\n\t\t\timg.setAttribute(\'height\'\x2C node.getAttribute(\'height\'));\n\t\t\timg.className \x3D node.className;\n\t\t\tnode.parentNode.replaceChild(img\x2C node);\n\t\t}\n\n\t\tfunction imageToText(node)\n\t\t{\n\t\t\tif (client.zoomImage(node) || !node.alt)\n\t\t\t\treturn;\n\t\t\tvar a \x3D document.createElement(\'a\');\n\t\t\ta.setAttribute(\'onclick\'\x2C \'imageSwap(this\x2C true)\');\n\t\t\ta.setAttribute(\'src\'\x2C node.getAttribute(\'src\'));\n\t\t\ta.setAttribute(\'isEmoticon\'\x2C true);\n\t\t\ta.setAttribute(\'width\'\x2C node.getAttribute(\'width\'));\n\t\t\ta.setAttribute(\'height\'\x2C node.getAttribute(\'height\'));\n\t\t\ta.className \x3D node.className;\n\t\t\tvar text \x3D document.createTextNode(node.alt);\n\t\t\ta.appendChild(text);\n\t\t\tnode.parentNode.replaceChild(a\x2C node);\n\t\t}\n\n\t\t//Align our chat to the bottom of the window.  If true is passed\x2C view will also be scrolled down\n\t\tfunction alignChat(shouldScroll) {\n\t\t\tvar windowHeight \x3D window.innerHeight;\n\n\t\t\tif (windowHeight > 0) {\n\t\t\t\tvar contentElement \x3D document.getElementById(\'Chat\');\n\t\t\t\tvar heightDifference \x3D (windowHeight - contentElement.offsetHeight);\n\t\t\t\tif (heightDifference > 0) {\n\t\t\t\t\tcontentElement.style.position \x3D \'relative\';\n\t\t\t\t\tcontentElement.style.top \x3D heightDifference + \'px\';\n\t\t\t\t} else {\n\t\t\t\t\tcontentElement.style.position \x3D \'static\';\n\t\t\t\t}\n\t\t\t}\n\n\t\t\tif (shouldScroll) scrollToBottom();\n\t\t}\n\n\t\twindow.onresize \x3D function windowDidResize(){\n\t\t\talignChat(true/*nearBottom()*/); //nearBottom buggy with inactive tabs\n\t\t}\n\n\t\tfunction initStyle() {\n\t\t\talignChat(true);\n\t\t\tif(!coalescedHTML)\n\t\t\t\tcoalescedHTML \x3D new CoalescedHTML();\n\t\t}\n\t</script>\n\n\t<style type\x3D\"text/css\">\n\t\t.actionMessageUserName { display:none; }\n\t\t.actionMessageBody:before { content:\"*\"; }\n\t\t.actionMessageBody:after { content:\"*\"; }\n\t\t* { word-wrap:break-word; text-rendering: optimizelegibility; }\n\t\timg.scaledToFitImage { height: auto; max-width: 100%%; }\n\t</style>\n\n\t<!-- This style is shared by all variants. !-->\n\t<style id\x3D\"baseStyle\" type\x3D\"text/css\" media\x3D\"screen\x2Cprint\">\n\t\t%@\n\t</style>\n\n\t<!-- Although we call this mainStyle for legacy reasons\x2C it\'s actually the variant style !-->\n\t<style id\x3D\"mainStyle\" type\x3D\"text/css\" media\x3D\"screen\x2Cprint\">\n\t\t@import url( \"%@\" );\n\t</style>\n\n<style id\x3D\"imageConstrain\" type\x3D\"text/css\" media\x3D\"screen\x2Cprint\">\n\t.swirlImage {\n\t\tmax-width: 500px;\n\t\tmin-height: 120px;\n\t\tmax-height: auto;\n\t}\n</style>\n\n</head>\n<body onload\x3D\"initStyle();\" style\x3D\"\x3D\x3DbodyBackground\x3D\x3D\" oncontextmenu\x3D\"return false;\">\n%@\n<div id\x3D\"Chat\">\n</div>\n%@\n</body>\n</html>", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kTemplate1, Type = Text, Dynamic = False, Default = \"<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01//EN\" \"http://www.w3.org/TR/html4/strict.dtd\">\n<html>\n<head>\n\t<meta http-equiv\x3D\"content-type\" content\x3D\"text/html; charset\x3Dutf-8\" />\n\t<base href\x3D\"%@\">\n\t<script type\x3D\"text/javascript\" defer\x3D\"defer\">\n\t\t// NOTE:\n\t\t// Any percent signs in this file must be escaped!\n\t\t// Use two escape signs (%%) to display it\x2C this is passed through a format call!\n\t\t\n\t\tfunction appendHTML(html) {\n\t\t\tvar node \x3D document.getElementById(\"Chat\");\n\t\t\tvar range \x3D document.createRange();\n\t\t\trange.selectNode(node);\n\t\t\tvar documentFragment \x3D range.createContextualFragment(html);\n\t\t\tnode.appendChild(documentFragment);\n\t\t}\n\n\t\t// a coalesced HTML object buffers and outputs DOM objects en masse.\n\t\t// saves A LOT of CSS recalculation time when loading many messages.\n\t\t// (ex. a long twitter timeline)\n\t\tfunction CoalescedHTML() {\n\t\t\tvar self \x3D this;\n\t\t\tthis.fragment \x3D document.createDocumentFragment();\n\t\t\tthis.timeoutID \x3D 0;\n\t\t\tthis.coalesceRounds \x3D 0;\n\t\t\tthis.isCoalescing \x3D false;\n\t\t\tthis.isConsecutive \x3D undefined;\n\t\t\tthis.shouldScroll \x3D undefined;\n\n\t\t\tvar appendElement \x3D function (elem) {\n\t\t\t\tdocument.getElementById(\"Chat\").appendChild(elem);\n\t\t\t};\n\n\t\t\tfunction outputHTML() {\n\t\t\t\tvar insert \x3D document.getElementById(\"insert\");\n\t\t\t\tif(!!insert && self.isConsecutive) {\n\t\t\t\t\tinsert.parentNode.replaceChild(self.fragment\x2C insert);\n\t\t\t\t} else {\n\t\t\t\t\tif(insert)\n\t\t\t\t\t\tinsert.parentNode.removeChild(insert);\n\t\t\t\t\t// insert the documentFragment into the live DOM\n\t\t\t\t\tappendElement(self.fragment);\n\t\t\t\t}\n\t\t\t\talignChat(self.shouldScroll);\n\n\t\t\t\t// reset state to empty/non-coalescing\n\t\t\t\tself.shouldScroll \x3D undefined;\n\t\t\t\tself.isConsecutive \x3D undefined;\n\t\t\t\tself.isCoalescing \x3D false;\n\t\t\t\tself.coalesceRounds \x3D 0;\n\t\t\t}\n\n\t\t\t// creates and returns a new documentFragment\x2C containing all content nodes\n\t\t\t// which can be inserted as a single node.\n\t\t\tfunction createHTMLNode(html) {\n\t\t\t\tvar range \x3D document.createRange();\n\t\t\t\trange.selectNode(document.getElementById(\"Chat\"));\n\t\t\t\treturn range.createContextualFragment(html);\n\t\t\t}\n\n\t\t\t// removes first insert node from the internal fragment.\n\t\t\tfunction rmInsertNode() {\n\t\t\t\tvar insert \x3D self.fragment.querySelector(\"#insert\");\n\t\t\t\tif(insert)\n\t\t\t\t\tinsert.parentNode.removeChild(insert);\n\t\t\t}\n\n\t\t\tfunction setShouldScroll(flag) {\n\t\t\t\tif(flag && undefined \x3D\x3D\x3D self.shouldScroll)\n\t\t\t\t\tself.shouldScroll \x3D flag;\n\t\t\t}\n\n\t\t\t// hook in a custom method to append new data\n\t\t\t// to the chat.\n\t\t\tthis.setAppendElementMethod \x3D function (func) {\n\t\t\t\tif(typeof func \x3D\x3D\x3D \'function\')\n\t\t\t\t\tappendElement \x3D func;\n\t\t\t}\n\n\t\t\t// (re)start the coalescing timer.\n\t\t\t//   we wait 25ms for a new message to come in.\n\t\t\t//   If we get one\x2C restart the timer and wait another 10ms.\n\t\t\t//   If not\x2C run outputHTML()\n\t\t\t//  We do this a maximum of 400 times\x2C for 10s max that can be spent\n\t\t\t//  coalescing input\x2C since this will block display.\n\t\t\tthis.coalesce \x3D function() {\n\t\t\t\twindow.clearTimeout(self.timeoutID);\n\t\t\t\tself.timeoutID \x3D window.setTimeout(outputHTML\x2C 25);\n\t\t\t\tself.isCoalescing \x3D true;\n\t\t\t\tself.coalesceRounds +\x3D 1;\n\t\t\t\tif(400 < self.coalesceRounds)\n\t\t\t\t\tself.cancel();\n\t\t\t}\n\n\t\t\t// if we need to append content into an insertion div\x2C\n\t\t\t// we need to clear the buffer and cancel the timeout.\n\t\t\tthis.cancel \x3D function() {\n\t\t\t\tif(self.isCoalescing) {\n\t\t\t\t\twindow.clearTimeout(self.timeoutID);\n\t\t\t\t\toutputHTML();\n\t\t\t\t}\n\t\t\t}\n\n\n\t\t\t// coalased analogs to the global functions\n\n\t\t\tthis.append \x3D function(html\x2C shouldScroll) {\n\t\t\t\t// if we started this fragment with a consecuative message\x2C\n\t\t\t\t// cancel and output before we continue\n\t\t\t\tif(self.isConsecutive) {\n\t\t\t\t\tself.cancel();\n\t\t\t\t}\n\t\t\t\tself.isConsecutive \x3D false;\n\t\t\t\trmInsertNode();\n\t\t\t\tvar node \x3D createHTMLNode(html);\n\t\t\t\tself.fragment.appendChild(node);\n\n\t\t\t\tnode \x3D null;\n\n\t\t\t\tsetShouldScroll(shouldScroll);\n\t\t\t\tself.coalesce();\n\t\t\t}\n\n\t\t\tthis.appendNext \x3D function(html\x2C shouldScroll) {\n\t\t\t\tif(undefined \x3D\x3D\x3D self.isConsecutive)\n\t\t\t\t\tself.isConsecutive \x3D true;\n\t\t\t\tvar node \x3D createHTMLNode(html);\n\t\t\t\tvar insert \x3D self.fragment.querySelector(\"#insert\");\n\t\t\t\tif(insert) {\n\t\t\t\t\tinsert.parentNode.replaceChild(node\x2C insert);\n\t\t\t\t} else {\n\t\t\t\t\tself.fragment.appendChild(node);\n\t\t\t\t}\n\t\t\t\tnode \x3D null;\n\t\t\t\tsetShouldScroll(shouldScroll);\n\t\t\t\tself.coalesce();\n\t\t\t}\n\n\t\t\tthis.replaceLast \x3D function (html\x2C shouldScroll) {\n\t\t\t\trmInsertNode();\n\t\t\t\tvar node \x3D createHTMLNode(html);\n\t\t\t\tvar lastMessage \x3D self.fragment.lastChild;\n\t\t\t\tlastMessage.parentNode.replaceChild(node\x2C lastMessage);\n\t\t\t\tnode \x3D null;\n\t\t\t\tsetShouldScroll(shouldScroll);\n\t\t\t}\n\t\t}\n\t\tvar coalescedHTML;\n\n\t\t//Appending new content to the message view\n\t\tfunction appendMessage(html) {\n\t\t\tvar shouldScroll;\n\n\t\t\t// Only call nearBottom() if should scroll is undefined.\n\t\t\tif(undefined \x3D\x3D\x3D coalescedHTML.shouldScroll) {\n\t\t\t\tshouldScroll \x3D nearBottom();\n\t\t\t} else {\n\t\t\t\tshouldScroll \x3D coalescedHTML.shouldScroll;\n\t\t\t}\n\t\t\tappendMessageNoScroll(html\x2C shouldScroll);\n\t\t}\n\n\t\tfunction appendMessageNoScroll(html\x2C shouldScroll) {\n\t\t\tshouldScroll \x3D shouldScroll || false;\n\t\t\t// always try to coalesce new\x2C non-griuped\x2C messages\n\t\t\tcoalescedHTML.append(html\x2C shouldScroll)\n\t\t}\n\n\t\tfunction appendNextMessage(html){\n\t\t\tvar shouldScroll;\n\t\t\tif(undefined \x3D\x3D\x3D coalescedHTML.shouldScroll) {\n\t\t\t\tshouldScroll \x3D nearBottom();\n\t\t\t} else {\n\t\t\t\tshouldScroll \x3D coalescedHTML.shouldScroll;\n\t\t\t}\n\t\t\tappendNextMessageNoScroll(html\x2C shouldScroll);\n\t\t}\n\n\t\tfunction appendNextMessageNoScroll(html\x2C shouldScroll){\n\t\t\tshouldScroll \x3D shouldScroll || false;\n\t\t\t// only group next messages if we\'re already coalescing input\n\t\t\tcoalescedHTML.appendNext(html\x2C shouldScroll);\n\t\t}\n\n\t\tfunction replaceLastMessage(html){\n\t\t\tvar shouldScroll;\n\t\t\t// only replace messages if we\'re already coalescing\n\t\t\tif(coalescedHTML.isCoalescing){\n\t\t\t\tif(undefined \x3D\x3D\x3D coalescedHTML.shouldScroll) {\n\t\t\t\t\tshouldScroll \x3D nearBottom();\n\t\t\t\t} else {\n\t\t\t\t\tshouldScroll \x3D coalescedHTML.shouldScroll;\n\t\t\t\t}\n\t\t\t\tcoalescedHTML.replaceLast(html\x2C shouldScroll);\n\t\t\t} else {\n\t\t\t\tshouldScroll \x3D nearBottom();\n\t\t\t\t//Retrieve the current insertion point\x2C then remove it\n\t\t\t\t//This requires that there have been an insertion point... is there a better way to retrieve the last element\? -evands\n\t\t\t\tvar insert \x3D document.getElementById(\"insert\");\n\t\t\t\tif(insert){\n\t\t\t\t\tvar parentNode \x3D insert.parentNode;\n\t\t\t\t\tparentNode.removeChild(insert);\n\t\t\t\t\tvar lastMessage \x3D document.getElementById(\"Chat\").lastChild;\n\t\t\t\t\tdocument.getElementById(\"Chat\").removeChild(lastMessage);\n\t\t\t\t}\n\n\t\t\t\t//Now append the message itself\n\t\t\t\tappendHTML(html);\n\n\t\t\t\talignChat(shouldScroll);\n\t\t\t}\n\t\t}\n\n\t\t//Auto-scroll to bottom.  Use nearBottom to determine if a scrollToBottom is desired.\n\t\tfunction nearBottom() {\n\t\t\treturn ( document.body.scrollTop >\x3D ( document.body.offsetHeight - ( window.innerHeight * 1.2 ) ) );\n\t\t}\n\t\tfunction scrollToBottom() {\n\t\t\tdocument.body.scrollTop \x3D document.body.offsetHeight;\n\t\t}\n\n\t\t//Dynamically exchange the active stylesheet\n\t\tfunction setStylesheet( id\x2C url ) {\n\t\t\tvar code \x3D \"<style id\x3D\\\"\" + id + \"\\\" type\x3D\\\"text/css\\\" media\x3D\\\"screen\x2Cprint\\\">\";\n\t\t\tif( url.length )\n\t\t\t\tcode +\x3D \"@import url( \\\"\" + url + \"\\\" );\";\n\t\t\tcode +\x3D \"</style>\";\n\t\t\tvar range \x3D document.createRange();\n\t\t\tvar head \x3D document.getElementsByTagName( \"head\" ).item(0);\n\t\t\trange.selectNode( head );\n\t\t\tvar documentFragment \x3D range.createContextualFragment( code );\n\t\t\thead.removeChild( document.getElementById( id ) );\n\t\t\thead.appendChild( documentFragment );\n\t\t}\n\n\t\t/* Converts emoticon images to textual emoticons; all emoticons in message if alt is held */\n\t\tdocument.onclick \x3D function imageCheck() {\n\t\t\tvar node \x3D event.target;\n\t\t\tif (node.tagName.toLowerCase() !\x3D \'img\')\n\t\t\t\treturn;\n\n\t\t\timageSwap(node\x2C false);\n\t\t}\n\n\t\t/* Converts textual emoticons to images if textToImagesFlag is true\x2C otherwise vice versa */\n\t\tfunction imageSwap(node\x2C textToImagesFlag) {\n\t\t\tvar shouldScroll \x3D nearBottom();\n\n\t\t\tvar images \x3D [node];\n\t\t\tif (event.altKey) {\n\t\t\t\twhile (node.id !\x3D \"Chat\" && node.parentNode.id !\x3D \"Chat\")\n\t\t\t\t\tnode \x3D node.parentNode;\n\t\t\t\timages \x3D node.querySelectorAll(textToImagesFlag \? \"a\" : \"img\");\n\t\t\t}\n\n\t\t\tfor (var i \x3D 0; i < images.length; i++) {\n\t\t\t\ttextToImagesFlag \? textToImage(images[i]) : imageToText(images[i]);\n\t\t\t}\n\n\t\t\talignChat(shouldScroll);\n\t\t}\n\n\t\tfunction textToImage(node) {\n\t\t\tif (!node.getAttribute(\"isEmoticon\"))\n\t\t\t\treturn;\n\t\t\t//Swap the image/text\n\t\t\tvar img \x3D document.createElement(\'img\');\n\t\t\timg.setAttribute(\'src\'\x2C node.getAttribute(\'src\'));\n\t\t\timg.setAttribute(\'alt\'\x2C node.firstChild.nodeValue);\n\t\t\timg.setAttribute(\'width\'\x2C node.getAttribute(\'width\'));\n\t\t\timg.setAttribute(\'height\'\x2C node.getAttribute(\'height\'));\n\t\t\timg.className \x3D node.className;\n\t\t\tnode.parentNode.replaceChild(img\x2C node);\n\t\t}\n\n\t\tfunction imageToText(node)\n\t\t{\n\t\t\tif (client.zoomImage(node) || !node.alt)\n\t\t\t\treturn;\n\t\t\tvar a \x3D document.createElement(\'a\');\n\t\t\ta.setAttribute(\'onclick\'\x2C \'imageSwap(this\x2C true)\');\n\t\t\ta.setAttribute(\'src\'\x2C node.getAttribute(\'src\'));\n\t\t\ta.setAttribute(\'isEmoticon\'\x2C true);\n\t\t\ta.setAttribute(\'width\'\x2C node.getAttribute(\'width\'));\n\t\t\ta.setAttribute(\'height\'\x2C node.getAttribute(\'height\'));\n\t\t\ta.className \x3D node.className;\n\t\t\tvar text \x3D document.createTextNode(node.alt);\n\t\t\ta.appendChild(text);\n\t\t\tnode.parentNode.replaceChild(a\x2C node);\n\t\t}\n\n\t\t//Align our chat to the bottom of the window.  If true is passed\x2C view will also be scrolled down\n\t\tfunction alignChat(shouldScroll) {\n\t\t\tvar windowHeight \x3D window.innerHeight;\n\n\t\t\tif (windowHeight > 0) {\n\t\t\t\tvar contentElement \x3D document.getElementById(\'Chat\');\n\t\t\t\tvar heightDifference \x3D (windowHeight - contentElement.offsetHeight);\n\t\t\t\tif (heightDifference > 0) {\n\t\t\t\t\tcontentElement.style.position \x3D \'relative\';\n\t\t\t\t\tcontentElement.style.top \x3D heightDifference + \'px\';\n\t\t\t\t} else {\n\t\t\t\t\tcontentElement.style.position \x3D \'static\';\n\t\t\t\t}\n\t\t\t}\n\n\t\t\tif (shouldScroll) scrollToBottom();\n\t\t}\n\n\t\twindow.onresize \x3D function windowDidResize(){\n\t\t\talignChat(true/*nearBottom()*/); //nearBottom buggy with inactive tabs\n\t\t}\n\n\t\tfunction initStyle() {\n\t\t\talignChat(true);\n\t\t\tif(!coalescedHTML)\n\t\t\t\tcoalescedHTML \x3D new CoalescedHTML();\n\t\t}\n\t</script>\n\n\t<style type\x3D\"text/css\">\n\t\t.actionMessageUserName { display:none; }\n\t\t.actionMessageBody:before { content:\"*\"; }\n\t\t.actionMessageBody:after { content:\"*\"; }\n\t\t* { word-wrap:break-word; text-rendering: optimizelegibility; }\n\t\timg.scaledToFitImage { height: auto; max-width: 100%%; }\n\t</style>\n\n\t<!-- This style is shared by all variants. !-->\n\t<style id\x3D\"baseStyle\" type\x3D\"text/css\" media\x3D\"screen\x2Cprint\">\n\t\t%@\n\t</style>\n\n\t<!-- Although we call this mainStyle for legacy reasons\x2C it\'s actually the variant style !-->\n\t<style id\x3D\"mainStyle\" type\x3D\"text/css\" media\x3D\"screen\x2Cprint\">\n\t\t@import url( \"%@\" );\n\t</style>\n\n</head>\n<body onload\x3D\"initStyle();\" style\x3D\"\x3D\x3DbodyBackground\x3D\x3D\" oncontextmenu\x3D\"return false;\">\n%@\n<div id\x3D\"Chat\">\n</div>\n%@\n</body>\n</html>", Scope = Private
	#tag EndConstant

	#tag Constant, Name = NickChanged, Type = Text, Dynamic = False, Default = \"nick_changed", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Notification, Type = Text, Dynamic = False, Default = \"notification", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="200"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HelpTag"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Renderer"
			Visible=true
			Group="Behavior"
			InitialValue="1"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - Native"
				"1 - WebKit"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="200"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass