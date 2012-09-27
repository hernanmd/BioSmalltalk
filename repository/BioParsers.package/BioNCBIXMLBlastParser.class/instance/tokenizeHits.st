accessing
tokenizeHits
	" Parse the receiver expression and answer the header nodes found "

	parser := XMLPullParser parse: self expression.
	[ parser atEnd ] whileFalse: [
		( parser is: 'Hit' )
			ifTrue: [ self scanHits ]
			ifFalse: [ parser next ]
	].
	^ self result