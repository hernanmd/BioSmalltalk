building
buildHaplotypicDataDNAProfileTitle: aString groups: aNumber missingData: missingCharacter

	self newProfileSection
		addTitle: aString;
		addSampleNumber: aNumber;
		addDataType: 'DNA';
		unsetGenotypicData;
		useMissingData: missingCharacter greaseString;
		useLocusSeparator: 'WHITESPACE'.