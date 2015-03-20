*BioTools
isBiologicalSequence
	" Answer <true> if the receiver represents an identifiable biological letter "
	
	^ (self isEmpty not 
		and: [ self allSatisfy: #isBiologicalSequence ])
		and: [ self isBioSpecialIdentifier not ]