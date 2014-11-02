accessing
alignmentViewFlatQueryAnchoredNoIdentities
	" Type of alignment view (FORMAT_OBJECT=Alignment only)
	This is the option described in web page as 
	Flat query-anchored with letters for identities "
	
	self clientUrl queryAt: 'ALIGNMENT_VIEW' put: 'FlatQueryAnchoredNoIdentities'