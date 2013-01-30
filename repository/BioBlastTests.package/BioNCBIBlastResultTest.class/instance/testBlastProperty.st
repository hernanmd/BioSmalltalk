testing
testBlastProperty

	| blastResult blastProperty |
	
	blastResult := BioNCBIBlastResult new.
	blastProperty := blastResult blastProperties first.
	self assert:  blastProperty displayName = 'ALIGNMENT LENGTH'.
	self assert:  blastProperty explanation = 'The Hsp_align-len is an integer value which contains the length of the alignment used. If there are multiple HSPs, this will answer a Number with the one with the highest alignment.'.
	self assert:  blastProperty name = 'Hsp_align-len'.
	self assert:  blastProperty type = '#String'.
	

	