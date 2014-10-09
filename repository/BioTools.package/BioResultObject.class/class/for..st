instance creation
for: aBioGBSeqCollection

	^ aBioGBSeqCollection isEmpty 	
		ifTrue: [ BioEmptyResultObject new ]
		ifFalse: [ BioNCBIGenBankResult new ]