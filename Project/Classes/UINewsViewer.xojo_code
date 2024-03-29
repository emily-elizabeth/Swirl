#tag Class
Protected Class UINewsViewer
Inherits DesktopHTMLViewer
	#tag Event
		Function CancelLoad(URL as String) As Boolean
		  if (URL.Left(4) = "link") then
		    DIM u As String = URL.Replace("link://", "")
		    if (u = "") then
		      Return FALSE
		    elseif (u.Left(4) = "http") then
		      u = u.Replace("//", "://")
		      Return CancelLoad(u)
		    else
		      Return CancelLoad("http://" + u)
		    end if
		  end if
		  
		  Return CancelLoad(URL)
		End Function
	#tag EndEvent

	#tag Event
		Sub DocumentComplete(url as String)
		  me.Reload
		  
		  RaiseEvent DocumentComplete URL
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub AddArticleToDictionary(append As Boolean, nick As String, time As DateTime, message As String)
		  if (message.Length > 4) AND (message.Left(4) <> "<img") then
		    DIM theRegex As RegEx = new RegEx
		    theRegex.Options.DotMatchAll = true
		    theRegex.Options.Greedy = True
		    theRegex.SearchPattern = "\b(https?://|www\.)([^<>\s]+)"
		    theRegex.ReplacementPattern = "<a href=""link://\1\2"">\1\2</a>"
		    theRegex.Options.ReplaceAllMatches = True
		    message = theRegex.Replace(message)
		  end if
		  
		  DIM article As NEW Dictionary
		  message = ReplaceLineEndings(message, "</br>")
		  article.Value("articleBody") = me.Escape(message)
		  article.Value("articleAuthor") = me.Escape(nick)
		  article.Value("articleDate") = if(time = Nil, "", me.Escape(time.ToString))
		  
		  if (me.mArticles.IndexOf(article) = -1) then
		    if (append) then
		      me.mArticles.Append article
		    else
		      me.mArticles.Insert 0, article
		    end if
		  end if
		  
		  me.AddArticleToViewer append, article
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub AddArticleToViewer(append As Boolean, data As Dictionary)
		  DIM div As String = me.mTemplate
		  div = div.ReplaceAll("$ArticleBody$", data.Value("articleBody"))
		  div = div.ReplaceAll("$ArticleAuthor$", data.Value("articleAuthor"))
		  div = div.ReplaceAll("$ArticleDate$", data.Value("articleDate"))
		  div = div.ReplaceAll("$ArticleLink$", "")
		  div = div.ReplaceAll("$ArticleTitle$", "")
		  div = div.ReplaceAll("$ArticleEnclosureLink$", "")
		  div = div.ReplaceAll("$ArticleEnclosureFilename$", "")
		  div = div.ReplaceAll("$FeedTitle$", "")
		  div = div.ReplaceAll("$FeedLink$", "")
		  div = div.ReplaceAll("$FeedDescription$", "")
		  
		  if (append) then
		    me.ExecuteJavaScript "document.getElementById('News').insertAdjacentHTML('beforeend', '" + div + "');"
		  else
		    me.ExecuteJavaScript "document.getElementById('News').insertAdjacentHTML('afterbegin', '" + div + "');"
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AppendArticle(nick As String, time As DateTime, message As String)
		  me.AddArticleToDictionary TRUE, nick, time, message
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Clear()
		  REDIM self.mArticles(-1)
		  
		  #if TargetWindows
		    DIM f As FolderItem = SpecialFolder.Temporary.Child("uinewsviewer-" + System.Microseconds.ToString + ".html")
		    DIM t As TextOutputStream = TextOutputStream.Create(f)
		    t.Write me.mSource
		    t.Close
		    me.LoadURL f.URLPath
		  #else
		    me.GrantAccessToFolder me.mStyle
		    me.LoadPage me.mSource, GetTemporaryFolderItem()
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CreateSource()
		  me.mSource = me.kSourceTemplate
		  
		  // set the base href path
		  me.mSource = me.mSource.Replace("%@", me.mStyle.URLPath)
		  
		  // set the css
		  me.mSource = me.mSource.Replace("%@", me.mStyle.Child("stylesheet.css").URLPath)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Escape(value As String) As String
		  value = value.ReplaceAll("\", "\\")   // slashes
		  value = value.ReplaceAll("""", "\""")  // quotes
		  value = value.ReplaceAll("'", "\'")     // apostrophes
		  value = value.ReplaceAll(Chr(9), " ") // TAB
		  value = ReplaceLineEndings(value, "")
		  
		  Return value
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub GrantAccessToFolder(inFolder as FolderItem)
		  #if (TargetMacOS) AND (XojoVersion >= 2020.01) then
		    // copied from https://forum.xojo.com/t/new-problem-with-htmlviewer-loadpage-since-version-2020-r1/56514/7
		    // --- Originally created in July 2020. <--- Leave this info here so it's easier to track which version of the code.
		    //     Published Sep 1st 2020.
		    //     written by Sam Rowlands of Ohanaware.com
		    //     Apple documentation for this API: https://developer.apple.com/documentation/webkit/wkwebview/1414973-loadfileurl?language=objc
		    
		    Declare Function NSClassFromString Lib "Foundation" (inClassName As CFStringRef) As Integer
		    Declare Function NSURLfileURLWithPathIsDirectory Lib "Foundation" Selector "fileURLWithPath:isDirectory:" (NSURLClass As Integer, path As CFStringRef, directory As Boolean) As Integer
		    Declare Function WKWebViewloadFileURL Lib "WebKit" Selector "loadFileURL:allowingReadAccessToURL:" (HTMLViewer As Ptr, URL As Integer, readAccessURL As Integer) As Integer
		    
		    // --- Create a NSURL object from a Xojo Folderitem.
		    DIM folderURL As Integer = NSURLfileURLWithPathIsDirectory(NSClassFromString("NSURL"), inFolder.NativePath, inFolder.IsFolder)
		    
		    // --- This bit is not technically correct. The first parameter after the instance should actually be the page that you're trying to load.
		    //     But as we're not loading a page per say... For the purpose of just setting access rights, we ignore the return
		    //     value as we don't need to display progress.
		    Call WKWebViewloadFileURL(me.Handle, folderURL, folderURL)
		  #EndIf
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function OpenAsText(path As FolderItem) As String
		  DIM value As String
		  
		  if (path <> Nil) AND (path.Exists) AND (NOT path.IsFolder) then
		    DIM stream As TextInputStream = TextInputStream.Open(path)
		    value = stream.ReadAll()
		    stream.Close()
		  end if
		  
		  Return value
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PrependArticle(nick As String, time As DateTime, message As String)
		  me.AddArticleToDictionary FALSE, nick, time, message
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Reload()
		  if (me.mArticles.Ubound > -1) then
		    for i as Integer = 0 to me.mArticles.Ubound
		      me.AddArticleToViewer TRUE, me.mArticles(i)
		    next
		  end if
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event CancelLoad(URL As String) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DocumentComplete(URL As String)
	#tag EndHook


	#tag Property, Flags = &h21
		Private mArticles() As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSource As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mStyle As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTemplate As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mStyle
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  try
			    if (value.IsFolder) AND (value.Name.IndexOf(".viennastyle") > -1) then  // passed in the path to a Vienna Style bundle
			      me.mStyle = value
			    elseif (NOT value.IsFolder) AND (value.Parent.Name.IndexOf(".viennastyle") > -1) AND ((value.Name = "template.html") OR (value.Name = "stylesheet.css")) then
			      me.mStyle = value.Parent
			    else
			      DIM err As NEW Xojo.IO.IOException
			      err.Reason = "Not a valid Vienna-RSS style."
			      err.Message = "Not a valid Vienna-RSS style."
			      Raise err
			    end if
			    
			    me.mTemplate = me.OpenAsText(me.mStyle.Child("template.html"))
			    me.mTemplate = me.Escape(me.mTemplate)
			    
			    me.CreateSource
			    
			    #if TargetWindows
			      DIM f As FolderItem = SpecialFolder.Temporary.Child("mynews.html")
			      DIM t As TextOutputStream = TextOutputStream.Create(f)
			      t.Write me.mSource
			      t.Close
			      me.LoadURL f.URLPath
			    #else
			      me.GrantAccessToFolder me.mStyle
			      me.LoadPage me.mSource, GetTemporaryFolderItem()
			    #endif
			    
			  catch e As Xojo.IO.IOException
			    Raise e
			  end try
			End Set
		#tag EndSetter
		Style As FolderItem
	#tag EndComputedProperty


	#tag Constant, Name = kSourceTemplate, Type = Text, Dynamic = False, Default = \"<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01//EN\" \"http://www.w3.org/TR/html4/strict.dtd\">\n<html>\n<head>\n\t<meta http-equiv\x3D\"content-type\" content\x3D\"text/html; charset\x3Dutf-8\" />\n\t<base href\x3D\"%@\">\n\n\t<style type\x3D\"text/css\">\n\t\t.actionMessageUserName { display:none; }\n\t\t.actionMessageBody:before { content:\"*\"; }\n\t\t.actionMessageBody:after { content:\"*\"; }\n\t\t* { word-wrap:break-word; text-rendering: optimizelegibility; }\n\t\timg.scaledToFitImage { height: auto; max-width: 100%%; }\n\t</style>\n\n\t<!-- This style is shared by all variants. !-->\n\t<style id\x3D\"baseStyle\" type\x3D\"text/css\" media\x3D\"screen\x2Cprint\">\n\t\t@import url( \"%@\" );\n\t</style>\n\n<style id\x3D\"imageConstrain\" type\x3D\"text/css\" media\x3D\"screen\x2Cprint\">\n\t.swirlImage {\n\t\tmax-width: 500px;\n\t\tmin-height: 120px;\n\t\tmax-height: auto;\n\t}\n</style>\n\n</head>\n<body onload\x3D\"initStyle();\" style\x3D\"\x3D\x3DbodyBackground\x3D\x3D\" oncontextmenu\x3D\"return false;\">\n<div id\x3D\"News\">\n</div>\n</body>\n</html>", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kSourceTemplate1, Type = Text, Dynamic = False, Default = \"<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01//EN\" \"http://www.w3.org/TR/html4/strict.dtd\">\n<html>\n<head>\n\t<meta http-equiv\x3D\"content-type\" content\x3D\"text/html; charset\x3Dutf-8\" />\n\t<base href\x3D\"%@\">\n\n\t<style type\x3D\"text/css\">\n\t\t.actionMessageUserName { display:none; }\n\t\t.actionMessageBody:before { content:\"*\"; }\n\t\t.actionMessageBody:after { content:\"*\"; }\n\t\t* { word-wrap:break-word; text-rendering: optimizelegibility; }\n\t\timg.scaledToFitImage { height: auto; max-width: 100%%; }\n\t</style>\n\n\t<!-- This style is shared by all variants. !-->\n\t<style id\x3D\"baseStyle\" type\x3D\"text/css\" media\x3D\"screen\x2Cprint\">\n\t\t@import url( \"%@\" );\n\t</style>\n\n</head>\n<body onload\x3D\"initStyle();\" style\x3D\"\x3D\x3DbodyBackground\x3D\x3D\">\n<div id\x3D\"News\">\n</div>\n</body>\n</html>", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="InitialParent"
			Visible=false
			Group="Position"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Tooltip"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="200"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
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
			InitialValue=""
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Visible=false
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="200"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
