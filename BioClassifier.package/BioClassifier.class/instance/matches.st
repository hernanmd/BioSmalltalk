accessing
matches

	^ matches 
		ifNil: [ matches := Dictionary new  ].
