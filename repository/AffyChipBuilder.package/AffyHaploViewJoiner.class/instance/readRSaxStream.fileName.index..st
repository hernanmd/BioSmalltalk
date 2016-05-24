accessing
readRSaxStream: stream fileName: fileName index: index 

	('out_' , fileName basename) asFileReference writeStreamDo: [ : str | 
		self writeStream: str readStream: stream index: index ] 

