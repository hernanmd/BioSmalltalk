testing
testLetters03Protein

	self assert: BioIUPACProtein new codes asSet = 'ACDEFGHIKLMNPQRSTVWY' asSet.
	self assert: BioIUPACProteinExtended new codes asSet = 'ACDEFGHIKLMNPQRSTVWYBXZJUO' asSet.

	