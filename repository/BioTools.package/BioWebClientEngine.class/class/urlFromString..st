accessing
urlFromString: aString
	" Answer an URL object with aString as resource locator "
	
	^ self adapterClass new urlFromString: aString