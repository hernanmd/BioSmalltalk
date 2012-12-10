instance creation
with: anElement

	^(self new)
		instVarNamed: 'element' put: anElement;
		yourself