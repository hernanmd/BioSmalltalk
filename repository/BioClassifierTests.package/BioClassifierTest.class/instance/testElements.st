testing
testElements

	group := BioGroupOrganization withAll: self trainedSet01.
	self assert: ( group contents noneSatisfy: [: g | g name isEmpty ] ).
