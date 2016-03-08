testing
includesLocation: locationString
	" Answer whether the receiver includes locationString. "

	^ self locations asLowercase anySatisfy: [ : n | n beginsWith: locationString asLowercase ]
