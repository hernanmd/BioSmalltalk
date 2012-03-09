accessing
materialize

	^ self serializer fileIn: 
		( self fileDirectoryClass forFileName: self locationString )