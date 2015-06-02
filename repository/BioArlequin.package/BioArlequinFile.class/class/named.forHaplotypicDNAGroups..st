instance creation
named: aString forHaplotypicDNAGroups: aClassifier

	| newInstance arGroups |
	
	arGroups := self buildGroupsFrom: aClassifier.
	newInstance := self newArlequinFileNamed: aString haplotypeDNAGroups: arGroups.
	^ BioObject
		outputToFullFile: aString
		contents: newInstance contents