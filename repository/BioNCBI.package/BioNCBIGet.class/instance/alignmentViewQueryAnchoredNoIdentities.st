accessing
alignmentViewQueryAnchoredNoIdentities
	" Type of alignment view (FORMAT_OBJECT=Alignment only) 
	This is the option described in web page as 
	Query-anchored with letters for identities
	"
	
	self clientUrl addParameters: 'ALIGNMENT_VIEW=QueryAnchoredNoIdentities'