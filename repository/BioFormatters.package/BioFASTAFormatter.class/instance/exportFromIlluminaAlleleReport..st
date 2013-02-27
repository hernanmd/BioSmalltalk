exporting
exportFromIlluminaAlleleReport: aFilename
	" Write a time-stamped file in the receiver's format from aFilename "
	
	| fs |
	
	parser := self parserClass on: (self openFullFileNamed: aFilename).
	parser ignoreHeaderLine; delimiter: $;.
	fs := self newFileNamed: self outputFilename.
	parser rowsDo: [: row |
		fs 
			nextPut: $>;
			nextPutAll: row first;
			nextPut: $|;
			nextPutAll: row third;
			nextPut: $|;
			nextPutAll: row fourth;
			bioCr.
		row fifth do: [: letter | fs nextPut: letter ].
		fs bioCr. ].
	fs close.