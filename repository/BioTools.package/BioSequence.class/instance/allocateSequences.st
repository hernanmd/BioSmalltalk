accessing
allocateSequences
	| seqs ambTwoLetterCount ambThreeLetterCount |
	seqs := OrderedCollection new.
	ambTwoLetterCount := self countTwoLetterAmbiguities ** 2.
	ambThreeLetterCount := self countThreeLetterAmbiguities ** 3.
	(ambTwoLetterCount = 0 and: [ ambThreeLetterCount = 1 ])
		ifTrue: [ self allocate: 3 sequences: seqs ].
	(ambTwoLetterCount = 1 and: [ ambThreeLetterCount = 0 ])
		ifTrue: [ self allocate: 2 sequences: seqs ].
	(ambTwoLetterCount = 1 and: [ ambThreeLetterCount = 1 ])
		ifTrue: [ self allocate: 6 sequences: seqs ].
	(ambTwoLetterCount = 1 and: [ ambThreeLetterCount > 1 ])
		ifTrue: [ self allocate: 2 + ambThreeLetterCount sequences: seqs ].
	(ambTwoLetterCount > 1 and: [ ambThreeLetterCount = 1 ])
		ifTrue: [ self allocate: 3 + ambTwoLetterCount sequences: seqs ].
	(ambTwoLetterCount > 1 and: [ ambThreeLetterCount > 1 ])
		ifFalse: [ self allocate: ambTwoLetterCount + ambThreeLetterCount sequences: seqs ].
	^ seqs