instance creation
newFromReader: aReader
	" Answer a new instance of the receiver setting its reader "

	^ self new reader: aReader