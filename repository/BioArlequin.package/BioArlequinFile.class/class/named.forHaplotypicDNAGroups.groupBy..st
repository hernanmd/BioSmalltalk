instance creation
named: aString forHaplotypicDNAGroups: aClassifier groupBy: groupByString

	| newInstance arGroups |
	
	arGroups := self buildGroupsFrom: aClassifier groupBy: groupByString.
	newInstance := self new.
	newInstance 
		buildHaplotypicDataDNAProfileTitle: aString
		groups: arGroups size
		missingData: '?'.
	newInstance dataSection
		addDNAGroups: arGroups.
	newInstance newStructureSection
		addStructureName: aString;
		addNbGroups: 1;
		addGroups: arGroups.
	^ BioObject
		outputToFullFile: aString
		contents: newInstance contents