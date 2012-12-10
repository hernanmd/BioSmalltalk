weighting
forTerm: aVector

	"^1 + ((aVector size / (self documentFrequency: aVector)) log: 2)"
	^((aVector size / (self documentFrequency: aVector)) log: 2)