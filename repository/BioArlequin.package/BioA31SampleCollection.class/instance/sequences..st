accessing
sequences: aCollection
	" Complete samples from aCollection of letters in the receiver "
	
	aCollection with: self samples do: [: seqCollection : sample |
		sample sequence: seqCollection ]