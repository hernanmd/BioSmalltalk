options
addPopFile: aFilename atOrder: nth
	" Add ancestry haplotypes file name aFilename "

	self parameters at: 3 + nth put: aFilename