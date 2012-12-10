*codefu
dist: aNumber

	^self < aNumber
		ifTrue: [ aNumber - self ]
		ifFalse: [ self - aNumber ]