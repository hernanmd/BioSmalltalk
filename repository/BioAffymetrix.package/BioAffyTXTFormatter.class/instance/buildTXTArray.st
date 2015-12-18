private
buildTXTArray

	^ (NeoCSVReader on: (self inputFile asFileReference tailn: self headerLineCount) readStream)
		separator: Character tab;
		upToEnd.