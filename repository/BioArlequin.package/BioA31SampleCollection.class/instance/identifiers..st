accessing
identifiers: aCollection
	" Add samples from aCollection of identifiers to the receiver "
	
	aCollection do: [: id |
		self samples addLast: 
			( self sampleClass new 
					setNameFormatStandard;
					identifier: id ) ]