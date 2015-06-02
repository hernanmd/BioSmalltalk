instance creation
named: aString forHaplotypicFrequencyGroups: aClassifier

	| newInstance arGroups |
	
	arGroups := self buildGroupsFrom: aClassifier.
	newInstance := self new.
	newInstance 
		buildHaplotypicDataFrequencyProfileTitle: aString
		groups: arGroups size
		missingData: '?'.
	newInstance dataSection
		addDNAGroups: arGroups.
	newInstance newStructureSection
		addStructureName: aString;
		addNbGroups: arGroups size;
		addGroups: arGroups.
	^ newInstance outputToFile: aString