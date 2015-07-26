accessing
atMismatch: selectedMismatchFeatures
	" Answer the mismatch corresponding to selectedMismatchFeatures "

	| nonEmptyFeatureValues |
	nonEmptyFeatureValues := selectedMismatchFeatures reject: [ : featureValue | featureValue = '-' ].
	^ self mismatches 
		detect: [ : d | d values bioHasEqualElements: nonEmptyFeatureValues ]
		ifNone: [ self inform: selectedMismatchFeatures asString , ' not found' ]