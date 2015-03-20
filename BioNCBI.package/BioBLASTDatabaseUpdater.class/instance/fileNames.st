accessing
fileNames

	^ fileNames
		ifNil: [ fileNames := Set new: 200 ]	