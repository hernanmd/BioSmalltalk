private
newArlequinFileNamed: aString haplotypeDNAGroups: arGroupsCollection 

	| newInstance |
	
	newInstance := self new.
	newInstance 
		buildHaplotypicDataDNAProfileTitle: aString
		groups: arGroupsCollection size
		missingData: '?'.
	newInstance dataSection.
	newInstance haplotypesSection  
		addHaplotypes: arGroupsCollection.
	newInstance samplesSection
		addDNAGroups: arGroupsCollection.
	newInstance newStructureSection
		addStructureName: aString;
		addNbGroups: 1;
		addGroups: arGroupsCollection.
	^ newInstance