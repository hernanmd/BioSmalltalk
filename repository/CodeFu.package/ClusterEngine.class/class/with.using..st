instance creation
with: aCollection using: aDistanceBlock

	^self withDistanceMatrix: (DistanceSquare on: aCollection using: aDistanceBlock)