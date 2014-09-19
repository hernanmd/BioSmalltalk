accessing
mismatches
	" Answer a <Collection> of global classification mismatches. All mismatches are added here "

	mismatches ifNil: [ mismatches := self newMatchingDictionary: #all ].
	^ mismatches at: #all


		