*hapax
runsFailing: aBlock
	"Evaluate testBlock with the receiver elements, selecting from the
	receiver runs, that is sequences of adjacent elements, for which
	the block returned false. Return an OrderedCollection of those runs."
	"'Hello to\all of the world,\isn''t Smalltalk cool?' 
		runsFailing: [:each | each = $\] "

	^self runsSatisfying: [:each | (aBlock value: each) not]