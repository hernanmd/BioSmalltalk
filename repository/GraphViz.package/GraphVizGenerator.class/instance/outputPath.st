accessing
outputPath

	^ outputPath ifNil: [(FileDirectory default directoryNamed: #dot) fullName]
