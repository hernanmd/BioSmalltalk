testing
test13randomSeq

	| seq |
	
	seq := BioSequence new 
			randomLength: 10 
			for: BioIUPACUnambiguousDNA.
	self assert: seq size = 10.
	self assert: seq alphabet = BioIUPACUnambiguousDNA


