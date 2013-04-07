testing
testNewMatchingDictionary

	self assert: ((BioClassifier new newMatchingDictionary: #mismatches) isKindOf: Dictionary)