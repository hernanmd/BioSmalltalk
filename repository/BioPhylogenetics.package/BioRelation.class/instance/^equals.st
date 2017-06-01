comparing
= aBioRelation
	"Answer whether the receiver and anObject represent the same object."

	self class = aBioRelation class
		ifFalse: [ ^ false ].
	self edge = aBioRelation edge 
		ifFalse: [ ^ false ].
	self node = aBioRelation node
		ifFalse: [ ^ false ].
	^ true