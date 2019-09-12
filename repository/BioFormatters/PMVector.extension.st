Extension { #name : #PMVector }

{ #category : #'*BioFormatters' }
PMVector >> asFastaRecord [
	" Answer a <BioFastaRecord>. Assume receiver with 18 elements "

	^ BioFastaRecord new 
		name: self fourth;
		" Alignment string for the SUBJECT "
		sequence: (self at: 17);
		yourself.

]

{ #category : #'*BioFormatters' }
PMVector >> containsSequenceId [
	" Answer <true> if the receiver has a <String> which serves as identifier "
	
	^ self anySatisfy: #isString
]

{ #category : #'*BioFormatters' }
PMVector >> containsSequenceString [
	" Answer <true> if the receiver has a sequence <String> "
	
	^ self anySatisfy: #isBiologicalSequence.
]

{ #category : #'*BioFormatters' }
PMVector >> dumpCSVTo: aStream [

	self flag: #workNeeded.
	self do: [ : each |
		aStream 
			nextPutAll: each asString;
			nextPut: $; ]
]

{ #category : #'*BioFormatters' }
PMVector >> isValidForCSVFormat [

	^ self notEmpty.
]

{ #category : #'*BioFormatters' }
PMVector >> isValidForFastaFormat [
	" Answer <true> if the receiver has enough data to be translated to Fasta format "

	^ self containsSequenceId and: [ self containsSequenceString ].
]
