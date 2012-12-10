*hapax
runsSatisfying: testBlock do: enumerationBlock 
	"Evaluate testBlock with the receiver elements, selecting from the
	receiver runs, that is sequences of adjacent elements, for which the block 
	returned true, and evaluate enumerationBlock with each of those 
	subsequences."
	"'Hello to\all of the world,\isn''t Smalltalk cool?' 
		runsSatisfying: [:each | each ~= $\] 
		do: [:each | Transcript show: each; cr]"

	| size start wasInside nowInside |
	start := 1.
	wasInside := false.
	1 to: (size := self size) do:
		[:index|
		 nowInside := testBlock value: (self at: index).
		 nowInside ~~ wasInside ifTrue:
			[wasInside := nowInside.
			 nowInside
				ifTrue: [start := index]
				ifFalse: [enumerationBlock value: (self copyFrom: start to: index - 1)]]].
	wasInside ifTrue: [enumerationBlock value: (self copyFrom: start to: size)]