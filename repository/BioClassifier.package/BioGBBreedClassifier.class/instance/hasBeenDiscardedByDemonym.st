testing
hasBeenDiscardedByDemonym
	" Answer <true> if the current subject is already present in the discarded subjects by demonym out of interest "

	| discardedSubjects |

	^ ( discardedSubjects := self unMatchedConditions 
			at: #unclassifiedByNullClusterForCurrentDemonym 
			ifAbsent: [ nil ] ) isNil not and: [ discardedSubjects includes: self subject ]