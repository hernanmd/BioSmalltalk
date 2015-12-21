accessing
subSeqFrom: startInteger to: endInteger
	" Answer the <String> in the receiver's sequence from startInteger to endInteger.
	startInteger cannot be larger than endInteger, otherwise raise an Exception "
	
	^ seq copyFrom: startInteger to: endInteger
	
	