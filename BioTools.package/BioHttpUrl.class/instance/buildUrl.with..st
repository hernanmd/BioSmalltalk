accessing
buildUrl: pathPrefix with: aPath
	" Append aString as the receiver's command name "

	| urlString |
	
	urlString := pathPrefix , aPath.
	self path removeLast.
	self path addLast: urlString