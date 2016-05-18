scanning
readSamplesC: fileName

	^ fileName asFileReference
		readStreamDo: [ :stream | 
			(NeoCSVReader on: stream)
				separator: Character tab;
				rowsCollect: [ :record | 
					Array
						with: record first
						with: 'M'
						with: 'GIR' ] ]