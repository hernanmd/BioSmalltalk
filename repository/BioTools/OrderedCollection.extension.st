Extension { #name : #OrderedCollection }

{ #category : #'*BioTools' }
OrderedCollection >> asBio: aBioCollectionClass [

	| collection |
	
	collection := aBioCollectionClass new: self size.
	self do:[: obj | collection add: obj ].
	^ collection
]

{ #category : #'*BioTools' }
OrderedCollection >> bioRemove: anObject [

	self do: [ : obj | obj remove: anObject ]

]
