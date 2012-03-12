testing
testName
	
	| accession |
	
	accession := BioAccession new 
					name: 'AF288373';
					version: 2;
					yourself.
	self assert: accession name = 'AF288373'.

	accession := BioAccession new.
	self assert: accession asString = accession nullName.

