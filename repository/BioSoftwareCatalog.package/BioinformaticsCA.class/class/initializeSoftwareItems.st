accessing
initializeSoftwareItems
	" Private - Initialize software items to the receiver's catalog "

	^ ((self caTSVFiles 
			collect: [ : fileReference | self readTSVFileNamed: fileReference fullName ])
			 joinUsing: Array new)
				reject: #isNil