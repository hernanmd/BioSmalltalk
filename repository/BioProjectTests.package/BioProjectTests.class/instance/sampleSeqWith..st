accessing
sampleSeqWith: aString

	^ BioSeqRecord new
		seq: ( BioSequence newWith: aString alphabet: BioIUPACAmbiguousDNA )
