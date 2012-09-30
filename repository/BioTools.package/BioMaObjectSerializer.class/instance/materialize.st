accessing
materialize
	" See superimplementor comment "
	
	^ self serializer fileIn: (self fileDirectoryClass forFileName: self locationString)