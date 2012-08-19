initialize-release
initializeFor: aString

	( self importersFor: aString ) do: [ : cls | cls initialize ]