comparing
= aFastaMultiRecord
	" Two multi fasta are equal if
	 (a) they are the same 'kind' of thing.
	 (b) they have the same name.
	 (c) for each fasta record, they have the same sequences in the same order "
	
	self == aFastaMultiRecord ifTrue: [ ^ true ].
	self class = aFastaMultiRecord class ifFalse: [ ^ false ].
	self size = aFastaMultiRecord size ifFalse: [ ^ false ] .
	self sequences with: aFastaMultiRecord sequences do: [ :record1 :record2 |
		record1 = record2 ifFalse: [ ^ false] ].
	^ true