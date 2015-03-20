updating
extractFileNames: aCollection
	" Private - Answer a String with only the file names for the choosen database "
	
	( self compressedDatabasesIn: aCollection )
		collect: [ : fileName | 
			( fileName matchesRegex: '^' , selectedDbName , '\..*' )
				ifTrue: [ self fileNames add: fileName ] ]