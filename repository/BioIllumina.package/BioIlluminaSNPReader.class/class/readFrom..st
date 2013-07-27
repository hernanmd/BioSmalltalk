instance creation
readFrom: aFile
	" Answer a <Collection> of SNP objects "

	| snpCollection parser |

	parser := self newParserFor: aFile.
	snpCollection := OrderedCollection new.
	parser rowsDo: [ : row | snpCollection add: (self newSnpFrom: row) ].
	^ snpCollection