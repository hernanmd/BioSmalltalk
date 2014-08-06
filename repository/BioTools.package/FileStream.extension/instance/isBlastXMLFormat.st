*biotools
isBlastXMLFormat
	" Only answer <true> when the receiver's contents *looks like* a NCBI Blast format, not performing any validity check "
	
	^ self isXML and: [ self nextLine; nextMatchAll: '<!DOCTYPE BlastOutput PUBLIC "-//NCBI//NCBI BlastOutput/EN" "NCBI_BlastOutput.dtd">' ]