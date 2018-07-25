testing
test01QueryingNodes

	| filterResult theHsps theHsp |
	
	self saxParseBlastNodes: #hits01.
	filterResult := result hspAlignLengths: [ : node | node blastValue > 100 ].
	
	self assert: filterResult isCollection.
	self deny: filterResult isEmpty.
	self assert: filterResult size equals: 2.

	theHsps := filterResult first hitHsps.
	theHsp := theHsps nodes first.
	self assert: theHsp hspAlignLength blastValue equals: 240.
	self should: [ theHsps nodes second ] raise: Error.

	theHsps := filterResult second hitHsps.
	theHsp := theHsps nodes first.
	self assert: theHsp hspAlignLength blastValue equals: 240.
	self should: [ theHsps nodes second ] raise: Error.
