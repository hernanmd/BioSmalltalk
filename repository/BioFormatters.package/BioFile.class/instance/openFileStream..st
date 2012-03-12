accessing
openFileStream: aFilePath

	| fullPath |
	
	fullPath := [ aFilePath fullName ]
	on: Error
	do: [ : ex | aFilePath ].
	^ self fileStreamClass readOnlyFileNamed: fullPath