private
newSampleKey
	" Answer an 'anonymous' sample key Number suitable for adding a new sample "
	
	self sampleKeyNumber: self sampleKeyNumber + 1.
	^ self sampleKeyNumber