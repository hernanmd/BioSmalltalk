report
selectedFields

	| fields |
	fields := OrderedCollection new.
	self extractRS 
		ifTrue: [ fields add: 'rs' ].
	self extractAX 
		ifTrue: [ fields add: 'AX' ].
	self extractAlleleFrqs 
		ifTrue: [ fields addAll: self famNamesAB ]
		ifFalse: [ self extractMinAlleleFrqs 
					ifTrue: [ fields addAll: self famNames ] ].
	self extractGeneAnnot 
		ifTrue: [ fields addAll: self geneAnnotNames ].
	^ fields