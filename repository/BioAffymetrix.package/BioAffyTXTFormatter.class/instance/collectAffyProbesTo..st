accessing-columns
collectAffyProbesTo: outputCol

	(NeoCSVReader on: self inputFile asFileReference readStream)
		separator: self delimiter;
		skipHeader: self headerLineCount;
		rowsDo: [ :r | outputCol add: (self newAffyRecordAt: r) ]