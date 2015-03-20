accessing hit individually
asAccessionString
	" Answer a <String> of receiver's accession number from the accession node, for example: 'AAF52530.1' 
	Note: The value from the accession node usually doesn't contain the accession version number "
	
	^ self asAccessionToken first
