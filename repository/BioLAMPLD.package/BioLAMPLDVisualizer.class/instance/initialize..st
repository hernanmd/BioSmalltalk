initialization
initialize: aString
	" Private - Initialize the receiver's data "

	self name: aString.
	self initializeDataPoints: aString asFileReference contents.