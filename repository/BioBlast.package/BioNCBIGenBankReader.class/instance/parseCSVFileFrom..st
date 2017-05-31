accessing
parseCSVFileFrom: aFilename
	" Parse documents located at aFilename in the internal CSV format, and update the receiver's contents with the result "
	
	(NeoCSVReader on: (self openFullFileNamed: aFilename) readStream)
		skipHeader;
		converter: UTF8TextConverter new;
		separator: $|;
		do: [ : row | self halt ."self results add:  row" ].	
