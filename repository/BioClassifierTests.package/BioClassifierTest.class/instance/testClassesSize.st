testing
testClassesSize

	| cluster |
	
	classifier := BioClassifier new.
	self assert: classifier classesSize = 0.

	cluster := BioGroupOrganization forSimilarityOn: #value.
	self trainedSet01 do: [ : feature | cluster addOrganization: (BioOrganization new feature: feature) ].
	classifier organization: cluster.
	self subjects01 do: [ : subject | classifier classify: subject ].

	self assert: classifier classesSize = 6.