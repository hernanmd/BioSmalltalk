double dispatching
productFromNumber: aNumber

	^self collect: [ :b | aNumber * b ]