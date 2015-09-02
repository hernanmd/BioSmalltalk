accessing
exportWeights

	self samples anyOne size 
		timesRepeat: [
			 self stream 
				nextPutAll: '10';
				nextPut: $; ].
	self stream cr