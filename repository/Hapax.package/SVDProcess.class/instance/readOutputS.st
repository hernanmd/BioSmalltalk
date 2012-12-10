private
readOutputS

	| stream result |
	[ stream := self outputSFilename readStream.
	result := ArrayVector readFromDenseText: stream ]
	ensure: [ stream close ].
	^result.