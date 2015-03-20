instance creation
groupBy: keyString classifications: classifications
	" Answer a new receiver's instance setting keyString and classifications "
	
	^ self new 
		keyString: keyString;
		data: classifications;
		yourself
		