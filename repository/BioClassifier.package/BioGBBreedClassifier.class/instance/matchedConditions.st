accessing
matchedConditions

	^ matches
		ifNil: [ matches := Dictionary new ].