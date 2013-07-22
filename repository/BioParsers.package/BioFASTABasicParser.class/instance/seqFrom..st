accessing private
seqFrom: aCollection
	" Answer a new sequence object from aCollection using the receiver's alphabet class "
	
	^ self sequenceClass
		newWith: (BioSequence joinString: (self sequenceCollectionFrom: aCollection))
		alphabet: self alphabetClass