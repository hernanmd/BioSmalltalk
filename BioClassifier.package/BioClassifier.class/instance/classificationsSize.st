accessing
classificationsSize
	" Answer a <Number> of how many observations were classified "

	^ self matches 
		ifNotEmptyDo: [ : m | m sum: #size ] 
		ifEmpty: [  0 ]
	