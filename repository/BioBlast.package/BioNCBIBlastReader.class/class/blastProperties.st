accessing-properties
blastProperties

	(BlastProperties isNil or: [ BlastProperties isEmpty ])
		ifTrue: [ self initializeBlastProperties ].
	^ BlastProperties