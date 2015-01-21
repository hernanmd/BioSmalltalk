accessing
mismatches

	mismatches ifNil: [ mismatches := self newMatchingDictionary: #all ].
	^ mismatches at: #all


		