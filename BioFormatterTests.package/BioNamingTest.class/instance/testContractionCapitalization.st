testing
testContractionCapitalization

	formatter := BioContractionNaming new.
	
	formatter unsetCapitalization.
	self assert: ( formatter format: 'South africa One' ) = 'SaO'.
	self assert: ( formatter format: 'Belgian White and Blue Pied' ) = 'BWa'.
	
	formatter setCapitalization.
	self assert: ( formatter format: 'South Africa One' ) = 'SAO'.
	self assert: ( formatter format: 'Belgian White and Blue Pied' ) = 'BWA'.

