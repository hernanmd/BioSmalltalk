printing
storeDenseTextOn: aStream 
	"Append to the argument aStream a sequence of characters 
	that identifies the collection."

	aStream
		print: self rowSize;
		space; 
		print: self columnSize;
		cr.
	1 to: self rowSize do: [ :row |
		(1 to: self columnSize) 
			do: [ :column | aStream print: (self at: row and: column) ] 
			separatedBy: [ aStream space ].
		aStream cr.
	].