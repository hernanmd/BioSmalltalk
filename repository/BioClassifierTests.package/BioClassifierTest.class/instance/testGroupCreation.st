testing
testGroupCreation

	group := BioGroupOrganization withAll: self trainedSet01.
	self assert: ( group isKindOf: BioGroupOrganization ).
	self assert: ( group contents isKindOf: Collection ).
	self deny: ( group contents isEmpty ).
	self assert: group contents size = 6.
	self assert: ( group contents allSatisfy: [: g | g isKindOf: BioOrganization ] ).
