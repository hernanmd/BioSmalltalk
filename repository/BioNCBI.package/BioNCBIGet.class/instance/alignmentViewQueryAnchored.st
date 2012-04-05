accessing
alignmentViewQueryAnchored
	" Type of alignment view (FORMAT_OBJECT=Alignment only)
	This is the option described in web page as 
	Query-anchored with dots for identities
	 "
	
	self clientUrl addParameters: 'ALIGNMENT_VIEW=QueryAnchored'