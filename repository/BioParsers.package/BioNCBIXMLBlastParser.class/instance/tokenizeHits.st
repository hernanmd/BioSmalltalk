accessing
tokenizeHits
	" Parse the receiver expression and answer the header nodes found "

	[ parser atEnd ] whileFalse: [
		(parser is: 'Hit') ifTrue: [ 
			[ parser isEndTag: 'Hit' ] whileFalse: [ 
				(self selectedNodes includes: parser tag)
					ifTrue: [ self saveTag: parser tag value: parser text ].
				parser next ] ]
			ifFalse: [ parser next ] ].
	^ self result