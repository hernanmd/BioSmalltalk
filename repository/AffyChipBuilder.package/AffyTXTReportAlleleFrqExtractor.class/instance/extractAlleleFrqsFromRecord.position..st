report
extractAlleleFrqsFromRecord: record position: aNumber

	"self haltIf: [ record first = 'AX-28478436' ]."
	| alleleFrqString |
	alleleFrqString := record at: aNumber.	
	self extractAlleleFrqsFromRecordInitFamDictionary: alleleFrqString.
	self famNamesAB do: [ : famAB | 
		| alleleA alleleB |
		alleleA := self familyDictionary at: (famAB first: 3) ifPresent: [ :a | a isNil ifTrue: [ 'NULL' ] ifFalse: [ a key ] ] ifAbsent: [ 'NULL' ].
		alleleB := self familyDictionary at: (famAB first: 3) ifPresent: [ :a | a isNil ifTrue: [ 'NULL' ] ifFalse: [ a value ] ] ifAbsent: [ 'NULL' ] .
		self csvWriter 
			ensureOpen;
			writeField: alleleA trimBoth; 
			writeSeparator; 
			writeField: alleleB trimBoth; 
			writeSeparator;
			flush.
		].

	self familyDictionary associationsDo: [ : assoc | assoc value: nil ].
	self csvWriter writeEndOfLine 
