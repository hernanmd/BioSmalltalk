accessing
classify: anObject
	" Answer <true> if aSubject can be classified in the receiver's organization "
	
	| group |
	
	self subject: anObject.
	( group := self organization groupFor: self subject )
		ifNotNil: [ self addClassification: group ]
		ifNil: [ self unMatched ].
	^ group isNil not