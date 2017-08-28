accessing
matches

	matches ifNil: [ matches := self newMatchingDictionary: #all ].
	^ matches at: #all		
