accessing
tokenizeHits
	" Parse the receiver expression and answer the header nodes found "

	[ parser atEnd ] whileFalse: [
		( parser is: 'Hit' )
			ifTrue: [ self scanHits ]
			ifFalse: [ Transcript show: parser next; cr ]
	].
	^ self result