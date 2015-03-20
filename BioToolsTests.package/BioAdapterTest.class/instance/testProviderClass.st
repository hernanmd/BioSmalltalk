testing
testProviderClass

	| concreteAdapters |
	
	concreteAdapters := BioAbstractAdapter allFinalClasses.
	self deny: concreteAdapters isEmpty.
	self assert: (concreteAdapters allSatisfy: [: adptClass | adptClass respondsTo: #providerClass ]).
	self assert: (concreteAdapters allSatisfy: [: adptClass | adptClass providerClass isKindOf: Symbol ]).
