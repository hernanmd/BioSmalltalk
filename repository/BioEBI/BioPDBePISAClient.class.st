"
BioPDBePISAClient is a client to the PDBePISA (Protein Interfaces, Surfaces and Assemblies) service provided by the EBI.  See class side examples for sample code.

You may find more documentation here:

http://www.ebi.ac.uk/msd-srv/prot_int/pistart.html

and

http://www.ebi.ac.uk/msd-srv/prot_int/pi_download.html
"
Class {
	#name : #BioPDBePISAClient,
	#superclass : #BioWebWrapper,
	#category : 'BioEBI-PDBePISA'
}

{ #category : #accessing }
BioPDBePISAClient class >> baseUrl [
	" Private - Answer a <String> specifying a server valid addres for the receiver "

	^ 'http://www.ebi.ac.uk/pdbe/pisa/cgi-bin'
]

{ #category : #examples }
BioPDBePISAClient class >> examplePdbEPisa01 [
	" Inspect results for all crystal interfaces found in PDB entries 3gcb and 1sar. 
	
	http://www.ebi.ac.uk/msd-srv/prot_int/pi_download.html"

	(BioPDBePISAClient new interfaces
		pdbCodes: { '3gcb' . '1sar' };
		fetch) inspect.

]

{ #category : #examples }
BioPDBePISAClient class >> examplePdbEPisa02 [
	" downloads XML-formatted descriptions for all assemblies indentified for PDB entries 3gcb and 1sar. 
	
	http://www.ebi.ac.uk/msd-srv/prot_int/pi_download.html"

	| result |
	
	result := BioPDBePISAClient new multimers
				pdbCodes: { '3gcb' . '1sar' };
				fetch.
	result dumpToFileNamed: 'fetchPdbEPisa_02.xml'

]

{ #category : #examples }
BioPDBePISAClient class >> examplePdbEPisa03 [
	" downloads PDB file of the only hexamer in PDB entry 3gcb. 
	
	http://www.ebi.ac.uk/msd-srv/prot_int/pi_download.html "

	(BioPDBePISAClient new multimer
		pdbCode: '3gcb' assemblySet: 1 assemblyNumberInSet: 1;
		fetch) dumpToFileNamed: 'fetchPdbEPisa_03.pdb'

]

{ #category : #accessing }
BioPDBePISAClient >> addParameters: aString [
	" Add the parameters in aString to the receiver's url object "
	
	self url: (BioWebClientEngine urlFromString: self url asString , aString)
]

{ #category : #accessing }
BioPDBePISAClient >> fetch [
	" Answer a list of UIDs with the corresponding data records "

	^ self execute: BioPDBePISACmd
]

{ #category : #accessing }
BioPDBePISAClient >> interfaces [
	" Set and answer the receiver's working database "
		
	^ self database: (BioPDBePISAInterfaces new client: self)
]

{ #category : #accessing }
BioPDBePISAClient >> multimer [
	" Set and answer the receiver's working database "
		
	^ self database: (BioPDBePISAPDBMultimer new client: self)
]

{ #category : #accessing }
BioPDBePISAClient >> multimers [
	" Set and answer the receiver's working database "
		
	^ self database: (BioPDBePISAMultimers new client: self)
]
