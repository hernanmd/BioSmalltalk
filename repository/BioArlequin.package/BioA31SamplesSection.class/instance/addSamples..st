accessing
addSamples: aBioA31SampleCollection 
	" Add populations to the receiver from aBioaBioA31SampleCollection "

	aBioA31SampleCollection do: [ : sample |
		self 
			addSampleName: sample identifier;
			addSampleSize: sample frequency;
			addSampleData: sample sequence ]