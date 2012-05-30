testing
hasContents
	" Answer <true> if the receiver's contents is not empty "

	^ contents isNil not and: [ contents isEmpty not ]