*BioTools
isAllLetters
	"Answer <true> whether the receiver is composed entirely of letters "
	
	self isEmpty ifTrue: [ ^ false ].
	self do: [:c | c isLetter ifFalse: [^ false]].
	^ true