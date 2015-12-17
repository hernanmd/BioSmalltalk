accessing
buildMapArray

	^ (NeoCSVReader on: (self mapFile tailn: 5) readStream)
		separator: Character tab;
		addField;
		addField;
		addFloatField;
		addIntegerField;
		upToEnd.