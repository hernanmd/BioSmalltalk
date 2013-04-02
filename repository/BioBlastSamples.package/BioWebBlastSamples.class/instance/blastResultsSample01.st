blast
blastResultsSample01

	| xmlBlastOutput |
	
	xmlBlastOutput := 
		FileStream readOnlyFileNamed: 'c:\1FNVBPN501S-Alignment.xml'.
	^ BioNCBIBlastReader new
		results: xmlBlastOutput;
		hitNodes