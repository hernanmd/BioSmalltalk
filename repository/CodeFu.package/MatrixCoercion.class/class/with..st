initialize-release
with: aNumber 
	^ (aNumber isKindOf: FUMatrix) 
		ifTrue: [ aNumber ]
		ifFalse: 
			[ self basicNew
				setNumber: aNumber ;
				yourself ]