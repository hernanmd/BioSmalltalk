testing
testGroupBy01

	| clusters |
	clusters := BioGroupOrganization forEqualityOn: #value.
	self trainedSet02 do: [ : feature | clusters addOrganization: (BioOrganization new feature: feature) ].
	classifier := BioClassifier new organization: clusters.
	self subjects02 do: [ : subject | classifier classify: subject ].
	self assert: (classifier groupBy: #value) size equals: 5.
	self assert: (classifier atMatches includesAllOf: self trainedSet02Collection)