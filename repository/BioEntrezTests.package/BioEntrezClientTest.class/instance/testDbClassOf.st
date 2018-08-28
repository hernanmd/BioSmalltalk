testing
testDbClassOf
	self
		assert: (BioEntrezDatabase dbClassOf: 'nuccore')
		equals: BioEntrezNuccore.
	self
		assert: (BioEntrezDatabase dbClassOf: 'biosample')
		equals: BioEntrezSample