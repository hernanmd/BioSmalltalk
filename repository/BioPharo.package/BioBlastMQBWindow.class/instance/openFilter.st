callbacks
openFilter
	" Private - Request filter file "
	
	self requestFilterFile ifNotNilDo: [: fileName | 
		(BioObject openFullFileNamed: fileName)
			ifNotNilDo: [: fileStream | | filter |
				self halt.
				filter := BioSerializationEngine materialize: fileStream name.
				self inform: 'Filter results successfully loaded' translated ]].
	