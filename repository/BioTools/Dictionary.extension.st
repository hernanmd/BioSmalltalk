Extension { #name : #Dictionary }

{ #category : #'*BioTools' }
Dictionary >> asBio: aBioCollectionClass [

	| collection |
	
	collection := aBioCollectionClass new: self size.
	self associationsDo: [ : assoc | collection add: assoc key -> (assoc value asBio: aBioCollectionClass) ].
	^ collection
]

{ #category : #'*BioTools' }
Dictionary >> dumpToStream: aStream [
	" Private - Write the receiver's contents into aStream "
	
	self associationsDo: [ : assoc | 
			assoc dumpToStream: aStream.
			aStream bioCr ]

]
