testing
testTokenizeGenBankIdentifier02

	self assert: ( BioParser tokenizeGi: 'gi|32128012' ) = '32128012'.
	self assert: ( BioParser tokenizeGi: 'gi|152787' ) = '152787'.