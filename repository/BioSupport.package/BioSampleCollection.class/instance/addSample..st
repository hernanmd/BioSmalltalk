accessing
addSample: aString
	" Add a <BioSample> identified by aString to the receiver "

	self samples add: 
		(self sampleClass new 
			identifier: aString;
			yourself)