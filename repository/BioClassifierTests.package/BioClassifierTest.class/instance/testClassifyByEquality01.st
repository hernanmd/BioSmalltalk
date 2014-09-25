testing
testClassifyByEquality01
	" Test classifying plain Strings "

	|  clusters |
	
	clusters := BioGroupOrganization forEqualityOn: #value.
	self trainedSet02 do: [ : feature | clusters addOrganization: (BioOrganization new feature: feature) ].
	classifier := BioClassifier new organization: clusters.
	self subjects02 do: [: subject | classifier classify: subject ].

	self assert: (classifier organization isKindOf: BioGroupOrganization).
	self assert: classifier classesSize = 5.
	self assert: classifier maxClasses = 2.

	