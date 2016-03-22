testing
testHasVersion
	
	| accession |
	
	accession := BioAccession new 
					name: 'AF288373';
					version: 2;
					yourself.
	self assert: accession hasVersion.

	accession := BioAccession new 
					name: 'AF288373';
					yourself.
	self deny: accession hasVersion.

	accession := BioAccession new 
					name: 'AF288373';
					version: nil;
					yourself.
	self deny: accession hasVersion.
