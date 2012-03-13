building
buildHaplotypicDataDNAProfile: aDictionary title: aString groups: aNumber

	self profileSection
		addTitle: aString;
		addSampleNumber: aNumber;
		addDataType: 'DNA';
		unsetGenotypicData;
		useMissingData: '''?''';
		useLocusSeparator: 'WHITESPACE'.