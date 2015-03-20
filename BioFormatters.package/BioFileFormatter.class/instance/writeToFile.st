accessing
writeToFile

	^ writeToFile
		ifNil: [ writeToFile := true ]