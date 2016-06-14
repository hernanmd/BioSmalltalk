report
extractGeneAnnotFromRecord: record position:aNumber

	| geneAnnotString |
	geneAnnotString := record at: aNumber.	
	self halt.
	self extractGeneAnnotFromRecord: geneAnnotString.
	self annotNames do: [ : annotName | 
		| annot |
		annot := self geneAnnotDictionary 
					at: annotName  
					ifPresent: [ :a | a isNil ifTrue: [ 'NULL' ] ifFalse: [ a ] ] 
					ifAbsent: [ 'NULL' ].
		self csvWriter 
			ensureOpen;
			writeField: annot trimBoth; 
			writeSeparator;
			flush. ].

	self familyDictionary associationsDo: [ : assoc | assoc value: nil ].
	self csvWriter writeEndOfLine 
