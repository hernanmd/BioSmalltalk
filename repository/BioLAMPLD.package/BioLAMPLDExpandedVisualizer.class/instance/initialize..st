initialization
initialize: aFilename
	" Private - Initialize the receiver's data "

	|  fileContents |
	
	fileContents := aFilename asFileReference contents.
	self dataPoints: fileContents lines.	
	self snpCount: self dataPoints first size.
	self initializeMatrix.
	self initializeGraphers: fileContents.			