accessing
collectGBSet
	" Parse the receiver expression and answer the header nodes found "

	parser := XMLPullParser parse: self expression.
	[ parser isEndDocument ] whileFalse: [
		(parser is: 'GBSeq')
			ifTrue: [ self collectGBSeqRecord ]
			ifFalse: [ self saveGBSeqRecord.
				parser next ] ].
	^ self results