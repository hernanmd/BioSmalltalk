accessing
blastPropertyAt: aName
	" Answer a <BioNCBIBlastProperty> matching aName display name "
	
	^ self blastProperties detect: [: p | p displayName = aName ]