private
isPreferredFor: aString
	" Answer <true> if aString is the most appropriate content for the receiver "
	
	^ aString includesDtd: 'http://www.ncbi.nlm.nih.gov/dtd/NCBI_GBSeq.dtd'