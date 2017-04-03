private
buildTXTArray

	^ (NeoCSVReader on: self inputFile asFileReference readStream)
		separator: Character tab;
		upToEnd.