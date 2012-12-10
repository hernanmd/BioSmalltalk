accessing
at: row and: column put: aNumber

	^row = column 
		ifTrue: [ partialColumns at: column put: aNumber ]
		ifFalse: [ aNumber isZero ifFalse: [ self error: ('can not put <1p> off diagonal' expandMacrosWith: aNumber) ]. aNumber ]