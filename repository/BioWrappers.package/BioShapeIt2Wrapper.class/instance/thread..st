properties - model
thread: aNumber 
	" Set thread to be aNumber. It is strongly adviced to use the multi-threading capabilities of SHAPEIT. "

	self propertyAt: 'T' ifAbsentPut: [ aNumber ]