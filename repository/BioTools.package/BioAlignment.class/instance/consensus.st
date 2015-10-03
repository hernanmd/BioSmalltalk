accessing
consensus
	" Consensus sequence is the calculated order of most frequent residues, either nucleotide or amino acid, found at each position in a sequence alignment. Only DNA and RNA sequences are valid "

	| consensusSeq |
	
	consensusSeq := BioMutableSeq newWith: (String new: self numberOfCharacters) alphabet: BioIUPACAmbiguousDNA.
	1 to: self numberOfCharacters do: [ : index | consensusSeq at: index put: (self consensusAt: (self atColumn: index)) ].
    ^ consensusSeq