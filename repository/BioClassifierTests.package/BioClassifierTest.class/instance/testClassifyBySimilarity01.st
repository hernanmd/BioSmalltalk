testing
testClassifyBySimilarity01
	" Test classifying plain Strings "

	| subjects clusters |
	
	clusters := BioGroupOrganization forSimilarityOn: #value.
	self trainedSet01 do: [ : feature |
		clusters addOrganization: ( BioOrganization new feature: feature ) ].
	classifier := BioClassifier new organization: clusters.
	self subjects01 do: [: subject | classifier classify: subject ].

	self assert: ( classifier organization isKindOf: BioGroupOrganization ).
	self assert: classifier classesSize = 6.
	self assert: classifier maxClasses = 6.
	self assert: ( classifier maxClass feature = 'Polaromonas naphthalenivorans CJ2' ).
	self assert: classifier minClasses = 1.
	self assert: ( classifier minClass feature = 'Nautilia' ).
	