accessing
csvWriter
	^ csvWriter
		ifNil: [ 
			self initializeCSVWriter.
			csvWriter ]