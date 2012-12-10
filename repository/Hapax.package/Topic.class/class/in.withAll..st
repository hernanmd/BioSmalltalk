instance creation
in: partition withAll: cluster

	^(self new)
		instVarNamed: 'cluster' put: cluster;
		instVarNamed: 'parent' put: partition;
		yourself