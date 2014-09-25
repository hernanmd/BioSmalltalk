accessing
matches

	matches ifNil: [ matches := self newMatchingDictionary: #matches ].
	^ matches 
		at: #matches