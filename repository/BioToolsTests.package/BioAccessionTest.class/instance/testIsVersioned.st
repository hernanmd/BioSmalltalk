testing
testIsVersioned
	
	| accession |
	
	accession := BioAccession new 
					name: 'AF288373';
					version: 2;
					yourself.
	self assert: accession isVersioned.

	accession := BioAccession new 
					name: 'AF288373';
					yourself.
	self deny: accession isVersioned.
