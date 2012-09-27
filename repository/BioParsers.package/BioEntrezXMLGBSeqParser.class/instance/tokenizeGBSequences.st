accessing
tokenizeGBSequences
	" Parse the receiver expression and answer the header nodes found "

	parser := XMLPullParser parse: self expression.
	[ parser atEnd ] whileFalse: [
		( parser is: 'GBSeq' )
			ifTrue: [ self scanSequences ]
			ifFalse: [ parser next ]
	].
	^ self result