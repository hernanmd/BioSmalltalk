scanning
readOrderedIndivs

	^ (self rootDirectory / self sampleIDsFile) asFileReference readStreamDo: [ : stream |
		(NeoCSVReader on: stream)
			separator: Character tab;
			rowsCollect: [ : record | 
				(self isIncludedInGIR: record)
					ifTrue: [ record first ]
					ifFalse: [  self normalizeRecord: record ] ] ]