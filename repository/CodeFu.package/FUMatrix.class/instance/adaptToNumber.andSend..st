double dispatching
adaptToNumber: aNumber andSend: selector

	^self collect: [ :b | aNumber perform: selector with: b ]