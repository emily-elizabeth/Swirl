#tag Class
Protected Class ssWiredChatInput1
Inherits HTMLViewer
	#tag Event
		Sub DocumentComplete(URL as String)
		  ' if (me.MessageStyle.DefaultFontFamily = "System") OR (me.MessageStyle.DefaultFontFamily = "") then //OR (value = "Lucida Grande") then
		  ' me.ExecuteJavaScript "document.body.style.fontFamily='Lucida Sans Unicode', 'Lucida Grande', sans-serif;"
		  ' else
		  ' me.ExecuteJavaScript "document.body.style.fontFamily='" + me.MessageStyle.DefaultFontFamily + "';"
		  ' end if
		  ' 
		  ' me.ExecuteJavaScript "var style = document.createElement('style'); style.type='text/css'; style.innerHTML = 'body { font-size: " + str(me.MessageStyle.DefaultFontSize) + "px !important; }'; document.head.appendChild(style);"
		  ' me.ExecuteJavaScript "document.body.style.fontSize='" + str(me.MessageStyle.DefaultFontSize) + "px';"
		  ' 
		  ' ' me.AddCSS "img { max-height: 100% !important; }"
		  ' 
		  ' me.ContinuousSpellCheckingEnabled = ssWired.ssWired.CheckSpelling
		  ' me.Editable = TRUE
		  ' ' me.ExecuteJavaScript "SetFocus('input');"
		  ' 
		  ' 
		  ' RaiseEvent DocumentComplete URL
		  ' 
		  ' 
		  ' ' me.SetFocus
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  ' DIM randomNumber As Integer = XF.Random.InRange(1,1000)
		  ' DIM source As String = me.kSource
		  ' source = source.Replace("%jquery%", ssWired.JQueryFolder.Child("jquery-1.11.1.min.js").URLPath)
		  ' 
		  ' me.LoadPage source, SpecialFolder.Temporary.Child(ssWired.BundleIdentifier + ".input." + Str(randomNumber))
		  ' 
		  ' RaiseEvent Open
		End Sub
	#tag EndEvent

	#tag Event
		Sub TitleChanged(newTitle as String)
		  if (newTitle <> "") then
		    select case NthField(newTitle, " ", 1)
		    case "escape"
		      me.EscapeKeyPressed
		    case "return"
		      me.ReturnKeyPressed
		    case "tab"
		      me.TabKeyPressed
		    else
		      RaiseEvent TitleChanged newTitle
		    end select
		  else
		    RaiseEvent TitleChanged newTitle
		  end if
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function EditPaste() As Boolean Handles EditPaste.Action
			' ssWired.PasteFromClipboardIntoViewer me
			' Return TRUE
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function EditPasteAsText() As Boolean Handles EditPasteAsText.Action
			' me.PasteAsPlainText
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h0
		Sub AutoCompleteNick(nick As String)
		  DIM js As String = "var element = document.getElementById('input');" + _
		  "var elementText = element.innerText;" + _
		  "var elementTextLastIndexOf = elementText.lastIndexOf(' ');" + _
		  "var rangeObj = document.createRange();" + _
		  "rangeObj.selectNodeContents(element);" + _
		  "rangeObj.collapse(false);" + _
		  "var selectionObj = window.getSelection();" + _
		  "selectionObj.modify('extend', 'backward', 'word');" + _
		  "rangeObj.deleteContents();" + _
		  "if (elementTextLastIndexOf < 0) {" + _
		  "document.execCommand('insertText', false, '%nick%: ');" + _
		  "} else {" + _
		  "document.execCommand('insertText', false, '%nick%');" + _
		  "}"
		  
		  js = js.ReplaceAll("%nick%", nick)
		  
		  me.ExecuteJavaScript js
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Clear()
		  me.ExecuteJavaScript "document.getElementById('input').innerHTML = '';"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From XFWebView
		  // Constructor() -- From RectControl
		  Super.Constructor
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor_()
		  ' ' me.mConnection = connection
		  ' ' me.mChatID = chatID
		  ' ' 
		  ' ' Constructor
		  ' 
		  ' connection As WiredConnection, chatID As Integer
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DELETE_CancelDrop_()
		  ' if (Obj <> Nil) then
		  ' me.SetFocus
		  '
		  ' if (obj.PictureAvailable) AND (not RaiseEvent CancelDrop(Obj)) then
		  ' if (obj.TextAvailable) then
		  ' me.InsertImage obj.Text
		  ' else
		  ' me.InsertImage ssWired.HTML.EncodePicture(ssWired.ResizeImage(Obj.Picture))
		  ' end if
		  '
		  ' elseif (obj.TextAvailable) then
		  ' me.InsertText obj.Text
		  ' end if
		  '
		  ' me.SetFocus
		  ' end if
		  '
		  ' Return TRUE
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function DELETE_ParseEventJSON(p_event_json_obj As JSONItem) As Boolean
		  ' DIM t_return_value As Boolean = FALSE
		  '
		  ' me.InnerText_ = ""
		  ' me.InnerHTML_ = ""
		  ' me.Picture_ = Nil
		  '
		  ' if (p_event_json_obj <> Nil) then
		  ' if (p_event_json_obj.HasName("name")) then
		  ' me.EventName = p_event_json_obj.Value("name")
		  ' end if
		  ' if (p_event_json_obj.HasName("text")) then
		  ' me.InnerText_ = DecodeURLComponent(p_event_json_obj.Value("text"))
		  ' end if
		  ' if (p_event_json_obj.HasName("html")) then
		  ' me.InnerHTML_ = DecodeURLComponent(p_event_json_obj.Value("html"))
		  ' end if
		  ' if (p_event_json_obj.HasName("picture")) then
		  ' me.Picture_ = Picture(p_event_json_obj.Value("picture"))
		  ' end if
		  '
		  ' t_return_value = TRUE
		  ' end if
		  '
		  ' Return t_return_value
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DropObject()
		  ' ' me.ExecuteJavaScript "window.status = window.text;"
		  ' ' DIM droppedText As String = DecodeURLComponent(me.CallbackData_)
		  ' '
		  ' ' me.ExecuteJavaScript "window.status = window.picture;"
		  ' ' DIM droppedPicture As Picture = DecodeURLComponent(me.CallbackData_).ToPicture
		  ' '
		  ' ' DIM obj As NEW DragItem(me, 0, 0, 0, 0)
		  ' ' obj.Text = droppedText
		  ' ' obj.Picture = droppedPicture
		  ' '
		  'if (not CancelDrop(obj)) then
		  'if (obj.TextAvailable) AND (obj.PictureAvailable) then  // pasting a picture with a URL
		  'me.InsertImage obj.Text
		  'elseif (obj.TextAvailable) then
		  'me.InsertText obj.Text
		  'elseif (obj.PictureAvailable) then
		  'me.InsertImage obj.Picture
		  'end if
		  ' '
		  ' ' RaiseEvent DropObject obj
		  ' ' end if
		  '
		  '
		  ' DIM t_dragitem_obj As NEW DragItem(me, 0, 0, 0, 0)
		  ' if (me.Text <> "") then
		  ' t_dragitem_obj.Text = me.Text
		  ' end if
		  ' if (me.Picture <> Nil) then
		  ' t_dragitem_obj.Picture = me.Picture
		  ' end if
		  '
		  ' RaiseEvent DropObject t_dragitem_obj
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub EscapeKeyPressed()
		  me.Clear
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HTML() As String
		  ' Return me.EvaluateJavaScript("document.getElementById('input').innerHTML;")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ReturnKeyPressed()
		  ' DIM text As String = me.Text
		  ' DIM html As String = me.HTML
		  ' 
		  ' if (Keyboard.AsyncOptionKey) OR (Keyboard.AsyncAltKey) then
		  ' me.mConnection.SendActionChat me.mChatID, text
		  ' else
		  ' me.mConnection.SendChat me.mChatID, html, text
		  ' end if
		  ' 
		  ' me.Clear
		  ' 
		  ' 
		  ' 
		  ' ' elseif (me.Text = "/clear") then
		  ' ' self.Viewer.Clear
		  ' '
		  ' 
		  ' ' me.Clear
		  ' ' ' me.SetFocus
		  ' '
		  ' ' ' DIM textArray() As String = me.InnerText.Split
		  ' ' ' DIM obj As JSONItem
		  ' ' ' if (textArray.Ubound > -1) then
		  ' ' ' obj = Commands.Value(textArray(0))
		  ' ' ' end if
		  ' ' '
		  ' ' ' if (obj = Nil) then
		  ' ' ' if (me.InnerText <> "") then
		  ' ' ' self.Connection.SendZankaChat self.mChatID, me.InnerText
		  ' ' ' end if
		  ' ' ' if (me.InnerHTML <> "") then
		  ' ' ' self.Connection.SendFormattedChat self.mChatID, me.InnerHTML
		  ' ' ' end if
		  ' ' '
		  ' ' ' else
		  ' ' ' textArray.Remove(0)
		  ' ' '
		  ' ' ' select case obj.Value("type")
		  ' ' ' case 0  // send as chat
		  ' ' ' self.Connection.SendFormattedChat self.mChatID, obj.Value("content").StringValue.ReplaceAll("%text%", Join(textArray))
		  ' ' ' self.Connection.SendZankaChat self.mChatID, obj.Value("content").StringValue.ReplaceAll("%text%", Join(textArray))
		  ' ' ' case 1  // send as chat action
		  ' ' ' self.Connection.SendMe self.mChatID, obj.Value("content").StringValue.ReplaceAll("%text%", Join(textArray))
		  ' ' ' case 2  // change status
		  ' ' ' self.Connection.SendStatus obj.Value("content").StringValue.ReplaceAll("%status%", Settings.UserStatus).ReplaceAll("%text%", Join(textArray))
		  ' ' ' case 3  // change nick
		  ' ' ' if (obj.Value("content") <> "") then
		  ' ' ' self.Connection.SendNick obj.Value("content").StringValue.ReplaceAll("%text%", Join(textArray))
		  ' ' ' end if
		  ' ' ' end select
		  ' ' ' end if
		  ' ' ' end if
		  ' ' '
		  ' ' ' me.Clear
		  ' ' ' me.SetFocus
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub TabKeyPressed()
		  ' DIM text As String = me.Text
		  ' DIM html As String = me.HTML
		  '
		  ' if (ssWired.TabCompletesNick) then
		  ' DIM text As String = me.EvaluateJavaScript("document.getElementById('input').innerText;")
		  '
		  ' if (Trim(text) <> "") AND (Right(text, 1) <> " ") then
		  ' DIM partialNick As String = NthField(text, " " , CountFields(text, " "))
		  '
		  ' if (Trim(partialNick) <> "") then
		  ' DIM userNicks() As String = self.GetUserNames()
		  ' DIM fullNick As String
		  '
		  ' if (UBound(userNicks) > -1) then
		  ' for i as Integer = 0 to UBound(userNicks)
		  ' if (Left(userNicks(i), Len(partialNick)) = partialNick) then
		  ' fullNick = userNicks(i)
		  ' exit for i
		  ' end if
		  ' next
		  ' end if
		  '
		  ' if (Trim(fullNick) <> "") then
		  ' me.AutoCompleteNick fullNick
		  ' end if
		  ' end if
		  ' end if
		  ' end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Text_() As String
		  ' Return me.EvaluateJavaScript("document.getElementById('input').innerText;")
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event CancelPaste() As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DocumentComplete(URL As String)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DropObject(obj as DragItem)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event KeyPressed(keyName As String)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event TitleChanged(newTitle As String)
	#tag EndHook


	#tag Property, Flags = &h21
		Private mChatID As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mConnection As Auto
	#tag EndProperty

	#tag Property, Flags = &h0
		MessageStyle As Auto
	#tag EndProperty


	#tag Constant, Name = kCleanImageTags, Type = String, Dynamic = False, Default = \"function CleanImageTags() {\n\tvar images \x3D document.getElementsByTagName(\'img\');\n\tfor (i\x3D0; i<images.length; i++) {\n\t\tvar tSource \x3D images[i].src;\n\t\tfor (var j \x3D images[i].attributes.length; j-->0;) {\n\t\t\timages[i].removeAttributeNode(images[i].attributes[j]);\n\t\t}\n\t\timages[i].setAttribute(\'src\'\x2C tSource);\n\t}\n}\n", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kSource, Type = String, Dynamic = False, Default = \"<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"\n   \"http://www.w3.org/TR/html4/loose.dtd\">\n<html>\n<head>\n<title>-</title>\n<style id\x3D\"baseStyle\" type\x3D\"text/css\" media\x3D\"screen\x2Cprint\">\n* {\n\twhite-space: pre-wrap;\n\tword-wrap: break-word;\n\tword-break: hyphenate;\n\tmargin: 0;\n}\n\nhtml\x2C body {\n\tcolor: black;\n\tmin-height: 100%;\n\theight: 100%;\n\tbackground-color: white;\n}\n\nimg {\n\tmax-width: 100% !important;\n\theight: auto !important;\n\tvertical-align: baseline !important;\n}\n\na {\n\ttext-decoration:none;\n}\n\n#input {\n\tmin-height: 100%;\n\theight: auto !important;\n\theight: 100%;\n\twidth: 100%;\n}\n\n#input:focus {\n\toutline: none;\n}\n</style>\n\n<script src\x3D\"%jquery%\"></script>\n\n<script>\n\tfunction RaiseEvent(name\x2C picture\x2C text\x2C html) {\n\t\tdocument.title \x3D \'{\"name\":\"\' + name + \'\"\x2C \"text\":\"\' + text + \'\"\x2C \"html\":\"\' + html + \'\"\x2C \"picture\":\"\' + picture + \'\"\x2C \"random\":\"\' + String(Math.random()) + \'\"}\';\n\t}\n\n\n\n\tfunction HandleDragOver(event) {\n\t\tevent.preventDefault();\n\t\tevent.dataTransfer.dropEffect \x3D \'copy\';\n\t}\n\n\tfunction HandleDragEnter(event) {\n\t\tevent.preventDefault();\n\t\tevent.dataTransfer.dropEffect \x3D \'copy\';\n\t}\n\n\tfunction HandleDrop(event) {\n\t\tevent.preventDefault();\n\t\tevent.dataTransfer.dropEffect \x3D \'copy\';\n\n\t\tvar files \x3D event.dataTransfer.files;\n\t\tvar url \x3D event.dataTransfer.getData(\'text/uri-list\');\n\t\tvar text \x3D event.dataTransfer.getData(\'text/plain\');\n\n\t\tif (files.length > 0) {\n\t\t\tvar f \x3D files[0];\n\t\t\tif (f.type.indexOf(\'image\') \x3D\x3D 0) {\n\t\t\t\tvar reader \x3D new FileReader();\n\t\t\t\treader.onload \x3D function(fevent) {\n\t\t\t\t\tRaiseEvent(\'Drop\'\x2C fevent.target.result\x2C \'\'\x2C \'\');\n\t\t\t\t}\n\t\t\t\treader.readAsDataURL(f);\n\t\t\t}\n\t\t} else if (url.length > 0) {\n\t\t\tvar img \x3D new Image();\n\t\t\timg.onerror \x3D function() {\n\t\t\t\tRaiseEvent(\'Drop\'\x2C \'\'\x2C encodeURIComponent(url)\x2C encodeURIComponent(\'<a href\x3D\"\'+url+\'\">\'+url+\'</a>\'));\n\t\t\t}\n\t\t\timg.onload \x3D  function() {\n\t\t\t\tvar canvas \x3D document.createElement(\'canvas\');\n\t\t\t\tcanvas.width \x3D this.width;\n\t\t\t\tcanvas.height \x3D this.height;\n\t\t\t\tvar ctx \x3D canvas.getContext(\'2d\');\n\t\t\t\tctx.drawImage(this\x2C 0\x2C 0);\n\t\t\t\tRaiseEvent(\'Drop\'\x2C canvas.toDataURL(\'image/png\')\x2C encodeURIComponent(url)\x2C encodeURIComponent(\'<a href\x3D\"\'+url+\'\">\'+url+\'</a>\'));\n\t\t\t}\n\t\t\timg.src \x3D url;\n\t\t} else if (text.length > 0) {\n\t\t\tRaiseEvent(\'Drop\'\x2C \'\'\x2C encodeURIComponent(text)\x2C encodeURIComponent(text));\n\t\t}\n\t}\n\n\n\n\tfunction HandleEscapePressed(event) {\n\t\tif (event.which \x3D\x3D 27) {\n\t\t\tdocument.title \x3D \'escape \' + String(Math.random());\n\t\t\tevent.preventDefault();\n\t\t\tevent.stopImmediatePropagation();\n\t\t}\n\t}\n\n\n\n\tfunction HandleReturnPressed(event) {\n\t\tif (event.which \x3D\x3D 13) {\n\t\t\tdocument.title \x3D \'return \' + String(Math.random());\n\t\t\tevent.preventDefault();\n\t\t\tevent.stopImmediatePropagation();\n\t\t}\n\t}\n\n\n\n\tfunction HandleTabPressed(event) {\n\t\tif (event.which \x3D\x3D 9) {\n\t\t\tdocument.title \x3D \'tab \' + String(Math.random());\n\t\t\tevent.preventDefault();\n\t\t\tevent.stopImmediatePropagation();\n\t\t}\n\t}\n\n\n\tdocument.addEventListener(\'dragover\'\x2C HandleDragOver\x2C false);\n\tdocument.addEventListener(\'dragenter\'\x2C HandleDragEnter\x2C false);\n\tdocument.addEventListener(\'drop\'\x2C HandleDrop\x2C false);\n\tdocument.addEventListener(\'keydown\'\x2C HandleEscapePressed\x2C false);\n\tdocument.addEventListener(\'keydown\'\x2C HandleReturnPressed\x2C false);\n\tdocument.addEventListener(\'keydown\'\x2C HandleTabPressed\x2C false);\n</script>\n\n</head><body id\x3D\"input\"></body></html>", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kSource1, Type = String, Dynamic = False, Default = \"<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"\n   \"http://www.w3.org/TR/html4/loose.dtd\">\n<html>\n<head>\n<title>-</title>\n<style id\x3D\"baseStyle\" type\x3D\"text/css\" media\x3D\"screen\x2Cprint\">\n* {\n\twhite-space: pre-wrap;\n\tword-wrap: break-word;\n\tword-break: hyphenate;\n\tmargin: 0;\n}\n\nhtml\x2C body {\n\tcolor: black;\n\tmin-height: 100%;\n\theight: 100%;\n\tbackground-color: white;\n}\n\nimg {\n\tmax-width: 100% !important;\n\theight: auto !important;\n\tvertical-align: baseline !important;\n}\n\na {\n\ttext-decoration:none;\n}\n\n.chat #input {\n\tmin-height: 100%;\n\theight: auto !important;\n\theight: 100%;\n\twidth: 100%;\n}\n\n.chat #input:focus {\n\toutline: none;\n}\n</style>\n\n</head><body class\x3D\"chat\" id\x3D\"input\"></body></html>", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kSource10, Type = String, Dynamic = False, Default = \"<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"\n   \"http://www.w3.org/TR/html4/loose.dtd\">\n<html>\n<head>\n<title>-</title>\n<style id\x3D\"baseStyle\" type\x3D\"text/css\" media\x3D\"screen\x2Cprint\">\n* {\n\twhite-space: pre-wrap;\n\tword-wrap: break-word;\n\tword-break: hyphenate;\n\tmargin: 0;\n}\n\nhtml\x2C body {\n\tcolor: black;\n\tmin-height: 100%;\n\theight: 100%;\n\tbackground-color: white;\n}\n\nimg {\n\tmax-width: 100% !important;\n\theight: auto !important;\n\tvertical-align: baseline !important;\n}\n\na {\n\ttext-decoration:none;\n}\n\n#input {\n\tmin-height: 100%;\n\theight: auto !important;\n\theight: 100%;\n\twidth: 100%;\n}\n\n#input:focus {\n\toutline: none;\n}\n</style>\n\n<script src\x3D\"%jquery%\"></script>\n\n<script>\n\tfunction RaiseEvent(name\x2C picture\x2C text\x2C html) {\n\t\tdocument.title \x3D \'{\"name\":\"\' + name + \'\"\x2C \"text\":\"\' + text + \'\"\x2C \"html\":\"\' + html + \'\"\x2C \"picture\":\"\' + picture + \'\"\x2C \"random\":\"\' + String(Math.random()) + \'\"}\';\n\t}\n\n\n\n\tfunction HandleDragOver(event) {\n\t\tevent.preventDefault();\n\t\tevent.dataTransfer.dropEffect \x3D \'copy\';\n\t}\n\n\tfunction HandleDragEnter(event) {\n\t\tevent.preventDefault();\n\t\tevent.dataTransfer.dropEffect \x3D \'copy\';\n\t}\n\n\tfunction HandleDrop(event) {\n\t\tevent.preventDefault();\n\t\tevent.dataTransfer.dropEffect \x3D \'copy\';\n\n\t\tvar files \x3D event.dataTransfer.files;\n\t\tvar url \x3D event.dataTransfer.getData(\'text/uri-list\');\n\t\tvar text \x3D event.dataTransfer.getData(\'text/plain\');\n\n\t\tif (files.length > 0) {\n\t\t\tvar f \x3D files[0];\n\t\t\tif (f.type.indexOf(\'image\') \x3D\x3D 0) {\n\t\t\t\tvar reader \x3D new FileReader();\n\t\t\t\treader.onload \x3D function(fevent) {\n\t\t\t\t\tRaiseEvent(\'Drop\'\x2C fevent.target.result\x2C \'\'\x2C \'\');\n\t\t\t\t}\n\t\t\t\treader.readAsDataURL(f);\n\t\t\t}\n\t\t} else if (url.length > 0) {\n\t\t\tvar img \x3D new Image();\n\t\t\timg.onerror \x3D function() {\n\t\t\t\tRaiseEvent(\'Drop\'\x2C \'\'\x2C encodeURIComponent(url)\x2C encodeURIComponent(\'<a href\x3D\"\'+url+\'\">\'+url+\'</a>\'));\n\t\t\t}\n\t\t\timg.onload \x3D  function() {\n\t\t\t\tvar canvas \x3D document.createElement(\'canvas\');\n\t\t\t\tcanvas.width \x3D this.width;\n\t\t\t\tcanvas.height \x3D this.height;\n\t\t\t\tvar ctx \x3D canvas.getContext(\'2d\');\n\t\t\t\tctx.drawImage(this\x2C 0\x2C 0);\n\t\t\t\tRaiseEvent(\'Drop\'\x2C canvas.toDataURL(\'image/png\')\x2C encodeURIComponent(url)\x2C encodeURIComponent(\'<a href\x3D\"\'+url+\'\">\'+url+\'</a>\'));\n\t\t\t}\n\t\t\timg.src \x3D url;\n\t\t} else if (text.length > 0) {\n\t\t\tRaiseEvent(\'Drop\'\x2C \'\'\x2C encodeURIComponent(text)\x2C encodeURIComponent(text));\n\t\t}\n\t}\n\n\n\n\tfunction HandleEscapePressed(event) {\n\t\tif (event.which \x3D\x3D 27) {\n\t\t\tdocument.title \x3D \'escape \' + String(Math.random());\n\t\t\tevent.preventDefault();\n\t\t\tevent.stopImmediatePropagation();\n\t\t}\n\t}\n\n\n\n\tfunction HandleReturnPressed(event) {\n\t\tif (event.which \x3D\x3D 13) {\n\t\t\tdocument.title \x3D \'return \' + String(Math.random());\n\t\t\tevent.preventDefault();\n\t\t\tevent.stopImmediatePropagation();\n\t\t}\n\t}\n\n\n\n\tfunction HandleTabPressed(event) {\n\t\tif (event.which \x3D\x3D 9) {\n\t\t\tdocument.title \x3D \'tab \' + String(Math.random());\n\t\t\tevent.preventDefault();\n\t\t\tevent.stopImmediatePropagation();\n\t\t}\n\t}\n\n\n\tdocument.addEventListener(\'dragover\'\x2C HandleDragOver\x2C false);\n\tdocument.addEventListener(\'dragenter\'\x2C HandleDragEnter\x2C false);\n\tdocument.addEventListener(\'drop\'\x2C HandleDrop\x2C false);\n\tdocument.addEventListener(\'keydown\'\x2C HandleEscapePressed\x2C false);\n\tdocument.addEventListener(\'keydown\'\x2C HandleReturnPressed\x2C false);\n\tdocument.addEventListener(\'keydown\'\x2C HandleTabPressed\x2C false);\n</script>\n\n</head><body id\x3D\"input\"></body></html>", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kSource2, Type = String, Dynamic = False, Default = \"<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"\n   \"http://www.w3.org/TR/html4/loose.dtd\">\n<html>\n<head>\n<title>-</title>\n<style id\x3D\"baseStyle\" type\x3D\"text/css\" media\x3D\"screen\x2Cprint\">\n* {\n\twhite-space: pre-wrap;\n\tword-wrap: break-word;\n\tword-break: hyphenate;\n\tmargin: 0;\n}\n\nhtml\x2C body {\n\tcolor: black;\n\tmin-height: 100%;\n\theight: 100%;\n\tbackground-color: white;\n}\n\nimg {\n\tmax-width: 100% !important;\n\theight: auto !important;\n\tvertical-align: baseline !important;\n}\n\na {\n\ttext-decoration:none;\n}\n\n.chat #input {\n\tmin-height: 100%;\n\theight: auto !important;\n\theight: 100%;\n\twidth: 100%;\n}\n\n.chat #input:focus {\n\toutline: none;\n}\n</style>\n\n<script>\n\tfunction RaiseEvent(name\x2C picture\x2C text\x2C html) {\n\t\tvar data \x3D \'{\"text\":\"\' + text + \'\"\x2C \"html\":\"\' + html + \'\"\x2C \"picture\":\"\' + picture + \'\"}\';\n\t\tdocument.title \x3D \'{\"name\":\"\' + name + \'\"\x2C \"data\":\"\' + encodeURIComponent(data) + \'\"\x2C \"random\":\"\' + String(Math.random()) + \'\"}\';\n\t}\n\n\n\tfunction HandleContextMenu(event) {\n\t\tevent.preventDefault();\n\t\tevent.stopImmediatePropagation();\n\n\t\tvar range \x3D window.getSelection().getRangeAt(0);\n\t\tvar content \x3D range.cloneContents();\n\t\tvar span \x3D document.createElement(\'span\');\n\t\tspan.appendChild(content);\n\t\tvar text \x3D span.innerText;\n\t\tvar html \x3D span.innerHTML;\n\n\t\tvar url \x3D event.target.src;\n\n\t\tvar img \x3D new Image();\n\t\timg.src \x3D url;\n\n\t\timg.onerror \x3D function() {\n\t\t\tRaiseEvent(\'ConstructContextualMenu\'\x2C \'\'\x2C encodeURIComponent(text)\x2C encodeURIComponent(html));\n\t\t}\n\t\timg.onload \x3D  function() { \n\t\t\tvar canvas \x3D document.createElement(\'canvas\');\n\t\t\tcanvas.width \x3D this.width;\n\t\t\tcanvas.height \x3D this.height;\n\t\t\tvar ctx \x3D canvas.getContext(\'2d\');\n\t\t\tctx.drawImage(this\x2C 0\x2C 0);\n\t\t\tRaiseEvent(\'ConstructContextualMenu\'\x2C canvas.toDataURL(\'image/png\')\x2C encodeURIComponent(url)\x2C encodeURIComponent(html));\n\t\t}\n\n\t\treturn false;\n\t}\n\n\n\n\tfunction HandleDragOver(event) {\n\t\tevent.preventDefault();\n\t}\n\n\tfunction HandleDragEnter(event) {\n\t\tevent.preventDefault();\n\t}\n\n\tfunction HandleDrop(event) {\n\t\tevent.preventDefault();\n\n\t\tvar files \x3D event.dataTransfer.files;\n\t\tvar url \x3D event.dataTransfer.getData(\'text/uri-list\');\n\t\tvar text \x3D event.dataTransfer.getData(\'text/plain\');\n\n\t\tif (files.length > 0) {\n\t\t\tvar f \x3D files[0];\n\t\t\tif (f.type.indexOf(\'image\') \x3D\x3D 0) {\n\t\t\t\tvar reader \x3D new FileReader();\n\t\t\t\treader.onload \x3D function(fevent) {\n\t\t\t\t\tRaiseEvent(\'Drop\'\x2C fevent.target.result\x2C \'\'\x2C \'\');\n\t\t\t\t}\n\t\t\t\treader.readAsDataURL(f);\n\t\t\t}\n\t\t} else if (url.length > 0) {\n\t\t\tvar img \x3D new Image();\n\t\t\timg.onerror \x3D function() {\n\t\t\t\tRaiseEvent(\'Drop\'\x2C \'\'\x2C encodeURIComponent(url)\x2C encodeURIComponent(\'<a href\x3D\"\'+url+\'\">\'+url+\'</a>\'));\n\t\t\t}\n\t\t\timg.onload \x3D  function() {\n\t\t\t\tvar canvas \x3D document.createElement(\'canvas\');\n\t\t\t\tcanvas.width \x3D this.width;\n\t\t\t\tcanvas.height \x3D this.height;\n\t\t\t\tvar ctx \x3D canvas.getContext(\'2d\');\n\t\t\t\tctx.drawImage(this\x2C 0\x2C 0);\n\t\t\t\tRaiseEvent(\'Drop\'\x2C canvas.toDataURL(\'image/png\')\x2C encodeURIComponent(url)\x2C encodeURIComponent(\'<a href\x3D\"\'+url+\'\">\'+url+\'</a>\'));\n\t\t\t}\n\t\t\timg.src \x3D url;\n\t\t} else if (text.length > 0) {\n\t\t\tRaiseEvent(\'Drop\'\x2C \'\'\x2C encodeURIComponent(text)\x2C encodeURIComponent(text));\n\t\t}\n\t}\n\n\n\n\tfunction HandleEscapePressed(event) {\n\t\tif (event.which \x3D\x3D 27) {\n\t\t\tRaiseEvent(\'EscapeKeyPressed\'\x2C \'\'\x2C \'\'\x2C \'\');\n\t\t\tevent.preventDefault();\n\t\t\tevent.stopImmediatePropagation();\n\t\t}\n\t}\n\n\n\n\tfunction HandleReturnPressed(event) {\n\t\tif (event.which \x3D\x3D 13) {\n\t\t\tRaiseEvent(\'ReturnKeyPressed\'\x2C \'\'\x2C \'\'\x2C \'\');\n\t\t\tevent.preventDefault();\n\t\t\tevent.stopImmediatePropagation();\n\t\t}\n\t}\n\n\n\n\tfunction HandleTabPressed(event) {\n\t\tif (event.which \x3D\x3D 9) {\n\t\t\tRaiseEvent(\'TabKeyPressed\'\x2C \'\'\x2C \'\'\x2C \'\');\n\t\t\tevent.preventDefault();\n\t\t\tevent.stopImmediatePropagation();\n\t\t}\n\t}\n\n\n\tfunction SetFocus(elementID) {\n\t\tvar elem \x3D document.getElementById(elementID);\n\t\telem.focus();\n\n\t\tvar selection \x3D document.getSelection();\n\t\tvar range \x3D selection.getRangeAt(0);\n\t\tselection.removeAllRanges();\n\t\trange.selectNodeContents(elem);\n\t\trange.collapse(false);\n\t\tselection.addRange(range);\n\t\tRaiseEvent(\'SetFocus\');\n\t}\n\n\tfunction SelectAfter(elementID) {\n\t\tvar elem \x3D document.getElementById(elementID);\n\t\telem.focus();\n\n\t\tvar selection \x3D document.getSelection();\n\t\tvar range \x3D selection.getRangeAt(0);\n\t\tselection.removeAllRanges();\n\t\trange.selectNodeContents(elem);\n\t\trange.collapse(false);\n\t\tselection.addRange(range);\n\t}\n\n\n\tdocument.addEventListener(\'contextmenu\'\x2C HandleContextMenu\x2C false);\n\tdocument.addEventListener(\'dragover\'\x2C HandleDragOver\x2C false);\n\tdocument.addEventListener(\'dragenter\'\x2C HandleDragEnter\x2C false);\n\tdocument.addEventListener(\'drop\'\x2C HandleDrop\x2C false);\n\tdocument.addEventListener(\'keydown\'\x2C HandleEscapePressed\x2C false);\n\tdocument.addEventListener(\'keydown\'\x2C HandleReturnPressed\x2C false);\n\tdocument.addEventListener(\'keydown\'\x2C HandleTabPressed\x2C false);\n\tdocument.addEventListener(\'paste\'\x2C HandlePaste\x2C false);\n</script>\n\n</head><body class\x3D\"chat\" id\x3D\"input\"></body></html>", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kSource3, Type = String, Dynamic = False, Default = \"<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"\n   \"http://www.w3.org/TR/html4/loose.dtd\">\n<html>\n<head>\n<title>-</title>\n<style id\x3D\"baseStyle\" type\x3D\"text/css\" media\x3D\"screen\x2Cprint\">\n* {\n\twhite-space: pre-wrap;\n\tword-wrap: break-word;\n\tword-break: hyphenate;\n\tmargin: 0;\n}\n\nhtml\x2C body {\n\tcolor: black;\n\tmin-height: 100%;\n\theight: 100%;\n\tbackground-color: white;\n}\n\nimg {\n\tmax-width: 100% !important;\n\theight: auto !important;\n\tvertical-align: baseline !important;\n}\n\na {\n\ttext-decoration:none;\n}\n\n.chat #input {\n\tmin-height: 100%;\n\theight: auto !important;\n\theight: 100%;\n\twidth: 100%;\n}\n\n.chat #input:focus {\n\toutline: none;\n}\n</style>\n\n<script>\n\tfunction RaiseEvent(name\x2C picture\x2C text\x2C html) {\n\t\tvar data \x3D \'{\"text\":\"\' + text + \'\"\x2C \"html\":\"\' + html + \'\"\x2C \"picture\":\"\' + picture + \'\"}\';\n\t\tdocument.title \x3D \'{\"name\":\"\' + name + \'\"\x2C \"data\":\"\' + encodeURIComponent(data) + \'\"\x2C \"random\":\"\' + String(Math.random()) + \'\"}\';\n\t}\n\n\n\tfunction HandleContextMenu(event) {\n\t\tevent.preventDefault();\n\t\tevent.stopImmediatePropagation();\n\n\t\tvar range \x3D window.getSelection().getRangeAt(0);\n\t\tvar content \x3D range.cloneContents();\n\t\tvar span \x3D document.createElement(\'span\');\n\t\tspan.appendChild(content);\n\t\tvar text \x3D span.innerText;\n\t\tvar html \x3D span.innerHTML;\n\n\t\tvar url \x3D event.target.src;\n\n\t\tvar img \x3D new Image();\n\t\timg.src \x3D url;\n\n\t\timg.onerror \x3D function() {\n\t\t\tRaiseEvent(\'ConstructContextualMenu\'\x2C \'\'\x2C encodeURIComponent(text)\x2C encodeURIComponent(html));\n\t\t}\n\t\timg.onload \x3D  function() { \n\t\t\tvar canvas \x3D document.createElement(\'canvas\');\n\t\t\tcanvas.width \x3D this.width;\n\t\t\tcanvas.height \x3D this.height;\n\t\t\tvar ctx \x3D canvas.getContext(\'2d\');\n\t\t\tctx.drawImage(this\x2C 0\x2C 0);\n\t\t\tRaiseEvent(\'ConstructContextualMenu\'\x2C canvas.toDataURL(\'image/png\')\x2C encodeURIComponent(url)\x2C encodeURIComponent(html));\n\t\t}\n\n\t\treturn false;\n\t}\n\n\n\n\tfunction HandleDragOver(event) {\n\t\tevent.preventDefault();\n\t}\n\n\tfunction HandleDragEnter(event) {\n\t\tevent.preventDefault();\n\t}\n\n\tfunction HandleDrop(event) {\n\t\tevent.preventDefault();\n\n\t\tvar files \x3D event.dataTransfer.files;\n\t\tvar url \x3D event.dataTransfer.getData(\'text/uri-list\');\n\t\tvar text \x3D event.dataTransfer.getData(\'text/plain\');\n\n\t\tif (files.length > 0) {\n\t\t\tvar f \x3D files[0];\n\t\t\tif (f.type.indexOf(\'image\') \x3D\x3D 0) {\n\t\t\t\tvar reader \x3D new FileReader();\n\t\t\t\treader.onload \x3D function(fevent) {\n\t\t\t\t\tRaiseEvent(\'Drop\'\x2C fevent.target.result\x2C \'\'\x2C \'\');\n\t\t\t\t}\n\t\t\t\treader.readAsDataURL(f);\n\t\t\t}\n\t\t} else if (url.length > 0) {\n\t\t\tvar img \x3D new Image();\n\t\t\timg.onerror \x3D function() {\n\t\t\t\tRaiseEvent(\'Drop\'\x2C \'\'\x2C encodeURIComponent(url)\x2C encodeURIComponent(\'<a href\x3D\"\'+url+\'\">\'+url+\'</a>\'));\n\t\t\t}\n\t\t\timg.onload \x3D  function() {\n\t\t\t\tvar canvas \x3D document.createElement(\'canvas\');\n\t\t\t\tcanvas.width \x3D this.width;\n\t\t\t\tcanvas.height \x3D this.height;\n\t\t\t\tvar ctx \x3D canvas.getContext(\'2d\');\n\t\t\t\tctx.drawImage(this\x2C 0\x2C 0);\n\t\t\t\tRaiseEvent(\'Drop\'\x2C canvas.toDataURL(\'image/png\')\x2C encodeURIComponent(url)\x2C encodeURIComponent(\'<a href\x3D\"\'+url+\'\">\'+url+\'</a>\'));\n\t\t\t}\n\t\t\timg.src \x3D url;\n\t\t} else if (text.length > 0) {\n\t\t\tRaiseEvent(\'Drop\'\x2C \'\'\x2C encodeURIComponent(text)\x2C encodeURIComponent(text));\n\t\t}\n\t}\n\n\n\n\tfunction HandleEscapePressed(event) {\n\t\tif (event.which \x3D\x3D 27) {\n\t\t\tRaiseEvent(\'EscapeKeyPressed\'\x2C \'\'\x2C \'\'\x2C \'\');\n\t\t\tevent.preventDefault();\n\t\t\tevent.stopImmediatePropagation();\n\t\t}\n\t}\n\n\n\n\tfunction HandleReturnPressed(event) {\n\t\tif (event.which \x3D\x3D 13) {\n\t\t\tRaiseEvent(\'ReturnKeyPressed\'\x2C \'\'\x2C \'\'\x2C \'\');\n\t\t\tevent.preventDefault();\n\t\t\tevent.stopImmediatePropagation();\n\t\t}\n\t}\n\n\n\n\tfunction HandleTabPressed(event) {\n\t\tif (event.which \x3D\x3D 9) {\n\t\t\tRaiseEvent(\'TabKeyPressed\'\x2C \'\'\x2C \'\'\x2C \'\');\n\t\t\tevent.preventDefault();\n\t\t\tevent.stopImmediatePropagation();\n\t\t}\n\t}\n\n\n\tfunction HandlePaste(event) {\n\t\tevent.preventDefault();\n\t\tvar data \x3D event.clipboardData.getData(\'text/plain\');\n\t\tif (data !\x3D\x3D \'\') {\n\t\t\tvar img \x3D new Image();\n\t\t\timg.src \x3D data;\n\t\t\timg.onerror \x3D function() {\n\t\t\t\tdocument.execCommand(\'insertText\'\x2C false\x2C data);\n\t\t\t}\n\t\t\timg.onload \x3D  function() {\n//\t\t\t\tif (window.allowPicturePaste) {\n\t\t\t\tif (window.shiftKey) {\n\t\t\t\t\tdocument.execCommand(\'insertText\'\x2C false\x2C data);\n\t\t\t\t} else {\n\t\t\t\t\tdocument.execCommand(\'insertImage\'\x2C false\x2C data);\n\t\t\t\t}\n//\t\t\t\t} else {\n//\t\t\t\t\tdocument.execCommand(\'insertText\'\x2C false\x2C data);\n//\t\t\t\t}\n\t\t\t}\n\t\t} else {\n//\t\t\tif (window.allowPicturePaste) {\n\t\t\t\tRaiseEvent(\'Paste\'\x2C \'\'\x2C \'\'\x2C \'\');  // possibly a picture on the clipboard\n//\t\t\t}\n\t\t}\n\t}\n\n\n\n\tfunction SetFocus(elementID) {\n\t\tvar elem \x3D document.getElementById(elementID);\n\t\telem.focus();\n\n\t\tvar selection \x3D document.getSelection();\n\t\tvar range \x3D selection.getRangeAt(0);\n\t\tselection.removeAllRanges();\n\t\trange.selectNodeContents(elem);\n\t\trange.collapse(false);\n\t\tselection.addRange(range);\n\t\tRaiseEvent(\'SetFocus\');\n\t}\n\n\tfunction SelectAfter(elementID) {\n\t\tvar elem \x3D document.getElementById(elementID);\n\t\telem.focus();\n\n\t\tvar selection \x3D document.getSelection();\n\t\tvar range \x3D selection.getRangeAt(0);\n\t\tselection.removeAllRanges();\n\t\trange.selectNodeContents(elem);\n\t\trange.collapse(false);\n\t\tselection.addRange(range);\n\t}\n\n\n\tdocument.addEventListener(\'contextmenu\'\x2C HandleContextMenu\x2C false);\n\tdocument.addEventListener(\'dragover\'\x2C HandleDragOver\x2C false);\n\tdocument.addEventListener(\'dragenter\'\x2C HandleDragEnter\x2C false);\n\tdocument.addEventListener(\'drop\'\x2C HandleDrop\x2C false);\n\tdocument.addEventListener(\'keydown\'\x2C HandleEscapePressed\x2C false);\n\tdocument.addEventListener(\'keydown\'\x2C HandleReturnPressed\x2C false);\n\tdocument.addEventListener(\'keydown\'\x2C HandleTabPressed\x2C false);\n\tdocument.addEventListener(\'paste\'\x2C HandlePaste\x2C false);\n\n\tdocument.addEventListener(\'keydown\'\x2C function(event) {\n\t\twindow.shiftKey \x3D event.shiftKey;\n\t}\x2C false);\n\tdocument.addEventListener(\'keyup\'\x2C function(event) {\n\t\twindow.shiftKey \x3D event.shiftKey;\n\t}\x2C false);\n</script>\n\n</head><body class\x3D\"chat\" id\x3D\"input\"></body></html>", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kSource4, Type = String, Dynamic = False, Default = \"<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"\n   \"http://www.w3.org/TR/html4/loose.dtd\">\n<html>\n<head>\n<title>-</title>\n<style id\x3D\"baseStyle\" type\x3D\"text/css\" media\x3D\"screen\x2Cprint\">\n* {\n\twhite-space: pre-wrap;\n\tword-wrap: break-word;\n\tword-break: hyphenate;\n\tmargin: 0;\n}\n\nhtml\x2C body {\n\tcolor: black;\n\tmin-height: 100%;\n\theight: 100%;\n\tbackground-color: white;\n}\n\nimg {\n\tmax-width: 100% !important;\n\theight: auto !important;\n\tvertical-align: baseline !important;\n}\n\na {\n\ttext-decoration:none;\n}\n\n.chat #input {\n\tmin-height: 100%;\n\theight: auto !important;\n\theight: 100%;\n\twidth: 100%;\n}\n\n.chat #input:focus {\n\toutline: none;\n}\n</style>\n\n<script>\n\tfunction RaiseEvent(name\x2C picture\x2C text\x2C html) {\n\t\tvar data \x3D \'{\"text\":\"\' + text + \'\"\x2C \"html\":\"\' + html + \'\"\x2C \"picture\":\"\' + picture + \'\"}\';\n\t\tdocument.title \x3D \'{\"name\":\"\' + name + \'\"\x2C \"data\":\"\' + encodeURIComponent(data) + \'\"\x2C \"random\":\"\' + String(Math.random()) + \'\"}\';\n\t}\n\n\n\tfunction HandleContextMenu(event) {\n\t\tevent.preventDefault();\n\t\tevent.stopImmediatePropagation();\n\n\t\tvar range \x3D window.getSelection().getRangeAt(0);\n\t\tvar content \x3D range.cloneContents();\n\t\tvar span \x3D document.createElement(\'span\');\n\t\tspan.appendChild(content);\n\t\tvar text \x3D span.innerText;\n\t\tvar html \x3D span.innerHTML;\n\n\t\tvar url \x3D event.target.src;\n\n\t\tvar img \x3D new Image();\n\t\timg.src \x3D url;\n\n\t\timg.onerror \x3D function() {\n\t\t\tRaiseEvent(\'ConstructContextualMenu\'\x2C \'\'\x2C encodeURIComponent(text)\x2C encodeURIComponent(html));\n\t\t}\n\t\timg.onload \x3D  function() { \n\t\t\tvar canvas \x3D document.createElement(\'canvas\');\n\t\t\tcanvas.width \x3D this.width;\n\t\t\tcanvas.height \x3D this.height;\n\t\t\tvar ctx \x3D canvas.getContext(\'2d\');\n\t\t\tctx.drawImage(this\x2C 0\x2C 0);\n\t\t\tRaiseEvent(\'ConstructContextualMenu\'\x2C canvas.toDataURL(\'image/png\')\x2C encodeURIComponent(url)\x2C encodeURIComponent(html));\n\t\t}\n\n\t\treturn false;\n\t}\n\n\n\n\tfunction HandleDragOver(event) {\n\t\tevent.preventDefault();\n\t}\n\n\tfunction HandleDragEnter(event) {\n\t\tevent.preventDefault();\n\t}\n\n\tfunction HandleDrop(event) {\n\t\tevent.preventDefault();\n\n\t\tvar files \x3D event.dataTransfer.files;\n\t\tvar url \x3D event.dataTransfer.getData(\'text/uri-list\');\n\t\tvar text \x3D event.dataTransfer.getData(\'text/plain\');\n\n\t\tif (files.length > 0) {\n\t\t\tvar f \x3D files[0];\n\t\t\tif (f.type.indexOf(\'image\') \x3D\x3D 0) {\n\t\t\t\tvar reader \x3D new FileReader();\n\t\t\t\treader.onload \x3D function(fevent) {\n\t\t\t\t\tRaiseEvent(\'Drop\'\x2C fevent.target.result\x2C \'\'\x2C \'\');\n\t\t\t\t}\n\t\t\t\treader.readAsDataURL(f);\n\t\t\t}\n\t\t} else if (url.length > 0) {\n\t\t\tvar img \x3D new Image();\n\t\t\timg.onerror \x3D function() {\n\t\t\t\tRaiseEvent(\'Drop\'\x2C \'\'\x2C encodeURIComponent(url)\x2C encodeURIComponent(\'<a href\x3D\"\'+url+\'\">\'+url+\'</a>\'));\n\t\t\t}\n\t\t\timg.onload \x3D  function() {\n\t\t\t\tvar canvas \x3D document.createElement(\'canvas\');\n\t\t\t\tcanvas.width \x3D this.width;\n\t\t\t\tcanvas.height \x3D this.height;\n\t\t\t\tvar ctx \x3D canvas.getContext(\'2d\');\n\t\t\t\tctx.drawImage(this\x2C 0\x2C 0);\n\t\t\t\tRaiseEvent(\'Drop\'\x2C canvas.toDataURL(\'image/png\')\x2C encodeURIComponent(url)\x2C encodeURIComponent(\'<a href\x3D\"\'+url+\'\">\'+url+\'</a>\'));\n\t\t\t}\n\t\t\timg.src \x3D url;\n\t\t} else if (text.length > 0) {\n\t\t\tRaiseEvent(\'Drop\'\x2C \'\'\x2C encodeURIComponent(text)\x2C encodeURIComponent(text));\n\t\t}\n\t}\n\n\n\n\tfunction HandleEscapePressed(event) {\n\t\tif (event.which \x3D\x3D 27) {\n\t\t\tRaiseEvent(\'EscapeKeyPressed\'\x2C \'\'\x2C \'\'\x2C \'\');\n\t\t\tevent.preventDefault();\n\t\t\tevent.stopImmediatePropagation();\n\t\t}\n\t}\n\n\n\n\tfunction HandleReturnPressed(event) {\n\t\tif (event.which \x3D\x3D 13) {\n\t\t\tRaiseEvent(\'ReturnKeyPressed\'\x2C \'\'\x2C \'\'\x2C \'\');\n\t\t\tevent.preventDefault();\n\t\t\tevent.stopImmediatePropagation();\n\t\t}\n\t}\n\n\n\n\tfunction HandleTabPressed(event) {\n\t\tif (event.which \x3D\x3D 9) {\n\t\t\tRaiseEvent(\'TabKeyPressed\'\x2C \'\'\x2C \'\'\x2C \'\');\n\t\t\tevent.preventDefault();\n\t\t\tevent.stopImmediatePropagation();\n\t\t}\n\t}\n\n\n\tfunction HandlePaste(event) {\n\t\tevent.preventDefault();\n\t\tvar data \x3D event.clipboardData.getData(\'text/plain\');\n\t\tif (data !\x3D\x3D \'\') {\n\t\t\tvar img \x3D new Image();\n\t\t\timg.src \x3D data;\n\t\t\timg.onerror \x3D function() {\n\t\t\t\tdocument.execCommand(\'insertText\'\x2C false\x2C data);\n\t\t\t}\n\t\t\timg.onload \x3D  function() {\n\t\t\t\t\tdocument.execCommand(\'insertImage\'\x2C false\x2C data);\n\t\t\t}\n\t\t} else {\n\t\t\tRaiseEvent(\'Paste\'\x2C \'\'\x2C \'\'\x2C \'\');  // possibly a picture on the clipboard\n\t\t}\n\t}\n\n\n\n\tfunction SetFocus(elementID) {\n\t\tvar elem \x3D document.getElementById(elementID);\n\t\telem.focus();\n\n\t\tvar selection \x3D document.getSelection();\n\t\tvar range \x3D selection.getRangeAt(0);\n\t\tselection.removeAllRanges();\n\t\trange.selectNodeContents(elem);\n\t\trange.collapse(false);\n\t\tselection.addRange(range);\n\t\tRaiseEvent(\'SetFocus\');\n\t}\n\n\tfunction SelectAfter(elementID) {\n\t\tvar elem \x3D document.getElementById(elementID);\n\t\telem.focus();\n\n\t\tvar selection \x3D document.getSelection();\n\t\tvar range \x3D selection.getRangeAt(0);\n\t\tselection.removeAllRanges();\n\t\trange.selectNodeContents(elem);\n\t\trange.collapse(false);\n\t\tselection.addRange(range);\n\t}\n\n\n\tdocument.addEventListener(\'contextmenu\'\x2C HandleContextMenu\x2C false);\n\tdocument.addEventListener(\'dragover\'\x2C HandleDragOver\x2C false);\n\tdocument.addEventListener(\'dragenter\'\x2C HandleDragEnter\x2C false);\n\tdocument.addEventListener(\'drop\'\x2C HandleDrop\x2C false);\n\tdocument.addEventListener(\'keydown\'\x2C HandleEscapePressed\x2C false);\n\tdocument.addEventListener(\'keydown\'\x2C HandleReturnPressed\x2C false);\n\tdocument.addEventListener(\'keydown\'\x2C HandleTabPressed\x2C false);\n\tdocument.addEventListener(\'paste\'\x2C HandlePaste\x2C false);\n\n\tdocument.addEventListener(\'keydown\'\x2C function(event) {\n\t\twindow.shiftKey \x3D event.shiftKey;\n\t}\x2C false);\n\tdocument.addEventListener(\'keyup\'\x2C function(event) {\n\t\twindow.shiftKey \x3D event.shiftKey;\n\t}\x2C false);\n</script>\n\n</head><body class\x3D\"chat\" id\x3D\"input\"></body></html>", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kSource5, Type = String, Dynamic = False, Default = \"<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"\n   \"http://www.w3.org/TR/html4/loose.dtd\">\n<html>\n<head>\n<title>-</title>\n<style id\x3D\"baseStyle\" type\x3D\"text/css\" media\x3D\"screen\x2Cprint\">\n* {\n\twhite-space: pre-wrap;\n\tword-wrap: break-word;\n\tword-break: hyphenate;\n\tmargin: 0;\n}\n\nhtml\x2C body {\n\tcolor: black;\n\tmin-height: 100%;\n\theight: 100%;\n\tbackground-color: white;\n}\n\nimg {\n\tmax-width: 100% !important;\n\theight: auto !important;\n\tvertical-align: baseline !important;\n}\n\na {\n\ttext-decoration:none;\n}\n\n#input {\n\tmin-height: 100%;\n\theight: auto !important;\n\theight: 100%;\n\twidth: 100%;\n}\n\n#input:focus {\n\toutline: none;\n}\n</style>\n\n<script>\n\tfunction RaiseEvent(name\x2C picture\x2C text\x2C html) {\n//\t\tvar data \x3D \'{\"text\":\"\' + text + \'\"\x2C \"html\":\"\' + html + \'\"\x2C \"picture\":\"\' + picture + \'\"}\';\n\t\tdocument.title \x3D \'{\"name\":\"\' + name + \'\"\x2C \"text\":\"\' + text + \'\"\x2C \"html\":\"\' + html + \'\"\x2C \"picture\":\"\' + picture + \'\"\x2C \"random\":\"\' + String(Math.random()) + \'\"}\';\n\t}\n\n\n\tfunction HandleContextMenu(event) {\n\t\tevent.preventDefault();\n\t\tevent.stopImmediatePropagation();\n\n\t\tvar range \x3D window.getSelection().getRangeAt(0);\n\t\tvar content \x3D range.cloneContents();\n\t\tvar span \x3D document.createElement(\'span\');\n\t\tspan.appendChild(content);\n\t\tvar text \x3D span.innerText;\n\t\tvar html \x3D span.innerHTML;\n\n\t\tvar url \x3D event.target.src;\n\n\t\tvar img \x3D new Image();\n\t\timg.src \x3D url;\n\n\t\timg.onerror \x3D function() {\n\t\t\tRaiseEvent(\'ConstructContextualMenu\'\x2C \'\'\x2C encodeURIComponent(text)\x2C encodeURIComponent(html));\n\t\t}\n\t\timg.onload \x3D  function() { \n\t\t\tvar canvas \x3D document.createElement(\'canvas\');\n\t\t\tcanvas.width \x3D this.width;\n\t\t\tcanvas.height \x3D this.height;\n\t\t\tvar ctx \x3D canvas.getContext(\'2d\');\n\t\t\tctx.drawImage(this\x2C 0\x2C 0);\n\t\t\tRaiseEvent(\'ConstructContextualMenu\'\x2C canvas.toDataURL(\'image/png\')\x2C encodeURIComponent(url)\x2C encodeURIComponent(html));\n\t\t}\n\n\t\treturn false;\n\t}\n\n\n\n\tfunction HandleDragOver(event) {\n\t\tevent.preventDefault();\n\t\tevent.dataTransfer.dropEffect \x3D \'copy\';\n\t}\n\n\tfunction HandleDragEnter(event) {\n\t\tevent.preventDefault();\n\t\tevent.dataTransfer.dropEffect \x3D \'copy\';\n\t}\n\n\tfunction HandleDrop(event) {\n\t\tevent.preventDefault();\n\t\tevent.dataTransfer.dropEffect \x3D \'copy\';\n\n\t\tvar files \x3D event.dataTransfer.files;\n\t\tvar url \x3D event.dataTransfer.getData(\'text/uri-list\');\n\t\tvar text \x3D event.dataTransfer.getData(\'text/plain\');\n\n\t\tif (files.length > 0) {\n\t\t\tvar f \x3D files[0];\n\t\t\tif (f.type.indexOf(\'image\') \x3D\x3D 0) {\n\t\t\t\tvar reader \x3D new FileReader();\n\t\t\t\treader.onload \x3D function(fevent) {\n\t\t\t\t\tRaiseEvent(\'Drop\'\x2C fevent.target.result\x2C \'\'\x2C \'\');\n\t\t\t\t}\n\t\t\t\treader.readAsDataURL(f);\n\t\t\t}\n\t\t} else if (url.length > 0) {\n\t\t\tvar img \x3D new Image();\n\t\t\timg.onerror \x3D function() {\n\t\t\t\tRaiseEvent(\'Drop\'\x2C \'\'\x2C encodeURIComponent(url)\x2C encodeURIComponent(\'<a href\x3D\"\'+url+\'\">\'+url+\'</a>\'));\n\t\t\t}\n\t\t\timg.onload \x3D  function() {\n\t\t\t\tvar canvas \x3D document.createElement(\'canvas\');\n\t\t\t\tcanvas.width \x3D this.width;\n\t\t\t\tcanvas.height \x3D this.height;\n\t\t\t\tvar ctx \x3D canvas.getContext(\'2d\');\n\t\t\t\tctx.drawImage(this\x2C 0\x2C 0);\n\t\t\t\tRaiseEvent(\'Drop\'\x2C canvas.toDataURL(\'image/png\')\x2C encodeURIComponent(url)\x2C encodeURIComponent(\'<a href\x3D\"\'+url+\'\">\'+url+\'</a>\'));\n\t\t\t}\n\t\t\timg.src \x3D url;\n\t\t} else if (text.length > 0) {\n\t\t\tRaiseEvent(\'Drop\'\x2C \'\'\x2C encodeURIComponent(text)\x2C encodeURIComponent(text));\n\t\t}\n\t}\n\n\n\n\tfunction HandleEscapePressed(event) {\n\t\tif (event.which \x3D\x3D 27) {\n\t\t\tRaiseEvent(\'EscapeKeyPressed\'\x2C \'\'\x2C \'\'\x2C \'\');\n\t\t\tevent.preventDefault();\n\t\t\tevent.stopImmediatePropagation();\n\t\t}\n\t}\n\n\n\n\tfunction HandleReturnPressed(event) {\n\t\tif (event.which \x3D\x3D 13) {\n\t\t\tRaiseEvent(\'ReturnKeyPressed\'\x2C \'\'\x2C encodeURIComponent(event.target.innerText)\x2C encodeURIComponent(event.target.innerHTML));\n\t\t\tevent.preventDefault();\n\t\t\tevent.stopImmediatePropagation();\n\t\t}\n\t}\n\n\n\n\tfunction HandleTabPressed(event) {\n\t\tif (event.which \x3D\x3D 9) {\n\t\t\tRaiseEvent(\'TabKeyPressed\'\x2C \'\'\x2C encodeURIComponent(event.target.innerText)\x2C encodeURIComponent(event.target.innerHTML));\n\t\t\tevent.preventDefault();\n\t\t\tevent.stopImmediatePropagation();\n\t\t}\n\t}\n\n\n\tfunction HandlePaste(event) {\n\t\tevent.preventDefault();\n\t\tvar data \x3D event.clipboardData.getData(\'text/plain\');\n\t\tif (data !\x3D\x3D \'\') {\n\t\t\tvar img \x3D new Image();\n\t\t\timg.src \x3D data;\n\t\t\timg.onerror \x3D function() {\n\t\t\t\tdocument.execCommand(\'insertText\'\x2C false\x2C data);\n\t\t\t}\n\t\t\timg.onload \x3D  function() {\n\t\t\t\t\tdocument.execCommand(\'insertImage\'\x2C false\x2C data);\n\t\t\t}\n\t\t} else {\n\t\t\tRaiseEvent(\'Paste\'\x2C \'\'\x2C \'\'\x2C \'\');  // possibly a picture on the clipboard\n\t\t}\n\t}\n\n\n\n\tfunction SetFocus(elementID) {\n\t\tvar elem \x3D document.getElementById(elementID);\n\t\telem.focus();\n\n\t\tvar selection \x3D document.getSelection();\n\t\tvar range \x3D selection.getRangeAt(0);\n\t\tselection.removeAllRanges();\n\t\trange.selectNodeContents(elem);\n\t\trange.collapse(false);\n\t\tselection.addRange(range);\n\t\tRaiseEvent(\'SetFocus\');\n\t}\n\n\tfunction SelectAfter(elementID) {\n\t\tvar elem \x3D document.getElementById(elementID);\n\t\telem.focus();\n\n\t\tvar selection \x3D document.getSelection();\n\t\tvar range \x3D selection.getRangeAt(0);\n\t\tselection.removeAllRanges();\n\t\trange.selectNodeContents(elem);\n\t\trange.collapse(false);\n\t\tselection.addRange(range);\n\t}\n\n\n\tdocument.addEventListener(\'contextmenu\'\x2C HandleContextMenu\x2C false);\n\tdocument.addEventListener(\'dragover\'\x2C HandleDragOver\x2C false);\n\tdocument.addEventListener(\'dragenter\'\x2C HandleDragEnter\x2C false);\n\tdocument.addEventListener(\'drop\'\x2C HandleDrop\x2C false);\n\tdocument.addEventListener(\'keydown\'\x2C HandleEscapePressed\x2C false);\n\tdocument.addEventListener(\'keydown\'\x2C HandleReturnPressed\x2C false);\n\tdocument.addEventListener(\'keydown\'\x2C HandleTabPressed\x2C false);\n\tdocument.addEventListener(\'paste\'\x2C HandlePaste\x2C false);\n\n\tdocument.addEventListener(\'keydown\'\x2C function(event) {\n\t\twindow.shiftKey \x3D event.shiftKey;\n\t}\x2C false);\n\tdocument.addEventListener(\'keyup\'\x2C function(event) {\n\t\twindow.shiftKey \x3D event.shiftKey;\n\t}\x2C false);\n</script>\n\n</head><body id\x3D\"input\"></body></html>", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kSource6, Type = String, Dynamic = False, Default = \"<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"\n   \"http://www.w3.org/TR/html4/loose.dtd\">\n<html>\n<head>\n<title>-</title>\n<style id\x3D\"baseStyle\" type\x3D\"text/css\" media\x3D\"screen\x2Cprint\">\n* {\n\twhite-space: pre-wrap;\n\tword-wrap: break-word;\n\tword-break: hyphenate;\n\tmargin: 0;\n}\n\nhtml\x2C body {\n\tcolor: black;\n\tmin-height: 100%;\n\theight: 100%;\n\tbackground-color: white;\n}\n\nimg {\n\tmax-width: 100% !important;\n\theight: auto !important;\n\tvertical-align: baseline !important;\n}\n\na {\n\ttext-decoration:none;\n}\n\n#input {\n\tmin-height: 100%;\n\theight: auto !important;\n\theight: 100%;\n\twidth: 100%;\n}\n\n#input:focus {\n\toutline: none;\n}\n</style>\n\n<script>\n\tfunction RaiseEvent(name\x2C picture\x2C text\x2C html) {\n\t\tdocument.title \x3D \'{\"name\":\"\' + name + \'\"\x2C \"text\":\"\' + text + \'\"\x2C \"html\":\"\' + html + \'\"\x2C \"picture\":\"\' + picture + \'\"\x2C \"random\":\"\' + String(Math.random()) + \'\"}\';\n\t}\n\n\n\n\tfunction HandleDragOver(event) {\n\t\tevent.preventDefault();\n\t\tevent.dataTransfer.dropEffect \x3D \'copy\';\n\t}\n\n\tfunction HandleDragEnter(event) {\n\t\tevent.preventDefault();\n\t\tevent.dataTransfer.dropEffect \x3D \'copy\';\n\t}\n\n\tfunction HandleDrop(event) {\n\t\tevent.preventDefault();\n\t\tevent.dataTransfer.dropEffect \x3D \'copy\';\n\n\t\tvar files \x3D event.dataTransfer.files;\n\t\tvar url \x3D event.dataTransfer.getData(\'text/uri-list\');\n\t\tvar text \x3D event.dataTransfer.getData(\'text/plain\');\n\n\t\tif (files.length > 0) {\n\t\t\tvar f \x3D files[0];\n\t\t\tif (f.type.indexOf(\'image\') \x3D\x3D 0) {\n\t\t\t\tvar reader \x3D new FileReader();\n\t\t\t\treader.onload \x3D function(fevent) {\n\t\t\t\t\tRaiseEvent(\'Drop\'\x2C fevent.target.result\x2C \'\'\x2C \'\');\n\t\t\t\t}\n\t\t\t\treader.readAsDataURL(f);\n\t\t\t}\n\t\t} else if (url.length > 0) {\n\t\t\tvar img \x3D new Image();\n\t\t\timg.onerror \x3D function() {\n\t\t\t\tRaiseEvent(\'Drop\'\x2C \'\'\x2C encodeURIComponent(url)\x2C encodeURIComponent(\'<a href\x3D\"\'+url+\'\">\'+url+\'</a>\'));\n\t\t\t}\n\t\t\timg.onload \x3D  function() {\n\t\t\t\tvar canvas \x3D document.createElement(\'canvas\');\n\t\t\t\tcanvas.width \x3D this.width;\n\t\t\t\tcanvas.height \x3D this.height;\n\t\t\t\tvar ctx \x3D canvas.getContext(\'2d\');\n\t\t\t\tctx.drawImage(this\x2C 0\x2C 0);\n\t\t\t\tRaiseEvent(\'Drop\'\x2C canvas.toDataURL(\'image/png\')\x2C encodeURIComponent(url)\x2C encodeURIComponent(\'<a href\x3D\"\'+url+\'\">\'+url+\'</a>\'));\n\t\t\t}\n\t\t\timg.src \x3D url;\n\t\t} else if (text.length > 0) {\n\t\t\tRaiseEvent(\'Drop\'\x2C \'\'\x2C encodeURIComponent(text)\x2C encodeURIComponent(text));\n\t\t}\n\t}\n\n\n\n\tfunction HandleEscapePressed(event) {\n\t\tif (event.which \x3D\x3D 27) {\n\t\t\tdocument.title \x3D \'escape \' + String(Math.random());\n\t\t\tevent.preventDefault();\n\t\t\tevent.stopImmediatePropagation();\n\t\t}\n\t}\n\n\n\n\tfunction HandleReturnPressed(event) {\n\t\tif (event.which \x3D\x3D 13) {\n\t\t\tdocument.title \x3D \'return \' + String(Math.random());\n\t\t\tevent.preventDefault();\n\t\t\tevent.stopImmediatePropagation();\n\t\t}\n\t}\n\n\n\n\tfunction HandleTabPressed(event) {\n\t\tif (event.which \x3D\x3D 9) {\n\t\t\tdocument.title \x3D \'tab \' + String(Math.random());\n\t\t\tevent.preventDefault();\n\t\t\tevent.stopImmediatePropagation();\n\t\t}\n\t}\n\n\n\tdocument.addEventListener(\'dragover\'\x2C HandleDragOver\x2C false);\n\tdocument.addEventListener(\'dragenter\'\x2C HandleDragEnter\x2C false);\n\tdocument.addEventListener(\'drop\'\x2C HandleDrop\x2C false);\n\tdocument.addEventListener(\'keydown\'\x2C HandleEscapePressed\x2C false);\n\tdocument.addEventListener(\'keydown\'\x2C HandleReturnPressed\x2C false);\n\tdocument.addEventListener(\'keydown\'\x2C HandleTabPressed\x2C false);\n</script>\n\n</head><body id\x3D\"input\"></body></html>", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kSource7, Type = String, Dynamic = False, Default = \"<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"\n   \"http://www.w3.org/TR/html4/loose.dtd\">\n<html>\n<head>\n<title>-</title>\n<style id\x3D\"baseStyle\" type\x3D\"text/css\" media\x3D\"screen\x2Cprint\">\n* {\n\twhite-space: pre-wrap;\n\tword-wrap: break-word;\n\tword-break: hyphenate;\n\tmargin: 0;\n}\n\nhtml\x2C body {\n\tcolor: black;\n\tmin-height: 100%;\n\theight: 100%;\n\tbackground-color: white;\n}\n\nimg {\n\tmax-width: 100% !important;\n\theight: auto !important;\n\tvertical-align: baseline !important;\n}\n\na {\n\ttext-decoration:none;\n}\n\n#input {\n\tmin-height: 100%;\n\theight: auto !important;\n\theight: 100%;\n\twidth: 100%;\n}\n\n#input:focus {\n\toutline: none;\n}\n</style>\n\n<script>\n\tfunction RaiseEvent(name\x2C picture\x2C text\x2C html) {\n\t\tdocument.title \x3D \'{\"name\":\"\' + name + \'\"\x2C \"text\":\"\' + text + \'\"\x2C \"html\":\"\' + html + \'\"\x2C \"picture\":\"\' + picture + \'\"\x2C \"random\":\"\' + String(Math.random()) + \'\"}\';\n\t}\n\n\n\n\tfunction HandleDragOver(event) {\n\t\tevent.preventDefault();\n\t\tevent.dataTransfer.dropEffect \x3D \'copy\';\n\t}\n\n\tfunction HandleDragEnter(event) {\n\t\tevent.preventDefault();\n\t\tevent.dataTransfer.dropEffect \x3D \'copy\';\n\t}\n\n\tfunction HandleDrop(event) {\n\t\tevent.preventDefault();\n\t\tevent.dataTransfer.dropEffect \x3D \'copy\';\n\n\t\tvar files \x3D event.dataTransfer.files;\n\t\tvar url \x3D event.dataTransfer.getData(\'text/uri-list\');\n\t\tvar text \x3D event.dataTransfer.getData(\'text/plain\');\n\n\t\tif (files.length > 0) {\n\t\t\tvar f \x3D files[0];\n\t\t\tif (f.type.indexOf(\'image\') \x3D\x3D 0) {\n\t\t\t\tvar reader \x3D new FileReader();\n\t\t\t\treader.onload \x3D function(fevent) {\n\t\t\t\t\tRaiseEvent(\'Drop\'\x2C fevent.target.result\x2C \'\'\x2C \'\');\n\t\t\t\t}\n\t\t\t\treader.readAsDataURL(f);\n\t\t\t}\n\t\t} else if (url.length > 0) {\n\t\t\tvar img \x3D new Image();\n\t\t\timg.onerror \x3D function() {\n\t\t\t\tRaiseEvent(\'Drop\'\x2C \'\'\x2C encodeURIComponent(url)\x2C encodeURIComponent(\'<a href\x3D\"\'+url+\'\">\'+url+\'</a>\'));\n\t\t\t}\n\t\t\timg.onload \x3D  function() {\n\t\t\t\tvar canvas \x3D document.createElement(\'canvas\');\n\t\t\t\tcanvas.width \x3D this.width;\n\t\t\t\tcanvas.height \x3D this.height;\n\t\t\t\tvar ctx \x3D canvas.getContext(\'2d\');\n\t\t\t\tctx.drawImage(this\x2C 0\x2C 0);\n\t\t\t\tRaiseEvent(\'Drop\'\x2C canvas.toDataURL(\'image/png\')\x2C encodeURIComponent(url)\x2C encodeURIComponent(\'<a href\x3D\"\'+url+\'\">\'+url+\'</a>\'));\n\t\t\t}\n\t\t\timg.src \x3D url;\n\t\t} else if (text.length > 0) {\n\t\t\tRaiseEvent(\'Drop\'\x2C \'\'\x2C encodeURIComponent(text)\x2C encodeURIComponent(text));\n\t\t}\n\t}\n\n\n\n\tfunction HandleEscapePressed(event) {\n\t\tif (event.which \x3D\x3D 27) {\n\t\t\tdocument.title \x3D \'escape \' + String(Math.random());\n\t\t\tevent.preventDefault();\n\t\t\tevent.stopImmediatePropagation();\n\t\t}\n\t}\n\n\n\n\tfunction HandleReturnPressed(event) {\n\t\tif (event.which \x3D\x3D 13) {\n\t\t\tdocument.title \x3D \'return \' + String(Math.random());\n\t\t\tevent.preventDefault();\n\t\t\tevent.stopImmediatePropagation();\n\t\t}\n\t}\n\n\n\n\tfunction HandleTabPressed(event) {\n\t\tif (event.which \x3D\x3D 9) {\n\t\t\tdocument.title \x3D \'tab \' + String(Math.random());\n\t\t\tevent.preventDefault();\n\t\t\tevent.stopImmediatePropagation();\n\t\t}\n\t}\n\n\n\tdocument.addEventListener(\'dragover\'\x2C HandleDragOver\x2C false);\n\tdocument.addEventListener(\'dragenter\'\x2C HandleDragEnter\x2C false);\n\tdocument.addEventListener(\'drop\'\x2C HandleDrop\x2C false);\n\tdocument.addEventListener(\'keydown\'\x2C HandleEscapePressed\x2C false);\n\tdocument.addEventListener(\'keydown\'\x2C HandleReturnPressed\x2C false);\n\tdocument.addEventListener(\'keydown\'\x2C HandleTabPressed\x2C false);\n</script>\n\n</head><body id\x3D\"input\"></body></html>", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kSource8, Type = String, Dynamic = False, Default = \"<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"\n   \"http://www.w3.org/TR/html4/loose.dtd\">\n<html>\n<head>\n<title>-</title>\n<style id\x3D\"baseStyle\" type\x3D\"text/css\" media\x3D\"screen\x2Cprint\">\n* {\n\twhite-space: pre-wrap;\n\tword-wrap: break-word;\n\tword-break: hyphenate;\n\tmargin: 0;\n}\n\nhtml\x2C body {\n\tcolor: black;\n\tmin-height: 100%;\n\theight: 100%;\n\tbackground-color: white;\n}\n\nimg {\n\tmax-width: 100% !important;\n\theight: auto !important;\n\tvertical-align: baseline !important;\n}\n\na {\n\ttext-decoration:none;\n}\n\n#input {\n\tmin-height: 100%;\n\theight: auto !important;\n\theight: 100%;\n\twidth: 100%;\n}\n\n#input:focus {\n\toutline: none;\n}\n</style>\n\n<script>\n\tfunction RaiseEvent(name\x2C picture\x2C text\x2C html) {\n\t\tdocument.title \x3D \'{\"name\":\"\' + name + \'\"\x2C \"text\":\"\' + text + \'\"\x2C \"html\":\"\' + html + \'\"\x2C \"picture\":\"\' + picture + \'\"\x2C \"random\":\"\' + String(Math.random()) + \'\"}\';\n\t}\n\n\n\n\tfunction HandleDragOver(event) {\n\t\tevent.preventDefault();\n\t\tevent.dataTransfer.dropEffect \x3D \'copy\';\n\t}\n\n\tfunction HandleDragEnter(event) {\n\t\tevent.preventDefault();\n\t\tevent.dataTransfer.dropEffect \x3D \'copy\';\n\t}\n\n\tfunction HandleDrop(event) {\n\t\tevent.preventDefault();\n\t\tevent.dataTransfer.dropEffect \x3D \'copy\';\n\n\t\tvar files \x3D event.dataTransfer.files;\n\t\tvar url \x3D event.dataTransfer.getData(\'text/uri-list\');\n\t\tvar text \x3D event.dataTransfer.getData(\'text/plain\');\n\n\t\tif (files.length > 0) {\n\t\t\tvar f \x3D files[0];\n\t\t\tif (f.type.indexOf(\'image\') \x3D\x3D 0) {\n\t\t\t\tvar reader \x3D new FileReader();\n\t\t\t\treader.onload \x3D function(fevent) {\n\t\t\t\t\tRaiseEvent(\'Drop\'\x2C fevent.target.result\x2C \'\'\x2C \'\');\n\t\t\t\t}\n\t\t\t\treader.readAsDataURL(f);\n\t\t\t}\n\t\t} else if (url.length > 0) {\n\t\t\tvar img \x3D new Image();\n\t\t\timg.onerror \x3D function() {\n\t\t\t\tRaiseEvent(\'Drop\'\x2C \'\'\x2C encodeURIComponent(url)\x2C encodeURIComponent(\'<a href\x3D\"\'+url+\'\">\'+url+\'</a>\'));\n\t\t\t}\n\t\t\timg.onload \x3D  function() {\n\t\t\t\tvar canvas \x3D document.createElement(\'canvas\');\n\t\t\t\tcanvas.width \x3D this.width;\n\t\t\t\tcanvas.height \x3D this.height;\n\t\t\t\tvar ctx \x3D canvas.getContext(\'2d\');\n\t\t\t\tctx.drawImage(this\x2C 0\x2C 0);\n\t\t\t\tRaiseEvent(\'Drop\'\x2C canvas.toDataURL(\'image/png\')\x2C encodeURIComponent(url)\x2C encodeURIComponent(\'<a href\x3D\"\'+url+\'\">\'+url+\'</a>\'));\n\t\t\t}\n\t\t\timg.src \x3D url;\n\t\t} else if (text.length > 0) {\n\t\t\tRaiseEvent(\'Drop\'\x2C \'\'\x2C encodeURIComponent(text)\x2C encodeURIComponent(text));\n\t\t}\n\t}\n\n\n\n\tfunction HandleEscapePressed(event) {\n\t\tif (event.which \x3D\x3D 27) {\n\t\t\tdocument.title \x3D \'escape \' + String(Math.random());\n\t\t\tevent.preventDefault();\n\t\t\tevent.stopImmediatePropagation();\n\t\t}\n\t}\n\n\n\n\tfunction HandleReturnPressed(event) {\n\t\tif (event.which \x3D\x3D 13) {\n\t\t\tdocument.title \x3D \'return \' + String(Math.random());\n\t\t\tevent.preventDefault();\n\t\t\tevent.stopImmediatePropagation();\n\t\t}\n\t}\n\n\n\n\tfunction HandleTabPressed(event) {\n\t\tif (event.which \x3D\x3D 9) {\n\t\t\tdocument.title \x3D \'tab \' + String(Math.random());\n\t\t\tevent.preventDefault();\n\t\t\tevent.stopImmediatePropagation();\n\t\t}\n\t}\n\n\n\tdocument.addEventListener(\'dragover\'\x2C HandleDragOver\x2C false);\n\tdocument.addEventListener(\'dragenter\'\x2C HandleDragEnter\x2C false);\n\tdocument.addEventListener(\'drop\'\x2C HandleDrop\x2C false);\n\tdocument.addEventListener(\'keydown\'\x2C HandleEscapePressed\x2C false);\n\tdocument.addEventListener(\'keydown\'\x2C HandleReturnPressed\x2C false);\n\tdocument.addEventListener(\'keydown\'\x2C HandleTabPressed\x2C false);\n</script>\n\n</head><body id\x3D\"input\"></body></html>", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kSource9, Type = String, Dynamic = False, Default = \"<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"\n   \"http://www.w3.org/TR/html4/loose.dtd\">\n<html>\n<head>\n<title>-</title>\n<style id\x3D\"baseStyle\" type\x3D\"text/css\" media\x3D\"screen\x2Cprint\">\n* {\n\twhite-space: pre-wrap;\n\tword-wrap: break-word;\n\tword-break: hyphenate;\n\tmargin: 0;\n}\n\nhtml\x2C body {\n\tcolor: black;\n\tmin-height: 100%;\n\theight: 100%;\n\tbackground-color: white;\n}\n\nimg {\n\tmax-width: 100% !important;\n\theight: auto !important;\n\tvertical-align: baseline !important;\n}\n\na {\n\ttext-decoration:none;\n}\n\n#input {\n\tmin-height: 100%;\n\theight: auto !important;\n\theight: 100%;\n\twidth: 100%;\n}\n\n#input:focus {\n\toutline: none;\n}\n</style>\n\n<script src\x3D\"%jquery%\"></script>\n\n<script>\n\tfunction RaiseEvent(name\x2C picture\x2C text\x2C html) {\n\t\tdocument.title \x3D \'{\"name\":\"\' + name + \'\"\x2C \"text\":\"\' + text + \'\"\x2C \"html\":\"\' + html + \'\"\x2C \"picture\":\"\' + picture + \'\"\x2C \"random\":\"\' + String(Math.random()) + \'\"}\';\n\t}\n\n\n\n\tfunction HandleDragOver(event) {\n\t\tevent.preventDefault();\n\t\tevent.dataTransfer.dropEffect \x3D \'copy\';\n\t}\n\n\tfunction HandleDragEnter(event) {\n\t\tevent.preventDefault();\n\t\tevent.dataTransfer.dropEffect \x3D \'copy\';\n\t}\n\n\tfunction HandleDrop(event) {\n\t\tevent.preventDefault();\n\t\tevent.dataTransfer.dropEffect \x3D \'copy\';\n\n\t\tvar files \x3D event.dataTransfer.files;\n\t\tvar url \x3D event.dataTransfer.getData(\'text/uri-list\');\n\t\tvar text \x3D event.dataTransfer.getData(\'text/plain\');\n\n\t\tif (files.length > 0) {\n\t\t\tvar f \x3D files[0];\n\t\t\tif (f.type.indexOf(\'image\') \x3D\x3D 0) {\n\t\t\t\tvar reader \x3D new FileReader();\n\t\t\t\treader.onload \x3D function(fevent) {\n\t\t\t\t\tRaiseEvent(\'Drop\'\x2C fevent.target.result\x2C \'\'\x2C \'\');\n\t\t\t\t}\n\t\t\t\treader.readAsDataURL(f);\n\t\t\t}\n\t\t} else if (url.length > 0) {\n\t\t\tvar img \x3D new Image();\n\t\t\timg.onerror \x3D function() {\n\t\t\t\tRaiseEvent(\'Drop\'\x2C \'\'\x2C encodeURIComponent(url)\x2C encodeURIComponent(\'<a href\x3D\"\'+url+\'\">\'+url+\'</a>\'));\n\t\t\t}\n\t\t\timg.onload \x3D  function() {\n\t\t\t\tvar canvas \x3D document.createElement(\'canvas\');\n\t\t\t\tcanvas.width \x3D this.width;\n\t\t\t\tcanvas.height \x3D this.height;\n\t\t\t\tvar ctx \x3D canvas.getContext(\'2d\');\n\t\t\t\tctx.drawImage(this\x2C 0\x2C 0);\n\t\t\t\tRaiseEvent(\'Drop\'\x2C canvas.toDataURL(\'image/png\')\x2C encodeURIComponent(url)\x2C encodeURIComponent(\'<a href\x3D\"\'+url+\'\">\'+url+\'</a>\'));\n\t\t\t}\n\t\t\timg.src \x3D url;\n\t\t} else if (text.length > 0) {\n\t\t\tRaiseEvent(\'Drop\'\x2C \'\'\x2C encodeURIComponent(text)\x2C encodeURIComponent(text));\n\t\t}\n\t}\n\n\n\n\tfunction HandleEscapePressed(event) {\n\t\tif (event.which \x3D\x3D 27) {\n\t\t\tdocument.title \x3D \'escape \' + String(Math.random());\n\t\t\tevent.preventDefault();\n\t\t\tevent.stopImmediatePropagation();\n\t\t}\n\t}\n\n\n\n\tfunction HandleReturnPressed(event) {\n\t\tif (event.which \x3D\x3D 13) {\n//\t\t\tdocument.title \x3D \'{\"type\" : \"return\"\x2C \"html\" : \"\' + encodeURIComponent(document.getElementById(\'input\').innerHTML) + \'\"\x2C \"text\" : \"\' + encodeURIComponent(document.getElementById(\'input\').innerText) + \'\"}\';\n\t\t\tdocument.title \x3D \'return \' + String(Math.random());\n\t\t\tevent.preventDefault();\n\t\t\tevent.stopImmediatePropagation();\n\t\t}\n\t}\n\n\n\n\tfunction HandleTabPressed(event) {\n\t\tif (event.which \x3D\x3D 9) {\n\t\t\tdocument.title \x3D \'tab \' + String(Math.random());\n\t\t\tevent.preventDefault();\n\t\t\tevent.stopImmediatePropagation();\n\t\t}\n\t}\n\n\n\tdocument.addEventListener(\'dragover\'\x2C HandleDragOver\x2C false);\n\tdocument.addEventListener(\'dragenter\'\x2C HandleDragEnter\x2C false);\n\tdocument.addEventListener(\'drop\'\x2C HandleDrop\x2C false);\n\tdocument.addEventListener(\'keydown\'\x2C HandleEscapePressed\x2C false);\n\tdocument.addEventListener(\'keydown\'\x2C HandleReturnPressed\x2C false);\n\tdocument.addEventListener(\'keydown\'\x2C HandleTabPressed\x2C false);\n</script>\n\n</head><body id\x3D\"input\"></body></html>", Scope = Private
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
			InitialValue="0"
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
