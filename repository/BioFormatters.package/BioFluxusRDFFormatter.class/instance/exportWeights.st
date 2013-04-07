accessing
exportWeights

	self samplesCollection anyOne size 
		timesRepeat: [
			 self stream 
				nextPutAll: '10';
				nextPut: $; ].
	self stream cr