accessing
features
	" Detect the record with most features and answer a <Collection> with them "
	
	^ (self detectMax: [ : d | d value size ]) features
	