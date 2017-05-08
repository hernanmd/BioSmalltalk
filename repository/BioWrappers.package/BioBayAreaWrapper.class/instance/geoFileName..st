properties - input/output
geoFileName: fileName  
	" Set the geography le containing latitudes and longitudes "

	self propertyAt: 'geoFileName' ifAbsentPut: [ fileName ]