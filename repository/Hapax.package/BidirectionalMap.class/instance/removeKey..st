removing
removeKey: key 

	^self removeKey: key ifAbsent: [ Error new raiseSignal ]