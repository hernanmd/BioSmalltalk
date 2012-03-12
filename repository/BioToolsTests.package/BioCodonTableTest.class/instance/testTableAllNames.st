testing
testTableAllNames

	self assert: ( BioDNACodonTables tableAllNames isKindOf: Collection ).
	self assert: ( BioDNACodonTables tableAllNames allSatisfy: [: tNames | tNames size >= 2 ] ).
	self assert: ( BioDNACodonTables tableAllNames allSatisfy: [: tNames | tNames first isNumber and: [ tNames second isString ] ] )
	
