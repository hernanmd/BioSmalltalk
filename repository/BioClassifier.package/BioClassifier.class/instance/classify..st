accessing
classify: anObject
	" Answer <true> if aSubject was classified in the receiver's organization "
	
	| group |
	
	(group := self organization groupFor: anObject)
		ifNotNil: [ 
			self atMatchesPut: anObject.
			group addClassification: anObject ]
		ifNil: [ self atMismatchesPut: anObject ].
	^ group isNil not