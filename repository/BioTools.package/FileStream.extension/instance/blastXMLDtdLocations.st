*biotools
blastXMLDtdLocations
	" Answer a <Collection> of known NCBI Blast Output DTD locations "
	
	^ Array 
		with: '<!DOCTYPE BlastOutput PUBLIC "-//NCBI//NCBI BlastOutput/EN" "NCBI_BlastOutput.dtd">'
		with: '<!DOCTYPE BlastOutput PUBLIC "-//NCBI//NCBI BlastOutput/EN" "http://www.ncbi.nlm.nih.gov/dtd/NCBI_BlastOutput.dtd">'