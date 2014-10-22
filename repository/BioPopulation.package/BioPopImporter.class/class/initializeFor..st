initialize-release
initializeFor: aString
	" Initialize each importer corresponding aString "

	(self importersFor: aString) do: [ : cls | 
		self bioLog: 'Initializing importer...' , cls asString.
		cls initialize ]