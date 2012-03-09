accessing
copyFrom: startIndex to: stopIndex
	" Answer a String representation of the receiver "
	
	^ startIndex <= stopIndex
		ifTrue: [ self sequences copyFrom: startIndex to: stopIndex ]
		ifFalse: [ self signalInvalidObject: 'First index should be minor or equal than stop index' ]