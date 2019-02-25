accessing
dumpAllAffyProbes: outputCol

	^ self outputFilename asFileReference
		writeStreamDo: [ :writeStream | 
			ZnBufferedWriteStream
				on: writeStream
				do: [ :bStream | 
					(NeoCSVWriter on: bStream)
						separator: self delimiter;
						writeRawHeader: self header;
						addRawField: #id;
						addRawField: #chr;
						addRawField: #position;
						addRawField: #markers;
						nextPutAll: (outputCol sortBlock: [ :a :b | a <= b ]) ] ]