accessing
atAccession: accesionString
	" Answer a <Dictionary> identified by accessionString "

	^ self detect: [ : d | (d at: self class qualifierForAccessionWithVersion) = accesionString ]