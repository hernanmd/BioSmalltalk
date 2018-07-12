accessing
gcSkewInt
	" Answer a <Collection> with <Integer>. Calculate receiver's GC skew for each position. Does NOT look at any ambiguous nucleotides. "

	| skews |
	skews := OrderedCollection with: 0.
	self sequence
		keysAndValuesDo: [ :index :nuc | 
			nuc asUppercase = $G
				ifTrue: [ skews add: (skews at: index) + 1 ]
				ifFalse: [ nuc asUppercase = $C
						ifTrue: [ skews add: (skews at: index) - 1 ]
						ifFalse: [ skews add: (skews at: index) ] ] ].
	^ skews