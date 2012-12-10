weighting
forTerm: aVector

	^1 - ((super forTerm: aVector) / (aVector size log: 2))