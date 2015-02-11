enumerating
do: aBlockClosure displayingProgress: aString 
	"Evaluate aBlock with each of the receiver's set as the argument."

	^ set do: aBlockClosure displayingProgress: aString