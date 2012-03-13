instance creation
named: aString forHaplotypicDNAGroups: aClassifier

	| newInstance params arGroups |
	
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
	^ newInstance outputToFile: aString