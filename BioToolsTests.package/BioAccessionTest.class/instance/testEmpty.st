testing
testEmpty

	self deny: 'AF288373.2' asAccession isEmpty.
	self deny: ( BioAccession new 
					name: 'AF288373';
					version: 2;
					yourself ) isEmpty.
	self assert: ( BioAccession new 
					name: String empty;
					version: 2;
					yourself ) isEmpty.
	self assert: BioAccession new isEmpty.
	
	self should: [ String empty asAccession ] raise: BioException.