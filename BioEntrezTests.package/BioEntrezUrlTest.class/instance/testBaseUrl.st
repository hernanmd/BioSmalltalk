testing
testBaseUrl

	self assert: ( BioEGlobalQuery baseUrl isKindOf: String ).
	self deny: BioEGlobalQuery baseUrl isEmpty.
	
	self assert: ( BioEInfo baseUrl isKindOf: String ).
	self deny: BioEInfo baseUrl isEmpty.

	self assert: ( BioESearch baseUrl isKindOf: String ).
	self deny: BioESearch baseUrl isEmpty.
