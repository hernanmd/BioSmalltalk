accessing-parsers
parserForDescriptionText

	^ self parserForCompositeId / 
		self parserForAnyDescriptionText "/ self anyCharParser"
		
