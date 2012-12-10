double dispatching
sumFromPoint: aNumber

	^self collect: [ :b | aNumber + b ]