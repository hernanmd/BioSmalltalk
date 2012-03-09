instance creation
filesFromXMLDirectory: aDirectoryString
	" Answer a new instance of the receiver with XML file contents
	from aDirectoryString "
	
	^ self withAll: ( self readerClass filesFromXMLDirectory: aDirectoryString ).