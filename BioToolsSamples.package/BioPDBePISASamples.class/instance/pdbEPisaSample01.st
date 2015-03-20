accessing
pdbEPisaSample01
	" self new pdbEPisaSample01 "
	" downloads XML-formatted descriptions for all crystal interfaces found in PDB entries 3gcb and 1sar. 
	
	http://www.ebi.ac.uk/msd-srv/prot_int/pi_download.html"

	| result |
	
	result := BioPDBePISAClient new interfaces
				pdbCodes: { '3gcb' . '1sar' };
				fetch.
	result outputToFile: 'fetchPdbEPisa_01.xml'
