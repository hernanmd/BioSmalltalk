accessing
groupFor: anObject feature: featureName

	| attValue |
	attValue := anObject perform: self selector.
	^ self strategy = #=
		ifTrue: [ self contents 
				detect: [: cluster | (cluster perform: featureName) perform: self strategy with: attValue ]
				ifNone: [ nil ] ]
		ifFalse: [ self contents detectMax: [: org | (org perform: featureName) perform: self strategy with: attValue ] ].

