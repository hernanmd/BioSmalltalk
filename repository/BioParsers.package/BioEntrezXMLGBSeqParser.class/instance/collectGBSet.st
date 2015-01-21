accessing
collectGBSet
	" Parse the receiver expression and answer a <Collection> of resulting nodes "

	parser := XMLPullParser parse: self expression.
	parser reset.
	[ parser isEndDocument ] whileFalse: [
		parser if: 'GBSeq' peek: [ self saveGBSeq ].
		(parser nodesIfAny: self selectedNodes) ifNotEmptyDo: [ : result | self saveGBNode: result ].
		parser next ].
	(parser isEndDocument and: [ matches notNil ])
		ifTrue: [ self saveGBSeq ].
	^ self results.