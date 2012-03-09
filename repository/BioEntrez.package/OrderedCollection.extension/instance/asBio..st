*bioentrez
asBio: aBioCollectionClass

	| collection |
	
	collection := aBioCollectionClass new: self size.
	self do:[: obj | collection add: obj ].
	^ collection