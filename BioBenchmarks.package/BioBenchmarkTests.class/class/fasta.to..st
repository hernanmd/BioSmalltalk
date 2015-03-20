benchmarking
fasta: n to: out

	| r lineLength |
	lineLength := 60.
	self
		writeFasta: 'ONE Homo sapiens alu'
		from: (BioRepeatStream to: n * 2 on: self alu)
		to: out
		lineLength: lineLength.
	
	r := BioRandomNumber to: 1. "Shared random sequence"
	self
		writeFasta: 'TWO IUB ambiguity codes'
		from: ((BioRandomStream to: n * 3 on: self iub)
			random: r;
			yourself)
		to: out
		lineLength: lineLength.

	self
		writeFasta: 'THREE Homo sapiens frequency'
		from: ((BioRandomStream to: n * 5 on: self homoSapiens)
			random: r;
			yourself)
		to: out
		lineLength: lineLength.

   out flush.