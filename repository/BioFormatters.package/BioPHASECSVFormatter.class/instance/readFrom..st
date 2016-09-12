accessing
readFrom: aFile
	" Answer a <Collection> of genotype objects "

	parser := self newParserFor: aFile.
	aFile headerLinesCount timesRepeat: [ parser skipHeader ].
	parser rowsDo: [ : row | 
		(self isIDCCRow: row) 
			ifFalse: [ self processGenotype: row ] ].
