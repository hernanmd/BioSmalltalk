private
writeInput

	| stream |
	[ stream := NetworkByteOrderStream writeFile: self inputFilename.
	matrix storeSparseBinaryOn: stream.
	stream flush ] ensure: [ stream close ]