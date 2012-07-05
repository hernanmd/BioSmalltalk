accessing
mismatches

	^ mismatches
		ifNil: [ mismatches := self newMatchingDictionary: #mismatches ]
		