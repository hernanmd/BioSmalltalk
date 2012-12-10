instance creation
on: items using: distanceBlock

	^(self new: items size)
		initialize: items using: distanceBlock;
		yourself