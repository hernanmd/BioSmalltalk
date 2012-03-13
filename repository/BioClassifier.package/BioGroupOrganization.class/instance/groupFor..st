accessing
groupFor: anObject

	| attValue |
	
	attValue := anObject perform: self selector.
	^ self strategy = #=
		ifTrue: [ 
			self contents 
					detect: [: cluster | cluster feature perform: self strategy with: attValue ]
					ifNone: [ nil ] ]
		ifFalse: [ self contents detectMax: [: org | org feature perform: self strategy with: attValue ] ].

