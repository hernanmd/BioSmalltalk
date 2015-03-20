testing
test02Providers

	self adapterEngines do: [: sCls | 
		self should: [ sCls providerClass ] raise: Error.
		self assert: ( sCls allSubclasses allSatisfy: [: cls | cls respondsTo: #providerClass ] ).
		self assert: ( sCls validAdapters allSatisfy: [ : cls | ( BioObject classFor: cls providerClass ) isBehavior ] ).		
		self assert: ( sCls hasAnyProvider isKindOf: Boolean ).		
		sCls hasAnyProvider
			ifTrue: [	
				self assert: ( sCls allSubclasses anySatisfy: [: cls | Smalltalk hasClassNamed: cls providerClass asString ] ) ]
			ifFalse: [
				self deny: ( sCls allSubclasses anySatisfy: [: cls | Smalltalk hasClassNamed: cls providerClass asString ] ) ] 
		].