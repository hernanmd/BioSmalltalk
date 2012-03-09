initialize-release
initializeWith: aCollection
	" Private - Set the receiver's fasta records from aMultiFastaString "
	
	aCollection do: [: anObject |
		self records add: anObject asFastaRecord ]
