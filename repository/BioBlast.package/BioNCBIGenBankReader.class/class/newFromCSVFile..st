instance creation
newFromCSVFile: csvFilename
	" Answer a new instance of the receiver with contents from csvFilename "
	
	^ self new parseCSVFileFrom: csvFilename