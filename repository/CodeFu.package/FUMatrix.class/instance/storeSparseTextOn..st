printing
storeSparseTextOn: aStream 
	"Append to the argument aStream a sequence of characters 
	that identifies the collection."

	aStream
		print: self rowSize;
		space; 
		print: self columnSize;
		space;
		print: self sparseSize;
		cr.
	self columns do: [ :column |
		aStream print: column sparseSize; cr.
		column doSparseWithIndex: [ :value :index |
			aStream print: index - 1; space; print: value; cr.
		].
	].