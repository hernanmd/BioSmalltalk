testing
testSettingWebClientAdapter

	| testAddress |
	
	( testAddress := self urlTestAddress ) = self nullUrlAddress
		ifFalse: [
			adapter := BioWebClientEngine for: testAddress.
			self deny: adapter provider isNil.
			self deny: adapter provider isBehavior.
			self assert: ( adapter provider isKindOf: ( self classFor: BioWebClientEngine adapter providerClass ) ).
			testAddress = self defaultUrlTestAddress 
				ifFalse: [ BioWebClientEngine stopWebServer ] ].


			

