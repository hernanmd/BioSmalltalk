Extension { #name : #FileStream }

{ #category : #'*biotools' }
FileStream >> blastXMLDtdLocations [
	" Answer a <Collection> of known NCBI Blast Output DTD locations "
	
	^ Array 
		with: '<!DOCTYPE BlastOutput PUBLIC "-//NCBI//NCBI BlastOutput/EN" "NCBI_BlastOutput.dtd">'
		with: '<!DOCTYPE BlastOutput PUBLIC "-//NCBI//NCBI BlastOutput/EN" "http://www.ncbi.nlm.nih.gov/dtd/NCBI_BlastOutput.dtd">'
]

{ #category : #'*biotools' }
FileStream >> isBlastXMLFormat [
	" Only answer <true> when the receiver's contents *looks like* a NCBI Blast format, not performing any validity check "
	
	^ self isXML and: [ self nextLine; nextMatchAllAnyOf: self blastXMLDtdLocations ]
]

{ #category : #'*biotools' }
FileStream >> isGenBankFlatFormat [
	" Only answer <true> when the receiver's contents *looks like* a GenBank flat format, not performing any validity check "
	
	| flatSignature |
	
	self reset.
	[ flatSignature := self next: 6.
	self reset. ]
	on: Error
	do: [ : ex | self signalInvalidObject: 'Cannot read receiver''s stream ', ex messageText ].
	^ flatSignature beginsWith: 'LOCUS	'
]

{ #category : #'*biotools' }
FileStream >> isXML [
	" See superimplementor's comment "
	
	| xmlSignature |
	
	self reset.
	[ xmlSignature := self next: 5.
	self reset. ]
	on: Error
	do: [ : ex | self signalInvalidObject: 'Cannot read receiver''s stream ' , ex messageText ].
	^ xmlSignature isXML
]
