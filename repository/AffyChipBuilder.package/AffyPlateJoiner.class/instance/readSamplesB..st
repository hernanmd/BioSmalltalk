scanning
readSamplesB: fileName

	^ fileName asFileReference
		readStreamDo: [ :stream | 
			(NeoCSVReader on: stream)
				separator: Character tab;
				skipHeader;
				rowsCollect: [ :record | 
					(record fifth isNil or: [ record sixth isNil ])
						ifFalse: [ Array
								with: record third
								with:
									(record fifth
										ifNil: [ self nullIdentifier ]
										ifNotNil: [ :arg | self normalizedSex: record fifth ])
								with:
									(record sixth
										ifNil: [ self nullIdentifier ]
										ifNotNil: [ :arg | self normalizedBreed: record sixth ]) ] ] ]