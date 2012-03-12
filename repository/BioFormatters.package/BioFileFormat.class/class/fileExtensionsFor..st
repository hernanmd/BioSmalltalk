accessing
fileExtensionsFor: aFormatString

	| fmt |
	
	fmt := [ self formatFor: aFormatString ]
	on: BioNotFoundObject
	do: [: ex | ^ ex signal ].
	^ fmt extensions