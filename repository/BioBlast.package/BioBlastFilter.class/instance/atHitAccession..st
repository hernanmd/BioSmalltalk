accessing
atHitAccession: aString
	" Answer the <BlastNode> in the receiver's hits matching aString accession number. 
	See also comment in #asAccessionString "

	^ self hits detect: [ : node | node asAccessionString = aString asAccessionStringWithoutVersion asLowercase ]