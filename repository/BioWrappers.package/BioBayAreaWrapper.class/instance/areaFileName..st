properties - input/output
areaFileName: fileName  
	" Set the data le containing presence-absence data for all taxa "

	self propertyAt: 'areaFileName' ifAbsentPut: [ fileName ]