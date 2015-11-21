testing
testAmbiguityCodes

	sequence := BioSequence newAmbiguousDNA: String empty.

	self deny: sequence ambiguityCodes isNil.
	self deny: sequence ambiguityCodes isEmpty.
	self assert: (sequence ambiguityCodes includes: $N).

	sequence := BioSequence newProtein: String empty.

	self deny: sequence ambiguityCodes isNil.
	self deny: sequence ambiguityCodes isEmpty.
	self assert: (sequence ambiguityCodes includes: $X).

	sequence := BioSequence newAmbiguousRNA: String empty.

	self deny: sequence ambiguityCodes isNil.
	self deny: sequence ambiguityCodes isEmpty.
	self assert: (sequence ambiguityCodes includes: $N).