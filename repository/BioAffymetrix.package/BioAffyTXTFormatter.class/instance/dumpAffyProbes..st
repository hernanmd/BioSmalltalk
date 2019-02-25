accessing
dumpAffyProbes: outputCol
	^ self outputFilename asFileReference
		writeStreamDo: [ :writeStream | 
			ZnBufferedWriteStream
				on: writeStream
				do: [ :bStream | 
					(NeoCSVWriter on: bStream)
						separator: self delimiter;
						addRawField: #id;
						addRawField: #chr;
						addRawField: #position;
						nextPutAll: (outputCol sortBlock: [ :a :b | a <= b ]) ] ]