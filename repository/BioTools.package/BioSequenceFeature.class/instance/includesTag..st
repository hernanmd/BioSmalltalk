accessing - tags
includesTag: tagName
	" Answer <true> if tag with tagName String is present in the receiver's tags "
	
	^ self tags includesKey: tagName