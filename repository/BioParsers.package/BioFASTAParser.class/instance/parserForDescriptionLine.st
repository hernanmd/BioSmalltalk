accessing-parsers
parserForDescriptionLine

	^ ( $> asParser , self parserForAnyDescriptionLine , #newline asParser ) end
		
