testing
testRandomSeq

	| seq |
	
	seq := BioSequence new 
			randomLength: 10 
			for: BioIUPACUnambiguousDNA.
	self assert: seq size equals: 10.
	self assert: seq alphabet equals: BioIUPACUnambiguousDNA


