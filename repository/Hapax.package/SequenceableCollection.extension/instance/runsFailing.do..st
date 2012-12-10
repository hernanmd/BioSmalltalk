*hapax
runsFailing: testBlock do: enumerationBlock 
	"Evaluate testBlock with the receiver elements, selecting from the
	receiver runs, that is sequences of adjacent elements, for which the block 
	returned false, and evaluate enumerationBlock with each of those 
	subsequences."
	"'Hello to\all of the world,\isn''t Smalltalk cool?' 
		runsFailing: [:each | each = $\] 
		do: [:each | Transcript show: each; cr]"

	^self 
		runsSatisfying: [:each | (testBlock value: each) not]
		do: enumerationBlock