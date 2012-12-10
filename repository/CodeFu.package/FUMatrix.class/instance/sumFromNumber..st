double dispatching
sumFromNumber: aNumber

	^self collect: [ :b | aNumber + b ]