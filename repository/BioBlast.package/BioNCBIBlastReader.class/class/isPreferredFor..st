private
isPreferredFor: aString
	" Answer <true> if aString is the most appropriate content for the receiver "
	
	^ aString includesDtd: 'NCBI_BlastOutput.dtd'
