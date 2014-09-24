accessing
groupBy: anObject

	| replacement newClassifications |
	
	newClassifications := OrderedCollection new.
	replacement := self organization contents collect: [: org | 
		newClassifications add: ( org groupBy: anObject ) ].
	^ newClassifications
