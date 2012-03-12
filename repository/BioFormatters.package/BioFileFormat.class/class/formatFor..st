accessing
formatFor: nameString

	| found |
	
	found  := self registry 
			detect: [: fmt | fmt includesName: nameString ]
			ifNone: [ ^ self signalNotFound: 'Format not found' ].
	^ found
	

			