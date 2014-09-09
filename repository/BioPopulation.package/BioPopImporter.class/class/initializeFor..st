initialize-release
initializeFor: aString
	" Initialize each importer corresponding aString "

	(self importersFor: aString) do: [ : cls | cls initialize ]