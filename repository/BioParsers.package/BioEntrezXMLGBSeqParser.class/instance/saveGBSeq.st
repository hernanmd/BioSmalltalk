private
saveGBSeq

	self matches notEmpty
		ifTrue: [ 
			self results add: (BioGenBankRecord new properties: matches).
			self matches: nil. ]