*BioTools
isAllLetters
	"Answer <true> whether the receiver is composed entirely of letters "
	
	^ self isEmpty not and: [self allSatisfy: #isLetter].
