accessing-put
parserForRID

	^ ridParser 
		ifNil: [ ridParser := self parserClass new parserForRID ]