private
saveGBSeq
	" Private - Save matched nodes into receiver's results. Usually this operation implies a new record subtree has been found "

	self matches notEmpty
		ifTrue: [ 
			self results add: (BioGenBankRecord new properties: matches).
			self matches: nil. ]
