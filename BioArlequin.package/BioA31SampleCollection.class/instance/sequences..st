accessing
sequences: aCollection
	" Complete samples from aCollection of letters in the receiver "
	
	aCollection 
		with: self samples 
		do: [ : seq : sample |
			sample sequence: seq ]