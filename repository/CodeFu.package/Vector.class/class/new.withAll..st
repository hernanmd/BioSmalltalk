instance creation
new: aSize withAll: value

	^(self new: aSize)
		atAllPut: value;
		yourself