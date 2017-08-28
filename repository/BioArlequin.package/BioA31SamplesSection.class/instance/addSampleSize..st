samples
addSampleSize: aNumber

	self iniFile 
		section: self sampleKeyNumber
		at: self class sampleSizeId key
		put: aNumber asString	