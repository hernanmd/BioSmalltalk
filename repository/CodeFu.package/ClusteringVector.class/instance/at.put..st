as yet unclassified
at: idx put: aNumber

	super at: idx put: aNumber.
	(found ~~ nil and: [ found = idx or: [ aNumber < min ]]) ifTrue: [ found := nil ].
	^aNumber.