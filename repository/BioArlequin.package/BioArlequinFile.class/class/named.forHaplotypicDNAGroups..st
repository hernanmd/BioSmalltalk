instance creation
named: aFilename forHaplotypicDNAGroups: aClassifier

	| newInstance arGroups |
	
	arGroups := self buildGroupsFrom: aClassifier.
	newInstance := self newArlequinFileNamed: aFilename haplotypeDNAGroups: arGroups.
	^ BioObject
		dumpToDOSFileNamed: aFilename
		contents: newInstance contents