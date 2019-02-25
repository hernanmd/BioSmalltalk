accessing-columns
collectAffyProbesAt: indexes to: outputCol

	(NeoCSVReader on: self inputFile asFileReference readStream)
		separator: self delimiter;
		skipHeader: self headerLineCount + 1;
		rowsDo: [ :r | outputCol add: (self newAffyRecordAt: r using: indexes) ]