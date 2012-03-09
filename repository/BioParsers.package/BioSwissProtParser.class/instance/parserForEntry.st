accessing
parserForEntry
	" Answer a parser for parsing entry identifiers "

	^ ( #letter asParser / 
		#digit asParser / 
		#punctuation asParser ) plus flatten.	

