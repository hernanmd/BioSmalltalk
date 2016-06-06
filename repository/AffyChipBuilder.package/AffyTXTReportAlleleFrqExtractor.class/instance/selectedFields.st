report
selectedFields

	| fields |
	
	fields := OrderedCollection new.
	self extractRS 
		ifTrue: [ fields add: 'rs' ].
	self extractAX 
		ifTrue: [ fields add: 'AX' ].
	self extractAlleleFrqs 
		ifTrue: [ fields addAll: self famNamesAB ].
	^ fields