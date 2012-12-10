private
readOutputUt

	| stream result |
	[ stream := NetworkByteOrderStream readFile: self outputUtFilename.
	result := RowMatrix readFromDenseBinary: stream ]
	ensure: [ stream close ].
	^result.