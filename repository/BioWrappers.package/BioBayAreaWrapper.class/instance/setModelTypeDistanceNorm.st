options - analysis settings
setModelTypeDistanceNorm
	" Set DISTANCE_NORM as the likelihood model to use. "

	self propertyAt: 'modelType' ifAbsentPut: [ '3' ]
