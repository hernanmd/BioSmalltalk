instance creation
with: left with: right at: threshold

	| new |
	new := (self new)
		instVarNamed: 'left' put: left;
		instVarNamed: 'right' put: right;
		instVarNamed: 'threshold' put: threshold;
		yourself.
	left instVarNamed: 'parent' put: new.
	right instVarNamed: 'parent' put: new.
	^new