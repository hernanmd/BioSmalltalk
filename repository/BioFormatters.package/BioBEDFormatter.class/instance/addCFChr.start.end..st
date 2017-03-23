accessing - adding features
addCFChr: chrString start: chrStart end: chrEnd
	"
	Write minimal Custom Feature data in BED format.
	 
	chrString = The name of the chromosome: chr2, chrX, 4, c5 
	chrStart  = Starting position of the feature in the chromosome or scaffold
	chrEnd    = Ending position of the feature in the chromosome or scaffold
	"
	self outputFileStream 
		nextPutAll: chrString;
		nextPut: self delimiter;
		nextPutAll: chrStart asString;
		nextPut: self delimiter;
		nextPutAll: chrEnd asString.
	self orderIndex: 4.