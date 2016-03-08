accessing
addLocation: locationString
	" Add locationString to the receive's locations "

	self locations 
			add: locationString;
			yourself.