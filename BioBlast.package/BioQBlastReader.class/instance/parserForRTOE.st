accessing-put
parserForRTOE

	^ rtoeParser 
		ifNil: [ rtoeParser := self parserClass new parserForRTOE ]