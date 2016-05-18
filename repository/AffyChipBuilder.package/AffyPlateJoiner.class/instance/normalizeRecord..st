normalization
normalizeRecord: record

	| rec |
	
	^ ((rec := self normalizeId: record first) beginsWithSubCollection: '0')
		ifTrue: [ rec allButFirst ]
		ifFalse: [ rec ]