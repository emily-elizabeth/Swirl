#tag Class
Protected Class UINewsViewer
Inherits HTMLViewer
	#tag Event
		Sub DocumentComplete(URL as String)
		  me.Reload
		  
		  RaiseEvent DocumentComplete URL
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub AddArticleToDictionary(append As Boolean, nick As Text, time As Xojo.Core.Date, message As Text)
		  DIM theRegex As RegEx = new RegEx
		  theRegex.Options.DotMatchAll = true
		  theRegex.Options.Greedy = True
		  theRegex.SearchPattern = "\b(https?://|www\.)([^<>\s]+)"
		  theRegex.ReplacementPattern = "<a href=""\1\2"">\1\2</a>\3"
		  theRegex.Options.ReplaceAllMatches = True
		  message = theRegex.Replace(message).ToText
		  
		  DIM article As NEW Xojo.Core.Dictionary
		  message = ReplaceLineEndings(message, "</br>").ToText
		  article.Value("articleBody") = me.Escape(message)
		  article.Value("articleAuthor") = me.Escape(nick)
		  article.Value("articleDate") = if(time = Nil, "", me.Escape(time.ToText))
		  
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
		Private Sub AddArticleToViewer(append As Boolean, data As Xojo.Core.Dictionary)
		  DIM div As Text = me.mTemplate
		  div = div.Replace("$ArticleBody$", data.Value("articleBody"))
		  div = div.Replace("$ArticleAuthor$", data.Value("articleAuthor"))
		  div = div.Replace("$ArticleDate$", data.Value("articleDate"))
		  
		  if (append) then
		    me.ExecuteJavaScript "document.getElementById('News').insertAdjacentHTML('beforeend', '" + div + "');"
		  else
		    me.ExecuteJavaScript "document.getElementById('News').insertAdjacentHTML('afterbegin', '" + div + "');"
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AppendArticle(nick As Text, time As Xojo.Core.Date, message As Text)
		  me.AddArticleToDictionary TRUE, nick, time, message
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Clear()
		  REDIM self.mArticles(-1)
		  me.LoadPage me.mSource, GetTemporaryFolderItem()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  me.Renderer = 1  // WebKit
		  
		  // Calling the overridden superclass constructor.
		  Super.Constructor
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
		Private Function Escape(value As Text) As Text
		  value = value.ReplaceAll("\", "\\")   // slashes
		  value = value.ReplaceAll("""", "\""")  // quotes
		  value = value.ReplaceAll("'", "\'")     // apostrophes
		  value = value.ReplaceAll(Chr(9).ToText, " ") // TAB
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

	#tag Method, Flags = &h0
		Sub PrependArticle(nick As Text, time As Xojo.Core.Date, message As Text)
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
		Event DocumentComplete(URL As String)
	#tag EndHook


	#tag Property, Flags = &h21
		Private mArticles() As Xojo.Core.Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSource As Text
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mStyle As Xojo.IO.FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTemplate As Text
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
		Style As Xojo.IO.FolderItem
	#tag EndComputedProperty


	#tag Constant, Name = kSourceTemplate, Type = Text, Dynamic = False, Default = \"<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01//EN\" \"http://www.w3.org/TR/html4/strict.dtd\">\n<html>\n<head>\n\t<meta http-equiv\x3D\"content-type\" content\x3D\"text/html; charset\x3Dutf-8\" />\n\t<base href\x3D\"%@\">\n\n\t<style type\x3D\"text/css\">\n\t\t.actionMessageUserName { display:none; }\n\t\t.actionMessageBody:before { content:\"*\"; }\n\t\t.actionMessageBody:after { content:\"*\"; }\n\t\t* { word-wrap:break-word; text-rendering: optimizelegibility; }\n\t\timg.scaledToFitImage { height: auto; max-width: 100%%; }\n\t</style>\n\n\t<!-- This style is shared by all variants. !-->\n\t<style id\x3D\"baseStyle\" type\x3D\"text/css\" media\x3D\"screen\x2Cprint\">\n\t\t@import url( \"%@\" );\n\t</style>\n\n</head>\n<body onload\x3D\"initStyle();\" style\x3D\"\x3D\x3DbodyBackground\x3D\x3D\">\n<div id\x3D\"News\">\n</div>\n</body>\n</html>", Scope = Private
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
			InitialValue="0"
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
