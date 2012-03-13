accessing
outputFileDirectory

	| fileDirectory |
	fileDirectory := FileDirectory on: self outputPath.
	fileDirectory assureExistence.
	
	^ fileDirectory