accessing
softwareListClassifiers
	" Answer a <Collection> of qualifiers to be used for classifying software items. Tags were taken from the following sites "
	
	^ (self softwareList collect: #classifications) asSet