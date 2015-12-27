testing
test04GetSettings

	self assert: (self ncbiClient get isKindOf: BioNCBIGet).
	self should: [ self ncbiClient fetch ] raise: BioErrorSpecificationObject.
