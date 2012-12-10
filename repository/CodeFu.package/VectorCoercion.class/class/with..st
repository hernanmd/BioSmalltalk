initialize-release
with: aNumber

	^(aNumber isKindOf: Vector) 
		ifTrue: [ aNumber ]
		ifFalse: [ (self basicNew)
			setNumber: aNumber;
			yourself ]