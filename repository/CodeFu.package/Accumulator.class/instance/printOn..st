printing
printOn: stream

	| method |
	method := 	accumulateBlock method outerMethod.
	stream 
		nextPutAll: (method mclass == Accumulator class ifTrue: [ method selector ] ifFalse: [ 'custom' ]);
		space;
		nextPut: $=;
		space;
		print: value