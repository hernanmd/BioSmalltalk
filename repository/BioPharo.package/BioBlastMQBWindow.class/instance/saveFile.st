callbacks
saveFile
	" Private - Save the receiver filters "
	
	self requestFileName ifNotNilDo: [: fileName | 
		( BioSerializationEngine for: fileName ) serialize: self.
		self inform: 'Blast filters saved in file: ' translated , fileName ].
	