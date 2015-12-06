initialization
initialize: aFilename
	" Private - Initialize the receiver's data "

	self name: aFilename.
	self initializeGraphers: aFilename asFileReference contents.