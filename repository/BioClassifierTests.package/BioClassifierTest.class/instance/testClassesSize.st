testing
testClassesSize

	| cluster |
	classifier := BioClassifier new.
	self should: [ classifier classesSize ] raise: MessageNotUnderstood description: 'No organization assigned yet'.
	cluster := BioGroupOrganization forSimilarityOn: #value.
	classifier organization: cluster.	
	self assert: classifier classesSize = 0.
	self trainedSet01 do: [ : feature | cluster addOrganization: (BioOrganization new feature: feature) ].
	self assert: classifier classesSize = 6.	
	self subjects01 do: [ : subject | classifier classify: subject ].
	self assert: classifier classesSize = 6.