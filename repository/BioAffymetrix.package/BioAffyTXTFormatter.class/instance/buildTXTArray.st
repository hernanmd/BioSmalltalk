private
buildTXTArray

	^ (NeoCSVReader on: self inputFile asFileReference readStream)
		separator: self delimiter;
		upToEnd.