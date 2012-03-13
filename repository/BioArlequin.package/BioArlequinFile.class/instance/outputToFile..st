accessing
outputToFile: aString

	^ BioObject new 
		outputToFile: aString , '.arp'
		contents: self contents