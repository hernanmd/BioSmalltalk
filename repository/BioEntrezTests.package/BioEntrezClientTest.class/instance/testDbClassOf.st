testing
testDbClassOf

	self assert: ( BioEntrezDatabase dbClassOf: 'nuccore' ) = BioEntrezNuccore.
	self assert: ( BioEntrezDatabase dbClassOf: 'biosample') = BioEntrezSample.
