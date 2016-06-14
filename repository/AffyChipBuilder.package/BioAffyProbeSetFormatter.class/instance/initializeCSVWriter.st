initialize-release
initializeCSVWriter

	self outputFilename asFileReference writeStreamDo: [ : writeStream | 
		| bufferedStream |

		bufferedStream := (ZnBufferedWriteStream on: writeStream) 
				yourself.
		self csvWriter: (
			(NeoCSVWriter on: bufferedStream)
				separator: Character tab;
				writeHeader: self selectedFields;					
				fieldWriter: #raw;
				yourself) ].
