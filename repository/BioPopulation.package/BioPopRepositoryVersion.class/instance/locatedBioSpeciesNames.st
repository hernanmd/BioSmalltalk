accessing
locatedBioSpeciesNames
	" Answer a <Collection> of <String> each representing receiver's main name "
	
	^ self locatedBioSpecies collect: #name