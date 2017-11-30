initialization
initializeFromAxiomPLINK: pedFilename

	| newFilename aasMapFile aasPedFile fileNamePrefix |
	
	aasMapFile := (pedFilename , '.map') asFileReference.
	aasPedFile := (pedFilename , '.ped') asFileReference.
	fileNamePrefix := 'newFmt_'.
	newFilename := aasPedFile parent pathString , 
			DiskStore delimiter asString , 
			fileNamePrefix , 
			aasPedFile basenameWithoutExtension.

	self dumpToFileNamedFullPath: (newFilename , '.map')  contents: (aasMapFile tailn: 5).
	self dumpToFileNamedFullPath: (newFilename , '.ped')  contents: (aasPedFile tailn: 2).
	self file: newFilename.

