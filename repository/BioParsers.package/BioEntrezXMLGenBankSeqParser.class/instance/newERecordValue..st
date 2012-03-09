accessing
newERecordValue: aString
	" Private - Save current node with value aString in the receiver's current entrez record entry "
	
	current = 'GBSeq'
		ifFalse: [ self saveERecordValue: aString ]
		ifTrue: [
			self eRecord isEmpty
				ifFalse: [ 
					self results add: self eRecord.
					self eRecord: Dictionary new  ] ]