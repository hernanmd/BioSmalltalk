accessing
softwareList
	" Answer a <Collection> of <BioSoftwareItem> "
	
	^ Items
		ifNil: [ Items := self initializeSoftwareItems ]
	