Extension { #name : #ZnCharacterReadStream }

{ #category : #'*BioPharo7' }
ZnCharacterReadStream >> blastXMLDtdLocations [
	" Answer a <Collection> of known NCBI Blast Output DTD locations "
	
	^ Array 
		with: '<!DOCTYPE BlastOutput PUBLIC "-//NCBI//NCBI BlastOutput/EN" "NCBI_BlastOutput.dtd">'
		with: '<!DOCTYPE BlastOutput PUBLIC "-//NCBI//NCBI BlastOutput/EN" "http://www.ncbi.nlm.nih.gov/dtd/NCBI_BlastOutput.dtd">'
]

{ #category : #'*BioPharo7' }
ZnCharacterReadStream >> isBlastXMLFormat [
	" Only answer <true> when the receiver's contents *looks like* a NCBI Blast format, not performing any validity check "
	
	| answer | 
	answer := self nextLine; nextMatchAllAnyOf: self blastXMLDtdLocations.
	self wrappedStream reset.
	^ answer
]

{ #category : #'*BioPharo7' }
ZnCharacterReadStream >> nextMatchAll: aColl [
    "Answer true if next N objects are the ones in aColl,
     else false.  Advance stream of true, leave as was if false."
    | save |
    save := self position.
    aColl do: [: each |
       (self next) = each ifFalse: [
            self position: save.
            ^ false]
        ].
    ^ true
]

{ #category : #'*BioPharo7' }
ZnCharacterReadStream >> nextMatchAllAnyOf: aCollection [

	^ aCollection anySatisfy: [ : subCol | self nextMatchAll: subCol  ].

]
