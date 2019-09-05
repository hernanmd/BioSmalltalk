Extension { #name : #SequenceableCollection }

{ #category : #'*hapax' }
SequenceableCollection >> changeSizeTo: newSize [
	"The receiver changes size."
	
	"This is not a copy of the receiver, so all shared references survive."

	| newArray |
	newArray := self copyEmpty: newSize.
	newArray
		replaceFrom: 1
		to: (self size min: newSize)
		with: self.
	self become: newArray
]

{ #category : #'*hapax' }
SequenceableCollection >> runsFailing: aBlock [
	"Evaluate testBlock with the receiver elements, selecting from the
	receiver runs, that is sequences of adjacent elements, for which
	the block returned false. Return an OrderedCollection of those runs."
	"'Hello to\all of the world,\isn''t Smalltalk cool?' 
		runsFailing: [:each | each = $\] "

	^self runsSatisfying: [:each | (aBlock value: each) not]
]

{ #category : #'*hapax' }
SequenceableCollection >> runsFailing: testBlock do: enumerationBlock [ 
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
]

{ #category : #'*hapax' }
SequenceableCollection >> runsSatisfying: testBlock [
	"Evaluate testBlock with the receiver elements, selecting from the
	receiver runs, that is sequences of adjacent elements, for which the block 
	returned true. Return an OrderedCollection of those subsequences."
	"'Hello to\all of the world,\isn''t Smalltalk cool?' 
		runsSatisfying: [:each | each ~= $\] "

	| runs |
	runs := OrderedCollection new.
	self runsSatisfying: testBlock do: [:each | runs add: each].
	^runs
]

{ #category : #'*hapax' }
SequenceableCollection >> runsSatisfying: testBlock do: enumerationBlock [ 
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
]
