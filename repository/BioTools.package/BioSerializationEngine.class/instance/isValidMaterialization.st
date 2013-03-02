testing
isValidMaterialization
	" Answer <true> if the receiver's location is valid for materialization "

	^ self fileStreamClass isAFileNamed: self location
