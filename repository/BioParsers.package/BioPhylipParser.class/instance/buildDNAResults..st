accessing-dna
buildDNAResults: aCollection
	" Answer an identified object for the receiver's parsing output "

	| tokenized sequences |
	
	self halt.
	tokenized := self buildTokens: aCollection.
	sequences := tokenized third 
			with: tokenized fourth 
			do: [: first : snd | BioSequence newAmbiguousDNA: snd named: first ].
	^ BioPhylip new
		numberOfTaxa: tokenized first;
		numberOfCharacters: tokenized second;
		sequences: sequences.