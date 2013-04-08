building
buildHaplotypicDataDNAProfileTitle: aString groups: aNumber missingData: missingCharacter

	self profileSection
		addTitle: aString;
		addSampleNumber: aNumber;
		addDataType: 'DNA';
		unsetGenotypicData;
		useMissingData: missingCharacter greaseString;
		useLocusSeparator: 'WHITESPACE'.