*BioTools
asFileCollection

	^ BioFileDirectoryCollection withAll: 
		( self collect: [: e | BioObject fileStreamClass readOnlyFileNamed: e fullName ] )