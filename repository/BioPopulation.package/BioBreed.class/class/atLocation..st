accessing
atLocation: aString
	" Answer a Collection of Breeds in aString location "
	
	^ self breedsWithLocations select: [: breed | breed isFoundIn: aString ]