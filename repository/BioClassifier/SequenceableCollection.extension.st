Extension { #name : #SequenceableCollection }

{ #category : #'*BioClassifier' }
SequenceableCollection >> asBioGroupOrganization [

	^ BioGroupOrganization new
		elementGroupClass: self class;
		contents: self;
		yourself
]
