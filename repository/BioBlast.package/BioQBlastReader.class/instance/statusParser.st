accessing-get
statusParser

	^ statusParser 
		ifNil: [ statusParser := self parserClass new parserForStatus ]