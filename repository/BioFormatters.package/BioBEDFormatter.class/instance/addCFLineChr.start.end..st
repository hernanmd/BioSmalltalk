accessing - adding features
addCFLineChr: chrString start: chrStart end: chrEnd
	"
	Write minimal Custom Feature data line in BED format.
	 
	chrString = The name of the chromosome: chr2, chrX, 4, c5 
	chrStart  = Starting position of the feature in the chromosome or scaffold
	chrEnd    = Ending position of the feature in the chromosome or scaffold
	"
	self 
		addCFChr: chrString start: chrStart end: chrEnd;
		nextPutTerminator