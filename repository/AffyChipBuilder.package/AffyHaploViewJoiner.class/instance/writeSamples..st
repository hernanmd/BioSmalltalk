accessing
writeSamples: aCollection

	self outputFilename asFileReference writeStreamDo: [ : fstream | 	
		ZnBufferedWriteStream on: fstream do: [ :stream |
			(NeoCSVWriter on: stream) 
				fieldWriter: #raw;
				separator: Character tab;
				nextPutAll: aCollection;
				flush ] ].
