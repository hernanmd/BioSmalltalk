*BioClassifier
asBioGroupOrganization

	^ BioGroupOrganization new
		elementGroupClass: self class;
		contents: self;
		yourself