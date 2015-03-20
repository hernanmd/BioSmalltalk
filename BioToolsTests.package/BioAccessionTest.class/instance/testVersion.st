testing
testVersion
	
	| accession |
	
	accession := BioAccession new 
					name: 'AF288373';
					version: 2;
					yourself.
	self assert: accession version = 2.

	accession := BioAccession new 
					name: 'AF288373';
					yourself.
	self deny: accession isVersioned.
	self assert: accession version isNil.
