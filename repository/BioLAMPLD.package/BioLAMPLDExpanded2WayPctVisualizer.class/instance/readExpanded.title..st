initialization
readExpanded: aFilename title: aString
	" Private - Read expanded output file from LAMP-LD. Use aString as title "

	contents := aFilename asFileReference contents.
	self dataPoints: contents lines.	
	self snpCount: self dataPoints first size.
	self initializeMatrix.
	self addGrapher: contents named: aString.