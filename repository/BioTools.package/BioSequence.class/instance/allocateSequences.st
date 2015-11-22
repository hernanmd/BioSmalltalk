accessing
allocateSequences
	| seqs ambTwoLetterCount ambThreeLetterCount |
	seqs := OrderedCollection new.
	ambTwoLetterCount := self countTwoLetterAmbiguities.
	ambThreeLetterCount := self countThreeLetterAmbiguities.
	(ambTwoLetterCount = 0 and: [ ambThreeLetterCount = 0 ])
		ifTrue: [ self allocate: 1 sequences: seqs ].	
	(ambTwoLetterCount = 0 and: [ ambThreeLetterCount = 1 ])
		ifTrue: [ self allocate: 3 sequences: seqs ].
	(ambTwoLetterCount = 1 and: [ ambThreeLetterCount = 0 ])
		ifTrue: [ self allocate: 2 sequences: seqs ].
	(ambTwoLetterCount = 1 and: [ ambThreeLetterCount = 1 ])
		ifTrue: [ self allocate: 6 sequences: seqs ].
	(ambTwoLetterCount = 1 and: [ ambThreeLetterCount > 1 ])
		ifTrue: [ self allocate: 2 * (3 ** ambThreeLetterCount) sequences: seqs ].
	(ambTwoLetterCount > 1 and: [ ambThreeLetterCount = 1 ])
		ifTrue: [ self allocate: 3 * (2 ** ambTwoLetterCount) sequences: seqs ].
	(ambTwoLetterCount > 1 and: [ ambThreeLetterCount > 1 ])
		ifTrue: [ self allocate: ambTwoLetterCount * ambThreeLetterCount sequences: seqs ].
	^ seqs