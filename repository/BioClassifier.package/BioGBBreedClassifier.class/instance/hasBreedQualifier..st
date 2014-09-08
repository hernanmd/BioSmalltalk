accessing-rules
hasBreedQualifier: aSubject
	" Answer <true> if receiver's qualifier information for breed if present.
	This method assumes the qualifiersDictionary has only one (correct = accurate) qualifier value. "

	^ (self extractBreedQualifier: aSubject) notEmpty

