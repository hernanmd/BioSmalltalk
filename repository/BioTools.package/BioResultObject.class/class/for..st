instance creation
for: aBioGBSeqCollection

	^ aBioGBSeqCollection isEmpty 	
		ifTrue: [ BioEmptyResultObject new ]
		ifFalse: [ self halt. BioNCBIGenBankResult new ]