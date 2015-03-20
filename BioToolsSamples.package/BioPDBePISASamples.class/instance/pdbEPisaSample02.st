accessing
pdbEPisaSample02
	" self new pdbEPisaSample02 "
	" downloads XML-formatted descriptions for all assemblies indentified for PDB entries 3gcb and 1sar. 
	
	http://www.ebi.ac.uk/msd-srv/prot_int/pi_download.html"

	| result |
	
	result := BioPDBePISAClient new multimers
				pdbCodes: { '3gcb' . '1sar' };
				fetch.
	result outputToFile: 'fetchPdbEPisa_02.xml'
