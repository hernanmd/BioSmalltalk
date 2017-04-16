accessing
haplotypeIdentifier

	^ String streamContents: [ : stream |
		stream
			nextPutAll: self sequence asString;
			space;
			nextPutAll: (self popFreq printShowingDecimalPlaces: 3) ]