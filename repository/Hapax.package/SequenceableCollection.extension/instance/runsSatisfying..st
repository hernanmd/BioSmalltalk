*hapax
runsSatisfying: testBlock
	"Evaluate testBlock with the receiver elements, selecting from the
	receiver runs, that is sequences of adjacent elements, for which the block 
	returned true. Return an OrderedCollection of those subsequences."
	"'Hello to\all of the world,\isn''t Smalltalk cool?' 
		runsSatisfying: [:each | each ~= $\] "

	| runs |
	runs := OrderedCollection new.
	self runsSatisfying: testBlock do: [:each | runs add: each].
	^runs