testing
isProteinSequence
	" Answer <true> if the receiver represents an identifiable biological letter "
	
	^ self alphabet isProtein and: [ seq isProteinSequence ]