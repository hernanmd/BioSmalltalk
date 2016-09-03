examples
exampleReadMAP1

	^ (self newFromInputFile: 
		(self testFilesDirectoryName asFileReference / 'pedmap' / 'sample_ped.map') fileName)
			positions.