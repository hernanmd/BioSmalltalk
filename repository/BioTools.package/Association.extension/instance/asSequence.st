*BioTools
asSequence
	" Transform the receiver between 1 and 4**k (key) and k-mer of length k (value) into a  <BioSequence> using an array with k-mers as indices "

	^ ((BioDNAAlphabet new sortedCodes enumerationsOfSize: self value) at: self key) 
		asSequence alphabet: BioDNAAlphabet new;
		yourself