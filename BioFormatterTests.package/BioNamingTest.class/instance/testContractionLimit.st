testing
testContractionLimit

	formatter := BioContractionNaming new.
	
	self assert: ( formatter format: 'South Africa One' ) = 'SAO'.
	self assert: ( formatter format: 'Belgian White and Blue Pied' ) = 'BWA'.
	
	formatter contractionLimit: 2.
	self assert: ( formatter format: 'South Africa One' ) size = 2.
	self assert: ( formatter format: 'South Africa One' ) = 'SA'.
	
	formatter contractionLimit: 1.
	self assert: ( formatter format: 'South Africa One' ) size = 1.
	self assert: ( formatter format: 'South Africa One' ) = 'S'.
	
	formatter contractionLimit: 5.
	self should: [ formatter format: 'South Africa One' ] raise: BioErrorSpecificationObject.
