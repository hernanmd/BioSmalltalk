break into clusters
breakAtThreshold: aNumber

	| candidates |
	candidates := (self nodes select: [ :each | each threshold < aNumber ]), self leaves.
	^candidates reject: [ :each | candidates includes: each parent ].