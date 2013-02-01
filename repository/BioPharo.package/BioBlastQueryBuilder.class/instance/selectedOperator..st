callbacks
selectedOperator: anObject
	" Private - Callback for filter selection "

	| newSelectedOperator |
	
	anObject ifNil: [^self].
	newSelectedOperator := anObject.

