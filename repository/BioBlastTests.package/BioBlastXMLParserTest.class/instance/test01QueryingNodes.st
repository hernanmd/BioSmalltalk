testing
test01QueryingNodes

	| filterResult theHsps theHsp |
	
	self parseBlastNodes: #hits01.
	filterResult := result hspAlignLengths: [: node | node blastValue > 100 ].
	
	self assert: filterResult isCollection.
	self deny: filterResult isEmpty.
	self assert: filterResult size = 2.

	theHsps := filterResult first hitHsps.
	theHsp := theHsps nodes first.
	self assert: theHsp hspAlignLength blastValue = 240.
	self should: [ theHsps nodes second ] raise: Error.

	theHsps := filterResult second hitHsps.
	theHsp := theHsps nodes first.
	self assert: theHsp hspAlignLength blastValue = 240.
	self should: [ theHsps nodes second ] raise: Error.
