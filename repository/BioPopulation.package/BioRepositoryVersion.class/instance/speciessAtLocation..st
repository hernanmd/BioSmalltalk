accessing
speciessAtLocation: aString
	" Answer a Collection of Breeds in aString location "
	
	^ self locatedBioSpecies select: [: breed | breed isFoundIn: aString ]