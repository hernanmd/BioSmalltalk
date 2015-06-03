instance creation
newFromClassifications: classifications
	" Answer a new receiver's instance setting classifications "
	
	^ self new 
		data: classifications;
		yourself
		