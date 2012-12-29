accessing-rules
hasBreedQualifier: aSubject
	" Answer a Collection with subdivided Strings of the receiver's qualifier information if present.
	This method assumes the qualifiersDictionary has only one (correct = accurate) qualifier value. "

	| speciesName |
	
	speciesName := self extractBreedQualifier: aSubject.
	^ speciesName isEmpty not
