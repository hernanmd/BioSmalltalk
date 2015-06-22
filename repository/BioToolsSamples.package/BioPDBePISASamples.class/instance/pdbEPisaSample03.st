accessing
pdbEPisaSample03
	" self new pdbEPisaSample03 "
	" downloads PDB file of the only hexamer in PDB entry 3gcb. 
	
	http://www.ebi.ac.uk/msd-srv/prot_int/pi_download.html"

	| result |
	
	result := BioPDBePISAClient new multimer
				pdbCode: '3gcb' assemblySet: 1 assemblyNumberInSet: 1;
				fetch.
	result dumpToFileNamed: 'fetchPdbEPisa_03.pdb'
