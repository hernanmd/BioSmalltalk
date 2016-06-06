report
extractMinAlleleFrqsFromRecord: record position: aNumber

	"self haltIf: [ record first = 'AX-28478436' ]."
	| alleleFrqString |
	alleleFrqString := record at: aNumber.	
	self extractMinAlleleFrqsFromRecordInitFamDictionary: alleleFrqString.
	self famNames do: [ : famName | 
		| allele |
		allele := self familyDictionary 
					at: famName  
					ifPresent: [ :a | a isNil ifTrue: [ 'NULL' ] ifFalse: [ a ] ] 
					ifAbsent: [ 'NULL' ].
		self csvWriter 
			ensureOpen;
			writeField: allele trimBoth; 
			writeSeparator;
			flush. ].

	self familyDictionary associationsDo: [ : assoc | assoc value: nil ].
	self csvWriter writeEndOfLine 
