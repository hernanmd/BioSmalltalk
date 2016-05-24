accessing
readTSVFileNamed: aFilename

	^ aFilename asFileReference readStreamDo: [ : stream |
			(NeoCSVReader on: stream)
				separator: Character tab;
				skipHeader;
				rowsCollect: [ : record | self readTSVItem: record ] ]