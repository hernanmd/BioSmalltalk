testing
testFormats

	self assert: (BioFileFormat isRegistered: 'fasta').
	self assert: (BioFileFormat isRegistered: 'FASTA').
	self deny: (BioFileFormat isRegistered: 'InvalidDescriptionFormat').
	self assert: (BioFileFormat isRegistered: 'CSV').
	self assert: (BioFileFormat isRegistered: 'CHADO').
	self assert: (BioFileFormat isRegistered: 'ABI').
	self assert: (BioFileFormat isRegistered: 'ace').
	self assert: (BioFileFormat isRegistered: 'AceDB').
	self assert: (BioFileFormat isRegistered: 'ALF').
	self assert: (BioFileFormat isRegistered: 'BSML').
	self assert: (BioFileFormat isRegistered: 'CHAOS').
	self assert: (BioFileFormat isRegistered: 'CTF').
	self assert: (BioFileFormat isRegistered: 'EMBL').
	self assert: (BioFileFormat isRegistered: 'Entrez').
	self assert: (BioFileFormat isRegistered: 'Excel').
	self assert: (BioFileFormat isRegistered: 'EXP').

	self assert: (BioFileFormat isRegistered: 'Staden').
	self assert: (BioFileFormat isRegistered: 'FASTAQ').
	self assert: (BioFileFormat isRegistered: 'fastq').
	self assert: (BioFileFormat isRegistered: 'GAME').
	self assert: (BioFileFormat isRegistered: 'GCG').
	self assert: (BioFileFormat isRegistered: 'GenBank').
	self assert: (BioFileFormat isRegistered: 'gbank').
	self assert: (BioFileFormat isRegistered: 'genbank').
	self assert: (BioFileFormat isRegistered: 'InterProScan').
	self assert: (BioFileFormat isRegistered: 'KEGG').
	self assert: (BioFileFormat isRegistered: 'Nexus').	
	self assert: (BioFileFormat isRegistered: 'Phred').

	self assert: (BioFileFormat isRegistered: 'Phylip').
	self assert: (BioFileFormat isRegistered: 'phy').
	self assert: (BioFileFormat isRegistered: 'PIR').
	self assert: (BioFileFormat isRegistered: 'PLN').
	self assert: (BioFileFormat isRegistered: 'scf').
	self assert: (BioFileFormat isRegistered: 'SeqXML').
	self assert: (BioFileFormat isRegistered: 'SwissProt').
	self assert: (BioFileFormat isRegistered: 'sp').
	self assert: (BioFileFormat isRegistered: 'TIGR').
	self assert: (BioFileFormat isRegistered: 'ZTR').