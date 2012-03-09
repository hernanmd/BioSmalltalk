*BioTools
outputTo: aStream

	self do: [ : each |
		each 
			outputTo: aStream.
		aStream cr. ]
