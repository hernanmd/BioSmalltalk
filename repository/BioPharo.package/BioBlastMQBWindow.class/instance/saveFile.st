callbacks
saveFile
	" Private - Save the receiver filters "
	
	(self requestFileName: 'qb') ifNotNilDo: [: fileStream | 
		Cursor write showWhile: [ 
			( BioSerializationEngine for: fileStream name ) serialize: self ].
		self inform: 'Blast filters saved in file: ' translated , fileStream name ].
	