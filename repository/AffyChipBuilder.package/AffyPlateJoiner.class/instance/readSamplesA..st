scanning
readSamplesA: fileName

	^ fileName asFileReference readStreamDo: [ : stream |
			(NeoCSVReader on: stream)
				separator: Character tab;
				skipHeader;
				rowsCollect: [ : record | 
					((record at: 16) isNil or: [ (record at: 22) isNil ])
					ifFalse: [ 
						Array 
							with: (self normalizeId: record ninth)
							with: (self normalizedSex: (record at: 16))
							with: (self normalizedBreed: (record at: 22)) ] ] ].
