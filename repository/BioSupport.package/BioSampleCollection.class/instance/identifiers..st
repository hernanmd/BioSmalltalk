accessing
identifiers: aCollection
	" Add samples from aCollection of identifiers to the receiver "
	
	aCollection do: [: id |
		self samples addLast: 
			(BioSample new 
					setNameFormatStandard;
					identifier: id) ]