options - analysis settings
setModelTypeIndependence
	" Set Independence as the likelihood model to use. "

	self propertyAt: 'modelType' ifAbsentPut: [ '1' ]
