initialize-release
initializeWith: aString
	" Private - Set the receiver's parser "
	
	super initialize.
	self expression: aString.
	parser := XMLPullParser parse: self expression.