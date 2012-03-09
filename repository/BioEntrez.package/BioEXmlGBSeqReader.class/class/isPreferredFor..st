private
isPreferredFor: aString
	" Answer <true> if aString is the most appropriate content for the receiver "
	
	^ aString beginsWith: '<?xml version="1.0"?>
 <!DOCTYPE GBSet PUBLIC "-//NCBI//NCBI GBSeq/EN" "http://www.ncbi.nlm.nih.gov/dtd/NCBI_GBSeq.dtd">'