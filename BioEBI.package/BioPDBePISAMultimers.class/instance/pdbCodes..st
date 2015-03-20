accessing
pdbCodes: aCollection
	" Set the receiver PDB codes "

	(self idCollectionClass withAll: aCollection asLowercase) addParametersTo: self client.
