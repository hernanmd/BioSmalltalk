private
readOutputVt

	| stream result |
	[ stream := NetworkByteOrderStream readFile: self outputVtFilename.
	result := RowMatrix readFromDenseBinary: stream ]
	ensure: [ stream close ].
	^result.