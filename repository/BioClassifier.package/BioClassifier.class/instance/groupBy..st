accessing
groupBy: anObject

	| replacement newClassifications |
	
	newClassifications := self groupClass new.
	replacement := self organization contents collect: [: org | 
		newClassifications add: ( org groupBy: anObject ) ].
	^ newClassifications
