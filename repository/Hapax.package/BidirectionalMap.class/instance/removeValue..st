removing
removeValue: value 

	^self removeValue: value ifAbsent: [ Error new signal ]