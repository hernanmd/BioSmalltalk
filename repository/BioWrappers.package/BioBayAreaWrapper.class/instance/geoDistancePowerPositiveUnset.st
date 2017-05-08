options - analysis settings
geoDistancePowerPositiveUnset
	" Constrains the distance power parameter to be positive when True. This may lead to more sensible parameter inferences when range data are sparse and global. "

	self propertyAt: 'geoDistancePowerPositive' ifAbsentPut: [ 'F' ]
