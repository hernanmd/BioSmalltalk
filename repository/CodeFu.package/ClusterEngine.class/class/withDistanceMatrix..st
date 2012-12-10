instance creation
withDistanceMatrix: distanceMatrix

	^(self new)
		instVarNamed: 'distanceMatrix' put: distanceMatrix;
		yourself