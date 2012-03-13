testing
testValidParameters

	self assert: ( BioEFetchCmd validParameters isKindOf: Collection ).
	self assert: ( BioEFetchRetCmd validParameters isKindOf: Collection ).
	self assert: ( BioEFetchSeq validParameters isKindOf: Collection ).
	self assert: ( BioEFetchTax validParameters isKindOf: Collection ).
	self assert: ( BioEGlobalQuery validParameters isKindOf: Collection ).
	self assert: ( BioEInfo validParameters isKindOf: Collection ).
	self assert: ( BioELink validParameters isKindOf: Collection ).
	self assert: ( BioEPost validParameters isKindOf: Collection ).
	self assert: ( BioESearch validParameters isKindOf: Collection ).
	self assert: ( BioESpell validParameters isKindOf: Collection ).
	self assert: ( BioESummary validParameters isKindOf: Collection ).
	self assert: ( BioEWebEnvCmd validParameters isKindOf: Collection ).
	self assert: ( BioEntrezCommand validParameters isKindOf: Collection ).
