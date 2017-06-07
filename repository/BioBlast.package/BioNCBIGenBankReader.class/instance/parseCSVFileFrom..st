accessing
parseCSVFileFrom: aFilename
	" Parse documents located at aFilename in the internal CSV format, and update the receiver's contents with the result "
	
	| csvReader dictionary header answer |
	csvReader := (NeoCSVReader on: (self openFullFileNamed: aFilename) readStream)
		separator: $|;
		yourself.
	answer := OrderedCollection new: 3000.
	header := csvReader readHeader reject: #isNil.
	csvReader rowsDo:  [ : row | 
		| rowValues |
		(rowValues := row reject: #isNil) size = header size ifTrue: [ 
			dictionary := Dictionary new.
			rowValues doWithIndex: [ : val : index | dictionary at: (header at: index) put: val; yourself ].
			answer add: dictionary ] ].
	^ answer.
