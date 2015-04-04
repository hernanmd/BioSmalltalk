accessing filters
lastFilter

	^ self filters notEmpty
		ifTrue: [ self filters last ]
		ifFalse: [ nil ]