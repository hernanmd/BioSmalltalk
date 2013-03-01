callbacks
openFilter
	" Private - Request filter file "
	
	self requestFilterFile ifNotNilDo: [: fileName | 
		(BioObject openFullFileNamed: fileName)
			ifNotNilDo: [: fileStream | | filter |
				filter := BioSerializationEngine materialize: fileStream name.
				filter window openInWorld ]].
	