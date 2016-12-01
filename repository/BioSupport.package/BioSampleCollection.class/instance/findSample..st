accessing
findSample: aString
	" Find a <BioSample> identified by aString in the receiver "

	^ self samples 
		detect: [ : sample | sample identifier = aString ]