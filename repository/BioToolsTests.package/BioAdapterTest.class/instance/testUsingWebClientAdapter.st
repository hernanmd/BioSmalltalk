testing
testUsingWebClientAdapter

"	| testAddress |
	
	( testAddress := self urlTestAddress ) = self nullUrlAddress
		ifFalse: [
			adapter := BioWebClientEngine for: testAddress .
			self deny: adapter url isNil.
			self assert: adapter url = testAddress. 
			self assert: adapter downloadUrl = testAddress.
			self assert: adapter responseType isBehavior.
			self assert: ( adapter httpGet isKindOf: adapter responseType ).
			self assert: ( adapter httpGetContents isKindOf: String ) ]."
