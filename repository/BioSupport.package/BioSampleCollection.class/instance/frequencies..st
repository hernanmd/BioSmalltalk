accessing
frequencies: aCollection
	" Add samples from aCollection of identifiers to the receiver "
	
	aCollection 
		with: self samples 
		do: [: freq : sample | sample frequency: freq ]