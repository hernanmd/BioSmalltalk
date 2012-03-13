adding
addClassification: bioOrganization
	" Classify the receiver's subject in organization "

	self subjectIsUnclassified 
		ifTrue: [ bioOrganization addClassification: self subject ]