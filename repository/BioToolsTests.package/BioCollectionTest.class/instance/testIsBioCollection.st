testing
testIsBioCollection

	self assert: (BioOrderedCollection withAllSubclasses allSatisfy: [ : cls | cls new isBioCollection ]) .
	self deny: OrderedCollection new isBioCollection.