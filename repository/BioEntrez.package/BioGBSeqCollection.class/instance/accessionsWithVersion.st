accessing
accessionsWithVersion

	^ self collect: [ : d | d at: self class qualifierForAccessionWithVersion ]