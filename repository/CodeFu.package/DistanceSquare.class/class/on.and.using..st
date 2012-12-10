instance creation
on: vectorA and: vectorB using: distanceBlock

	[ vectorA size = vectorB size ] assert.
	^(self new: vectorA size)
		initialize: vectorA and: vectorB using: distanceBlock;
		yourself