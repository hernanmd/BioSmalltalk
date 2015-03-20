accessing
linesCount: aFilename
	" Answer a <Number> how many lines contains aFilename"

	^ self fileStreamClass
		readOnlyFileNamed: aFilename
		do: [ :file | | endings count |
			count := 0.
			file binary.
			file contents do: [ :c | c = 10 ifTrue: [ count := count + 1 ] ].
			count ]