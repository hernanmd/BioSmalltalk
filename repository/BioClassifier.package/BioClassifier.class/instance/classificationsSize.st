accessing
classificationsSize
	" Answer a <Number> of how many observations were classified "

	^ self matches 
		ifNotEmpty: [ : m | m sum: #size ] 
		ifEmpty: [  0 ]
	