*BioTools
asBio: aBioCollectionClass

	| collection |
	
	collection := aBioCollectionClass new: self size.
	self associationsDo: [ : assoc | collection add: assoc key -> (assoc value asBio: aBioCollectionClass) ].
	^ collection