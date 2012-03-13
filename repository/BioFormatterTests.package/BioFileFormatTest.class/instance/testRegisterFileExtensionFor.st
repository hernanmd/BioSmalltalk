testing
testRegisterFileExtensionFor

	BioFileFormat removeFormat: 'Text File'.
	self deny: ( BioFileFormat fileExtensionsFor: 'Text File' ) = #('txt').
	BioFileFormat
	   registerFormat: 'Text File'
	   extensions: #('txt')
	   description: 'General Text File Format'
	   rootClass: BioCSVFile.
	self assert: ( BioFileFormat fileExtensionsFor: 'Text File' ) = #('txt').