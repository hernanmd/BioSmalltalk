building
buildHaplotypicDataFrequencyProfileTitle: aString groups: aNumber missingData: missingCharacter

	self newProfileSection
		addTitle: aString;
		addSampleNumber: aNumber;
		addDataType: 'FREQUENCY';
		unsetGenotypicData;
		useMissingData: missingCharacter asString;
		useLocusSeparator: 'WHITESPACE'.