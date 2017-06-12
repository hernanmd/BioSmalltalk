examples
examplePdbEPisa03
	" downloads PDB file of the only hexamer in PDB entry 3gcb. 
	
	http://www.ebi.ac.uk/msd-srv/prot_int/pi_download.html "

	(BioPDBePISAClient new multimer
		pdbCode: '3gcb' assemblySet: 1 assemblyNumberInSet: 1;
		fetch) dumpToFileNamed: 'fetchPdbEPisa_03.pdb'
