accessing private
tokenize
	" Private - Answer a String with the receiver's expression tokenized "
	
	^ super tokenize pairsCollect: [: one : two | Array with: one with: two ]