initialize-release
initializeWith: aCollection
	" Private - Set the receiver's fasta records from aMultiFastaString "
	
	self records addAll: (aCollection collect: [: anObject | anObject asFastaRecord ])
