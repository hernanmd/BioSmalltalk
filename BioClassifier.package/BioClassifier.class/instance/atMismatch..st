accessing
atMismatch: selectedMismatchFeatures
	" Remove anObject from the matched elements "

	| nonEmptyFeatureValues |
	nonEmptyFeatureValues := selectedMismatchFeatures reject: [ : featureValue | featureValue = '-' ].
	^ self mismatches 
		detect: [ : d | d values bioHasEqualElements: nonEmptyFeatureValues ]
		ifNone: [ self inform: selectedMismatchFeatures asString , ' not found' ]