examples
examplePdbEPisa01
	" Inspect results for all crystal interfaces found in PDB entries 3gcb and 1sar. 
	
	http://www.ebi.ac.uk/msd-srv/prot_int/pi_download.html"

	(BioPDBePISAClient new interfaces
		pdbCodes: { '3gcb' . '1sar' };
		fetch) inspect.
