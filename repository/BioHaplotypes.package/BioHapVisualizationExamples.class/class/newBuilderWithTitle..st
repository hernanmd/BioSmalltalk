accessing
newBuilderWithTitle: aString

	(Smalltalk hasClassNamed: #RTDowserBuilder)
		ifFalse: [ self notify: 'this example requires Roassal Dowser Builder (RTDowserBuilder class) which was not found in the system']
		ifTrue: [ 
			^  (Smalltalk at: #RTDowserBuilder) new
				title: aString;
				yourself ]
		