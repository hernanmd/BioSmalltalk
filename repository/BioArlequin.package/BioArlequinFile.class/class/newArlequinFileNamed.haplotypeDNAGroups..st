private
newArlequinFileNamed: aString haplotypeDNAGroups: arGroupsCollection 

	| newInstance |
	
	newInstance := self new.
	newInstance 
		buildHaplotypicDataDNAProfileTitle: aString
		groups: arGroupsCollection size
		missingData: '?'.
	newInstance haplotypesSection  
		addHaplotypes: arGroupsCollection.
	newInstance dataSection
		addDNAGroups: arGroupsCollection.
	newInstance newStructureSection
		addStructureName: aString;
		addNbGroups: 1;
		addGroups: arGroupsCollection.
	^ newInstance