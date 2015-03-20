samples
addSampleName: aString
	" Add a sample named aString to the receiver "

	^ self iniFile 
			section: self newSampleKeyNumber
			at: self class sampleNameId key
			put: aString
		
