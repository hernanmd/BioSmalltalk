accessing - custom track header
setItemRgbOn
	" Set the itemRgb attribute to individually color each data line. "

	self properties
		propertyAt: 'itemRgb'
		put: '"On"'