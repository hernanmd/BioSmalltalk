instance creation
new: aSize

	^(self basicNew)
		initializeSize: aSize;
		yourself