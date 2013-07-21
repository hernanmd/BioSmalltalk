benchmark scripts
fasta: n

	self fasta: n to: FileStream stdout.
	^ String empty