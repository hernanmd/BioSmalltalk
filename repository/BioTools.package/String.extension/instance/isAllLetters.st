*BioTools
isAllLetters
	"Answer <true> whether the receiver is composed entirely of letters "
	
	self isEmpty ifTrue: [ ^ false ].
	self allSatisfy: [:c | c isLetter ].
	^ true