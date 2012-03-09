accessing
saveERecordValue: aString
	" Private - Save current node with value aString in the receiver's current entrez record entry "
	
	self eRecord at: current put: aString