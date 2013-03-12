message handling
perform: selector orSendTo: otherTarget
	"Selector was just chosen from a menu by a user.  If can respond, then
perform it on myself. If not, send it to otherTarget, presumably the
editPane from which the menu was invoked."

	selector isBinary
		ifTrue: [ otherTarget perform: selector with: self ]
		ifFalse: [ super perform: selector orSendTo: otherTarget ]