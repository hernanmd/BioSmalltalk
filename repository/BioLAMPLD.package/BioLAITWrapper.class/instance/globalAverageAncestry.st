accessing
globalAverageAncestry

	^ ((((NeoCSVReader on: self inputFile asFileReference readStream)
		separator: Character space;
		skipHeader;
		addField;
		addFloatField;
		addFloatField;
		upToEnd) collect: #third) sum / 100) round: 4