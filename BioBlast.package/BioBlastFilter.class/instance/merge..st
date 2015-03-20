accessing
merge: aBioBlastFilter 
	" Merge the receiver with aBioBlastFilter"
	
	self filteredResultContents  addAll: (aBioBlastFilter filteredResultContents 
		reject: [ :  blastNode | self filteredResultContents includes: blastNode ]) 