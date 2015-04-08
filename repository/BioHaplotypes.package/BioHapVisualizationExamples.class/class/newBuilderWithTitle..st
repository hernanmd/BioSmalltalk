accessing
newBuilderWithTitle: aString

	(Smalltalk hasClassNamed: #RTDowserBuilder)
		ifFalse: [ self notify: 'this example requires Roassal Dowser Builder (RTDowserBuilder class)']
		ifTrue: [ 
			^  (Smalltalk at: #RTDowserBuilder) new
				title: aString;
				yourself ]
		