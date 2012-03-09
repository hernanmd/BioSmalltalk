comparing
= aFastaRecord
	" Two fasta are equal if
	 (a) they are the same 'kind' of thing.
	 (b) they have the same name.
	 (c) they have the same sequences "
	
	self == aFastaRecord ifTrue: [ ^ true ].
	self class = aFastaRecord class ifFalse: [ ^ false ].
	self name = aFastaRecord name ifFalse: [ ^ false ] .
	^ self sequence = aFastaRecord sequence