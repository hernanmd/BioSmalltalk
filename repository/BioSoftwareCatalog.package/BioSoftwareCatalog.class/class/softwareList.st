accessing
softwareList
	" Answer a <Collection> of <BioSoftwareItem> "
	
	^ self updateOnDemand
		ifTrue: [ self initializeSoftwareItems ]
		ifFalse: [ items ifNil: [ items := self initializeSoftwareItems ] ]
