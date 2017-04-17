accessing
newSampleSeqRecord: aString

	^ BioSeqRecord new
		sequence: (BioSequence newWith: aString alphabet: BioIUPACAmbiguousDNA)
