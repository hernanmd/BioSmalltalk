*codefu
\ aSet
	"Answer the set difference A \ B between the receiver A and aSet B. The set
	difference is defined by A \ B = { x | x in A and x not in B }."

	^self select: [ :each | (aSet includes: each) not ]