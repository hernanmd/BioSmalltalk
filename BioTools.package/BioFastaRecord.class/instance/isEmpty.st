testing
isEmpty
	" Answer <true> if the receiver does not contain either a name/header description or a sequence "
	
	^ self hasName not and: [ self sequenceString isEmpty not ]