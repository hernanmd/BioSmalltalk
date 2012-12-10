instance creation
new: numberOrPoint withAll: value

	^(self new: numberOrPoint)
		atAllPut: value;
		yourself.