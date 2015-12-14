*BioTools
isBiologicalSequence
	" Answer <true> if the receiver represents an identifiable biological letter "
	
	^ (self notEmpty
		and: [ self allSatisfy: #isBiologicalSequence ])
		and: [ self isBioSpecialIdentifier not ]