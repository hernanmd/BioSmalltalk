instance creation
withAll: aCollection

	^(self new: aCollection size)
		atAllPut: aCollection;
		yourself