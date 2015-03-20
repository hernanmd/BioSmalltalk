testing
testClassifyByEquality02
	" Test classifying on User objects "

	| cluster |
	
	cluster := BioGroupOrganization forEqualityOn: #asString.
	self trainedSet03 do: [ : feature | cluster addOrganization: (BioOrganization new feature: feature) ].
	classifier := BioClassifier new organization: cluster.
	self subjects03 do: [ : subject | classifier classify: subject ].
	self assert: (classifier organization isKindOf: BioGroupOrganization).
	self assert: classifier classesSize = 3.
	self assert: classifier maxClasses = 3.
	self assert: classifier maxClass feature = 'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAAGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTA'.
	self assert: classifier minClass feature = 'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATGTTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGTCCC-TAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA'.
	