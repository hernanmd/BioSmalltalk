accessing
addSample: aString
	" Add a <BioSample> identified by aString to the receiver "

	self samples add: 
		(BioSample new 
			identifier: aString;
			yourself)