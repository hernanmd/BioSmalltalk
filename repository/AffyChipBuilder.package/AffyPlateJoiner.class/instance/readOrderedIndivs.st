scanning
readOrderedIndivs

	^ (self rootDirectory / self sampleIDsFile) asFileReference readStreamDo: [ : stream |
		(NeoCSVReader on: stream)
			separator: Character tab;
			rowsCollect: [ : record | 
				(record first endsWith: '.CEL')
					ifTrue: [ record first ]
					ifFalse: [  self normalizeRecord: record ] ] ]