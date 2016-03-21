accessing
classify: aSubject
	" Answer <true> if aSubject was classified in any receiver's organization "
	
	| group |
	
	(group := self organization groupFor: aSubject)
		ifNotNil: [ 
			self atMatchesPut: aSubject.
			group addClassification: aSubject ]
		ifNil: [ self atMismatchesPut: aSubject ].
	^ group isNil not