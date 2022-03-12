#tag Class
Protected Class URLComponents
	#tag Method, Flags = &h0
		Sub Constructor(URL As Text)
		  // A XFURL object represents a URL that can potentially contain the location
		  // of a resource on a remote server, the path of a local file on disk, or even an arbitrary piece of encoded data.
		  //
		  // You can use URL objects to construct URLs and access their parts. For URLs that
		  // represent local files, you can also manipulate properties of those files directly,
		  // such as changing the file’s last modification date. Finally, you can pass URL objects
		  // to other APIs to retrieve the contents of those URLs.
		  
		  if (NOT URL.Empty) then
		    CONST searchPattern = "^((?P<schema>[^:\/?#]+):)?(\/?\/?(?P<authority>[^\/?#]*))?(?P<path>[^?#]*)(\?(?P<query>[^#]*))?(#(?P<fragment>.*))?$"
		    
		    DIM aRegEx As NEW RegEx
		    aRegEx.SearchPattern = searchPattern
		    
		    DIM match As RegExMatch
		    match = aRegEx.Search(URL)
		    
		    DIM count As Integer = match.SubExpressionCount
		    if (count > 0) then
		      me.mScheme = match.SubExpressionString(2).ToText  ' scheme
		      me.mResourceSpecifier = match.SubExpressionString(3).ToText
		      me.ParseAuthority match.SubExpressionString(4).ToText  ' authority
		      me.mPath = match.SubExpressionString(5).ToText  ' path
		      
		      if (count > 6) then
		        me.mResourceSpecifier = me.mResourceSpecifier + match.SubExpressionString(6).ToText
		        me.mQuery = match.SubExpressionString(7).ToText  ' query
		      end if
		      
		      if (count = 10) then
		        me.mResourceSpecifier = me.mResourceSpecifier + match.SubExpressionString(8).ToText
		        me.mFragment = match.SubExpressionString(9).ToText  ' fragment
		      end if
		      
		      me.mAbsoluteString = URL
		    end if
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As Text
		  Return me.AbsoluteString
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As Xojo.Core.Dictionary
		  DIM results As NEW Xojo.Core.Dictionary
		  results.Value("AbsoluteString") = me.mAbsoluteString
		  results.Value("Fragment") = me.mFragment
		  results.Value("Host") = me.mHost
		  results.Value("Password") = me.mPassword
		  results.Value("Path") = me.mPath
		  results.Value("Port") = me.mPort
		  results.Value("Query") = me.mQuery
		  results.Value("ResourceSpecifier") = me.mResourceSpecifier
		  results.Value("Scheme") = me.mScheme
		  results.Value("User") = me.mUser
		  
		  Return results
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ParseAuthority(authority As Text)
		  try
		    CONST searchPattern = "(?:(?P<userinfo>(?:[A-Za-z0-9\-._~!$&\'()*+,;=:]|%[0-9A-Fa-f]{2})*)@)?(?P<host>(?:[A-Za-z0-9\-._~!$&\'()*+,;=]|%[0-9A-Fa-f]{2})+)(?::(?P<port>[0-9]*))?"
		    // create the RegEx object and add our expression as the search pattern
		    DIM aRegEx As NEW RegEx
		    aRegEx.SearchPattern = searchPattern
		    
		    DIM match As RegExMatch
		    match = aRegEx.Search(authority)
		    
		    DIM count As Integer = match.SubExpressionCount
		    if (count > 0) then
		      DIM credentials() As Text = match.SubExpressionString(1).ToText.Split(":")
		      REDIM credentials(1)  // make sure there are two elements (user, password) Note: can be empty
		      me.mUser = credentials(0)  // The user portion of the URL
		      me.mPassword = credentials(1)  // The password of the URL
		      
		      me.mHost = match.SubExpressionString(2).ToText  // The host of the URL
		    end if
		    
		    if (count = 4) then  // custom port
		      me.mPort = Val(match.SubExpressionString(3))
		    end if
		  end try
		End Sub
	#tag EndMethod


	#tag Note, Name = 2.0.0
		
		2018-01-26
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


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return me.mAbsoluteString
			End Get
		#tag EndGetter
		AbsoluteString As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // This property contains the URL’s fragment.
			  // For example, in the URL http://www.example.com/index.html#jumpLocation, the fragment identifier is jumpLocation.
			  
			  Return me.mFragment
			End Get
		#tag EndGetter
		Fragment As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // This property contains the host.
			  // For example, in the URL http://www.example.com/index.html, the host is www.example.com.
			  
			  // If the receiver does not conform to RFC 1808, this property contains an empty string.
			  // The litmus test for conformance to RFC 1808 is as recommended in RFC 1808—specifically,
			  // whether the first two characters of resourceSpecifier are slashes (//).
			  
			  Return me.mHost
			End Get
		#tag EndGetter
		Host As Text
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mAbsoluteString As Text
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mFragment As Text
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mHost As Text
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPassword As Text
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPath As Text
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPort As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mQuery As Text
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mResourceSpecifier As Text
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mScheme As Text
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mUser As Text
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // This property contains the password.
			  // If the receiver does not conform to RFC 1808, it contains nil.
			  // For example, in the URL http://username:password@www.example.com/index.html, the password is password.
			  
			  Return me.mPassword
			End Get
		#tag EndGetter
		Password As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // Returns the path of a URL conforming to RFC 1808
			  
			  Return me.mPath
			End Get
		#tag EndGetter
		Path As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // This property contains the port number.
			  // For example, in the URL http://www.example.com:8080/index.php, the port number is 8080.
			  
			  Return me.mPort
			End Get
		#tag EndGetter
		Port As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // This property contains the query string.
			  // If the receiver does not conform to RFC 1808, this property contains an empty string.
			  // For example, in the URL http://www.example.com/index.php?key1=value1&key2=value2,
			  // the query string is key1=value1&key2=value2.
			  
			  Return me.mQuery
			End Get
		#tag EndGetter
		Query As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // Return Value
			  // The resource specifier of the URL. For example, in the URL
			  // http://www.example.com/index.html?key1=value1#jumplink, the resource specifier
			  // is //www.example.com/index.html?key1=value1#jumplink (everything after the colon).
			  
			  Return me.mResourceSpecifier
			End Get
		#tag EndGetter
		ResourceSpecifier As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // This property contains the scheme.
			  // For example, in the URL http://www.example.com/index.html, the scheme is http.
			  
			  Return me.mScheme
			End Get
		#tag EndGetter
		Scheme As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // This property contains the user name.
			  // For example, in the URL ftp://username@www.example.com/, the user name is username.
			  
			  Return me.mUser
			End Get
		#tag EndGetter
		User As Text
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AbsoluteString"
			Group="Behavior"
			Type="Text"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Fragment"
			Group="Behavior"
			Type="Text"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Host"
			Group="Behavior"
			Type="Text"
			EditorType="MultiLineEditor"
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
			Name="Password"
			Group="Behavior"
			Type="Text"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Path"
			Group="Behavior"
			Type="Text"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Port"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Query"
			Group="Behavior"
			Type="Text"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ResourceSpecifier"
			Group="Behavior"
			Type="Text"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Scheme"
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
			Name="User"
			Group="Behavior"
			Type="Text"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
