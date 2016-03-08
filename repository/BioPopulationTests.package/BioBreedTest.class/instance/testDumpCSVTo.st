testing
testDumpCSVTo

	| fileStream |
	
	fileStream := 'testBioBreedDumpCSVTo.csv' asFileReference writeStream.
	self population
		addName: 'Red deer';
		addSynonym: 'Cervus elaphus';		
		addLocation: 'Szeged';
		addLocation: 'Southern Great Plain';
		dumpCSVTo: fileStream.
	self assert: 'testBioBreedDumpCSVTo.csv' asFileReference exists.
	'testBioBreedDumpCSVTo.csv' asFileReference delete.