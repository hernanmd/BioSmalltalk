accessing
groupBy: anObject

	| newClassifications |
	
	newClassifications := OrderedCollection new.
	self organizationContents collect: [ : org | newClassifications add: (org groupBy: anObject) ].
	^ newClassifications
