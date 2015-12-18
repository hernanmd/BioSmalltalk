private
buildMapArray

	^ (NeoCSVReader on: (self inputFile tailn: 5) readStream)
		separator: Character tab;
		addField;
		addField;
		addFloatField;
		addIntegerField;
		upToEnd.