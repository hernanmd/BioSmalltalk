exporting
exportWeights
	" Private - Write the weight row "
	
	self outputFile cr.
	self matrix numberOfColumns 
		timesRepeat: [
			self outputFile
				nextPutAll: '10' ]
