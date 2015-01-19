*BioEntrez
features
	" Detect the record with most features and answer a sorted <Collection> of <String> with them "
	
	^ (self detectMax: [ : d | d features size ]) features asSortedCollection
	