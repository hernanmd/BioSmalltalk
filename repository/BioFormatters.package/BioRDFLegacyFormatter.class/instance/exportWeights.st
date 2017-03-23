exporting
exportWeights
	" Private - Write the weight row "
	
	self outputFileStream cr.
	self matrix numberOfColumns 
		timesRepeat: [
			self outputFileStream
				nextPutAll: '10' ]
