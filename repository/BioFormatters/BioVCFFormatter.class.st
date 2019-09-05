"
BioSmalltalk Variant Call Format parser/writer according to The Variant Call Format (VCF) Version 4.2 Specification found at http://samtools.github.io/hts-specs/VCFv4.2.pdf


"
Class {
	#name : #BioVCFFormatter,
	#superclass : #BioFileFormatter,
	#category : 'BioFormatters-Formatters-VCF'
}

{ #category : #examples }
BioVCFFormatter class >> example01 [

	| vcfReader |
	
	vcfReader := BioVCFFormatter open: self testFilesFullDirectoryName / 'example-4.0.vcf'.
	vcfReader do: [ : vcfRecord |
		Transcript show: vcfRecord; cr ]
]

{ #category : #'accessing - meta' }
BioVCFFormatter >> addMetaAltID: stringID description: descriptionString [
	" Add the Alternative allele field format "

	self deny: (stringID includesAnyOf: String space).
	self stream
		nextPutAll: '##ALT=<ID=';
		nextPutAll: stringID;
		nextPutAll: ',Description=';
		nextPutAll: (descriptionString surroundedBy: $");
		nextPut: $>;		
		bioCr
]

{ #category : #'accessing - meta' }
BioVCFFormatter >> addMetaAssemblyURL: urlString [
	" Add breakpoint assemblies for structural variations may use an external file "

	self stream
		nextPutAll: '##assembly=';
		nextPutAll: urlString;
		bioCr

]

{ #category : #'accessing - meta - contig' }
BioVCFFormatter >> addMetaContigID: contigStringID [
	" Add the contig line (not required) "

	self stream
		nextPutAll: '##contig=<ID=';
		nextPutAll: contigStringID;
		nextPut: $>;
		bioCr
		
]

{ #category : #'accessing - meta - contig' }
BioVCFFormatter >> addMetaContigID: contigStringID url: urlString [
	" As with chromosomal sequences it is highly recommended (but not required) that the header include tags describing the contigs referred to in the VCF le. This furthermore allows these contigs to come from different files. The format is identical to that of a reference sequence, but with an additional URL tag to indicate where that sequence can be found. "

	self stream
		nextPutAll: '##contig=<';
		nextPutAll: contigStringID;
		nextPutAll: ',URL=';
		nextPutAll: urlString;
		nextPut: $>;
		bioCr
		
]

{ #category : #'accessing - meta' }
BioVCFFormatter >> addMetaFileDate [
	" Add the date line "

	self stream
		nextPutAll: '##filedate=';
		nextPutAll: self fileDate;
		bioCr
		
]

{ #category : #'accessing - meta' }
BioVCFFormatter >> addMetaFileFormat [
	" Add the required first line "

	self stream
		nextPutAll: '##fileformat=';
		nextPutAll: self formatVersion;
		bioCr
		
]

{ #category : #'accessing - meta' }
BioVCFFormatter >> addMetaFilter: filterIdString description: descriptionString [
	" Add the filter line "

	self stream
		nextPutAll: '##FILTER=<ID=';
		nextPutAll: filterIdString;
		nextPutAll: ',Description=';
		nextPutAll: descriptionString;
		nextPut: $>;		
		bioCr

]

{ #category : #'accessing - meta' }
BioVCFFormatter >> addMetaFixedHeader [
	" Add the header line "

	self stream
		nextPutAll: '#CHROM';
		tab;
		nextPutAll: 'POS';
		tab;
		nextPutAll: 'ID';
		tab;
		nextPutAll: 'REF';
		tab;
		nextPutAll: 'ALT';
		tab;
		nextPutAll: 'QUAL';
		tab;
		nextPutAll: 'FILTER';
		tab;
		nextPutAll: 'INFO'
		
]

{ #category : #'accessing - meta -format' }
BioVCFFormatter >> addMetaFormat: formatIdString number: aNumber type: typeString description: descriptionString [
	" Add the filter line "

	self stream
		nextPutAll: '##FORMAT=<ID=';
		nextPutAll: formatIdString;
		nextPutAll: ',Number=';
		nextPutAll: aNumber asString;
		nextPutAll: ',Type=';
		nextPutAll: typeString;
		nextPutAll: ',Description=';
		nextPutAll: descriptionString;
		nextPut: $>;		
		bioCr

]

{ #category : #'accessing - meta -format' }
BioVCFFormatter >> addMetaFormatCharacter: formatIdString number: aNumber description: descriptionString [
	" Add the filter line "

	self stream
		nextPutAll: '##FORMAT=<ID=';
		nextPutAll: formatIdString;
		nextPutAll: ',Number=';
		nextPutAll: aNumber asString;
		nextPutAll: ',Type=Character';
		nextPutAll: ',Description=';
		nextPutAll: descriptionString;
		nextPut: $>;		
		bioCr

]

{ #category : #'accessing - meta -format' }
BioVCFFormatter >> addMetaFormatFloat: formatIdString number: aNumber description: descriptionString [
	" Add the filter line "

	self stream
		nextPutAll: '##FORMAT=<ID=';
		nextPutAll: formatIdString;
		nextPutAll: ',Number=';
		nextPutAll: aNumber asString;
		nextPutAll: ',Type=Float';
		nextPutAll: ',Description=';
		nextPutAll: descriptionString;
		nextPut: $>;		
		bioCr

]

{ #category : #'accessing - meta -format' }
BioVCFFormatter >> addMetaFormatInteger: formatIdString number: aNumber description: descriptionString [
	" Add the filter line "

	self stream
		nextPutAll: '##FORMAT=<ID=';
		nextPutAll: formatIdString;
		nextPutAll: ',Number=';
		nextPutAll: aNumber asString;
		nextPutAll: ',Type=Integer';
		nextPutAll: ',Description=';
		nextPutAll: descriptionString;
		nextPut: $>;		
		bioCr

]

{ #category : #'accessing - meta -format' }
BioVCFFormatter >> addMetaFormatString: formatIdString number: aNumber description: descriptionString [
	" Add the filter line "

	self stream
		nextPutAll: '##FORMAT=<ID=';
		nextPutAll: formatIdString;
		nextPutAll: ',Number=';
		nextPutAll: aNumber asString;
		nextPutAll: ',Type=String';
		nextPutAll: ',Description=';
		nextPutAll: descriptionString;
		nextPut: $>;		
		bioCr

]

{ #category : #'accessing - meta' }
BioVCFFormatter >> addMetaGenotypesHeader: sampleNames [
	" Add the genotype names header line "

	self stream
		nextPutAll: 'FORMAT';
		tab.
	sampleNames do: [ : sampleName |
		self stream 	
				nextPutAll: sampleName;
				tab ].
	self stream
		back;
		bioCr

]

{ #category : #'accessing - meta - info' }
BioVCFFormatter >> addMetaInfoID: stringID nValues: nValInteger type: stringType description: descriptionString [
	" Add the contig line (not required) "

	self stream
		nextPutAll: '##INFO=<ID=';
		nextPutAll: stringID;
		nextPutAll: ',Number=';
		nextPutAll: nValInteger asString;
		nextPutAll: ',Type=';		
		nextPutAll: stringType;
		nextPutAll: ',Description=';
		nextPutAll: (descriptionString surroundedBy: $");
		nextPut: $>;		
		bioCr
]

{ #category : #'accessing - meta - info' }
BioVCFFormatter >> addMetaInfoID: stringID nValues: nValInteger type: stringType description: descriptionString source: sourceString [
	" Add info line (not required) "

	self stream
		nextPutAll: '##INFO=<ID=';
		nextPutAll: stringID;
		nextPutAll: ',Number=';
		nextPutAll: nValInteger asString;
		nextPutAll: ',Type=';		
		nextPutAll: stringType;		
		nextPutAll: ',Description=';
		nextPutAll: (descriptionString surroundedBy: $");
		nextPutAll: ',Source=';
		nextPutAll: sourceString;
		nextPut: $>;		
		bioCr.

]

{ #category : #'accessing - meta - info' }
BioVCFFormatter >> addMetaInfoID: stringID nValues: nValInteger type: stringType description: descriptionString source: sourceString version: versionString [
	" Add info line (not required) "

	self stream
		nextPutAll: '##INFO=<ID=';
		nextPutAll: stringID;
		nextPutAll: ',Number=';
		nextPutAll: nValInteger asString;
		nextPutAll: ',Type=';		
		nextPutAll: stringType;		
		nextPutAll: ',Description=';
		nextPutAll: (descriptionString surroundedBy: $");
		nextPutAll: ',Source=';
		nextPutAll: sourceString;
		nextPutAll: ',Version=';
		nextPutAll: versionString;
		nextPut: $>;		
		bioCr.

]

{ #category : #'accessing - meta - info' }
BioVCFFormatter >> addMetaIntegerFlagID: stringID nValues: nValInteger description: descriptionString source: sourceString version: versionString [
	" Add info line (not required) "

	self stream
		nextPutAll: '##INFO=<ID=';
		nextPutAll: stringID;
		nextPutAll: ',Number=';
		nextPutAll: nValInteger asString;
		nextPutAll: ',Type=Flag';
		nextPutAll: ',Description=';
		nextPutAll: (descriptionString surroundedBy: $");
		nextPutAll: ',Source=';
		nextPutAll: sourceString;
		nextPutAll: ',Version=';
		nextPutAll: versionString;
		nextPut: $>;		
		bioCr.

]

{ #category : #'accessing - meta - info' }
BioVCFFormatter >> addMetaIntegerFloatID: stringID nValues: nValInteger description: descriptionString source: sourceString version: versionString [
	" Add info line (not required) "

	self stream
		nextPutAll: '##INFO=<ID=';
		nextPutAll: stringID;
		nextPutAll: ',Number=';
		nextPutAll: nValInteger asString;
		nextPutAll: ',Type=Float';
		nextPutAll: ',Description=';
		nextPutAll: (descriptionString surroundedBy: $");
		nextPutAll: ',Source=';
		nextPutAll: sourceString;
		nextPutAll: ',Version=';
		nextPutAll: versionString;
		nextPut: $>;		
		bioCr.

]

{ #category : #'accessing - meta - info' }
BioVCFFormatter >> addMetaIntegerInfoID: stringID nValues: nValInteger description: descriptionString source: sourceString version: versionString [
	" Add info line (not required) "

	self stream
		nextPutAll: '##INFO=<ID=';
		nextPutAll: stringID;
		nextPutAll: ',Number=';
		nextPutAll: nValInteger asString;
		nextPutAll: ',Type=Integer';
		nextPutAll: ',Description=';
		nextPutAll: (descriptionString surroundedBy: $");
		nextPutAll: ',Source=';
		nextPutAll: sourceString;
		nextPutAll: ',Version=';
		nextPutAll: versionString;
		nextPut: $>;		
		bioCr.

]

{ #category : #'accessing - meta' }
BioVCFFormatter >> addMetaPedigreeDB: pedigreeDBUrl [
	" Add record relationships between genomes as link to pedigreeDBUrl "

	self stream 
		nextPutAll: '##pedigreeDB=<';
		nextPutAll: pedigreeDBUrl; 
		nextPut: $>;		
		bioCr
]

{ #category : #'accessing - meta' }
BioVCFFormatter >> addMetaPedigreeNames: pedigreeNameCollection [
	" Add record relationships between genomes. 
	##PEDIGREE=<Name_0=G0-ID,Name_1=G1-ID,...,Name_N=GN-ID>
	
	genomeIDCollection, mixtureIDCollection and descriptionCollection should be a <Collection> of <String> "

	self stream nextPutAll: '##PEDIGREE=<'.
	pedigreeNameCollection doWithIndex: [ : pName : index |
		self stream 	
				nextPutAll: 'Name_';
				nextPutAll: (index - 1) asString;
				nextPutAll: pName;
				nextPut: $, ].
	self stream
		back;
		nextPut: $>;		
		bioCr
]

{ #category : #'accessing - meta' }
BioVCFFormatter >> addMetaReference: refString [
	" Add the reference line "

	self stream
		nextPutAll: '##reference=';
		nextPutAll: refString;
		bioCr
		
]

{ #category : #'accessing - meta' }
BioVCFFormatter >> addMetaSampleID: stringID genomes: genomesIDCollection mixture: mixtureIDCollection description: descriptionCollection [
	" Add sample to genome mappings as shown below: 
	##SAMPLE=<ID=S_ID,Genomes=G1_ID;G2_ID; ...;GK_ID,Mixture=N1;N2; ...;NK,Description=S1;S2; ...;SK>
	
	genomeIDCollection, mixtureIDCollection and descriptionCollection should be a <Collection> of <String> "

	self stream
		nextPutAll: '##SAMPLE=<ID=';
		nextPutAll: stringID;
		nextPutAll: ',Genomes=';
		nextPutAll: (genomesIDCollection joinUsing: $;);
		nextPutAll: ',Mixture=';
		nextPutAll: (mixtureIDCollection joinUsing: $;);
		nextPutAll: ',Description=';
		nextPutAll: (descriptionCollection joinUsing: $;);
		nextPut: $>;		
		bioCr
]

{ #category : #'accessing - meta' }
BioVCFFormatter >> addMetaSource: sourceString [
	" Add the source line "

	self stream
		nextPutAll: '##source=';
		nextPutAll: sourceString;
		bioCr
		
]

{ #category : #'accessing - meta - info' }
BioVCFFormatter >> addMetaStringInfoID: stringID nValues: nValInteger description: descriptionString source: sourceString version: versionString [
	" Add info line (not required) "

	self stream
		nextPutAll: '##INFO=<ID=';
		nextPutAll: stringID;
		nextPutAll: ',Number=';
		nextPutAll: nValInteger asString;
		nextPutAll: ',Type=String';
		nextPutAll: ',Description=';
		nextPutAll: (descriptionString surroundedBy: $");
		nextPutAll: ',Source=';
		nextPutAll: sourceString;
		nextPutAll: ',Version=';
		nextPutAll: versionString;
		nextPut: $>;		
		bioCr.

]

{ #category : #'accessing - meta' }
BioVCFFormatter >> formatVersion [
	" Answer a <String> with the receiver's specification version "

	^ 'VCFv4.2'
]
