instance creation
formatterFor: aString
	" Answer a new instance of the receiver's matching aString identifier.
	I.e.: ( GTFormatter formatterFor: 'fasta' ) "
	
	| aClass |
	aClass := self allSubclasses 
			detect: [ : cls | cls identifiers includesLike: aString ]
			ifNone: [ self error: 'No formatter for ' , aString ].
	^ aClass new