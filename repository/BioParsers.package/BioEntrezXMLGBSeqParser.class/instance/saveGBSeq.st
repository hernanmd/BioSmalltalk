private
saveGBSeq

	matches notEmpty
		ifTrue: [ 
			self results add: (BioGenBankRecord new properties: matches).
			matches := Dictionary new. ]