accessing
matches

	^ matches 
		at: #matches
		ifAbsent: [ matches := self newMatchingDictionary: #matches ].