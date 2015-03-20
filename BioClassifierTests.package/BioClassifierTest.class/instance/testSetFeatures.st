testing
testSetFeatures

	| subjects grouping |
	
	grouping := BioGroupOrganization forSimilarityOn: #value.
	self trainedSet01 do: [ : feature |
		grouping addOrganization: ( BioOrganization new feature: feature ) ].

	self assert: ( grouping features isKindOf: Collection ).
	self assert: grouping features size = 6.
	self assert: ( grouping features bioHasEqualElements: self trainedSet01 )