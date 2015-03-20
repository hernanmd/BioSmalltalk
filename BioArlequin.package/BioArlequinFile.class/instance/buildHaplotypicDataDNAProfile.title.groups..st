building
buildHaplotypicDataDNAProfile: aDictionary title: aString groups: aNumber

	self newProfileSection
		addTitle: aString;
		addSampleNumber: aNumber;
		addDataType: 'DNA';
		unsetGenotypicData;
		useMissingData: '''?''';
		useLocusSeparator: 'WHITESPACE'.