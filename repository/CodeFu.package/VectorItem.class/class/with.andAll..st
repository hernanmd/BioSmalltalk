instance creation
with: anElement andAll: aCollection

	^(self on: (ArrayVector withAll: aCollection))
		item: anElement;
		yourself