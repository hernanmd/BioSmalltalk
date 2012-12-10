double dispatching
adaptToPoint: aPoint andSend: selector

	^self collect: [ :b | aPoint perform: selector with: b ]