callbacks
saveFile
	" Private - Save the receiver filters "
	
	(self requestFileName: 'filter') ifNotNilDo: [: filename | 
		(BioSerializationEngine for: filename) serialize: self.
		self inform: 'Blast filters saved in file: ' translated , filename ].
	