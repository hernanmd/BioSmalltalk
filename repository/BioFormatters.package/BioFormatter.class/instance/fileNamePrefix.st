accessing
fileNamePrefix

	^ fileNamePrefix
		ifNil: [ fileNamePrefix := String empty ]