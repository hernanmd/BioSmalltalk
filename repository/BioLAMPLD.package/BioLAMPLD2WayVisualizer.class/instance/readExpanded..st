initialization
readExpanded: aFilename
	" Private - Initialize the receiver's data "

	contents := aFilename asFileReference contents.
	self dataPoints: contents lines.	
	self snpCount: self dataPoints first size.
	self initializeMatrix.
	self addGrapher: contents named: aFilename.
	