testing
testLetters02RNA

	self assert: BioIUPACAmbiguousRNA new codes asSet =  'GAUCRYWSMKHBVDN' asSet.
	self assert: BioIUPACUnambiguousRNA new codes asSet = 'GAUC' asSet.

	