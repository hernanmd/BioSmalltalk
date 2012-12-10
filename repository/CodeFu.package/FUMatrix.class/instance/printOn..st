printing
printOn: aStream 
	"Append to the argument aStream a sequence of characters that identifies the matrix."

	| tooMany |
	tooMany := aStream position + 5000.
	aStream 
		print: self class; 
		space;
		print: self dimension;
		space;
		nextPut: $(.
	(1 to: self rowSize) do: [ :row |
		aStream nextPut: $(.
		(1 to: self columnSize) do: [ :column | 
			aStream position > tooMany ifTrue: [aStream nextPutAll: (#etc << #dialogs >> '...etc...') asString, '))'. ^self].
			aStream print: (self at: row and: column)
		] separatedBy: [ aStream space ].
		aStream nextPut: $) 
	] separatedBy: [ aStream space ].
	aStream nextPut: $)