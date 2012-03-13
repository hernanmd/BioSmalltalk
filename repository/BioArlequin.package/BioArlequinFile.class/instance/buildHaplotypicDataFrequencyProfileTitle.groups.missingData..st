building
buildHaplotypicDataFrequencyProfileTitle: aString groups: aNumber missingData: missingCharacter

	self profileSection
		addTitle: aString;
		addSampleNumber: aNumber;
		addDataType: 'FREQUENCY';
		unsetGenotypicData;
		useMissingData: missingCharacter asString;
		useLocusSeparator: 'WHITESPACE'.