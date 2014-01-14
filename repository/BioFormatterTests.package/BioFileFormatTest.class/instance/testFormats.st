testing
testFormats

	self deny: (BioFileFormat isRegistered: 'InvalidDescriptionFormat').
	
	#('ABI' ace' 'AceDB' ALF' 
	'BSML' 
	'CHAOS' 'CTF' 'CSV' 'CHADO' 
	'EMBL' 'Entrez' 'Excel' 'EXP'
	'FASTAQ' 'fastq' 'fasta' 'FASTA' 
	'GAME' 'GCG' 'GenBank' 'gbank' 'genbank'
	'InterProScan' 
	'KEGG' 
	'Nexus' 
	'Phred' 'Phylip' 'phy' 'PIR' 'PLN' 'PTT'
	'scf' 'SeqXML' 'SwissProt' 'sp' 'Staden'
	'TIGR' 'txt'
	'ZTR') do: [ : format | self assert: (BioFileFormat isRegistered: format) ]