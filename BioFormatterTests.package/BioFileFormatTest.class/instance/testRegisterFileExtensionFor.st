testing
testRegisterFileExtensionFor

	BioFileFormat removeFormat: 'txt'.
	self deny: ( BioFileFormat fileExtensionsFor: 'Text File' ) = #('txt').
	BioFileFormat
	   registerFormat: 'Text File'
	   extensions: #('txt')
	   description: 'General Text File Format'
	   rootClass: BioCSVFile.
	self assert: (( BioFileFormat fileExtensionsFor: 'Text File' ) bioHasEqualElements: #('txt')).
	BioFileFormat removeFormat: 'txt'.