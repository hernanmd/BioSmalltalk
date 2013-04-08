instance creation
named: aString forHaplotypicDNAGroups: aClassifier

	| newInstance arGroups |
	
	arGroups := self buildGroupsFrom: aClassifier.
	newInstance := self new.
	newInstance 
		buildHaplotypicDataDNAProfileTitle: aString
		groups: arGroups size
		missingData: '?'.
	newInstance dataSection
		addDNAGroups: arGroups.
	newInstance structureSection
		addStructureName: aString;
		addNbGroups: 1;
		addGroups: arGroups.
	^ BioObject
		outputToFullFile: aString
		contents: newInstance contents