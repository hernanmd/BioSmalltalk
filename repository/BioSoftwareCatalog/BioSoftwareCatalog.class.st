"
Abstract generic class providing software catalog behavior.

Subclasses could implement the following catalogs

http://biowulf.nih.gov/apps/
http://www.ccmb.med.umich.edu/bioinf-core/tools	
http://bioinformatics.ca/links_directory/

"
Class {
	#name : #BioSoftwareCatalog,
	#superclass : #BioObject,
	#classVars : [
		'Classifications'
	],
	#classInstVars : [
		'items',
		'updateOnDemand'
	],
	#category : 'BioSoftwareCatalog-Core'
}

{ #category : #accessing }
BioSoftwareCatalog class >> classifications [
	" Answer a <Collection> of <String> representing classifications applicable to receiver's items "

	^ Classifications
		ifNil: [ Classifications := self initializeClassifications ]
]

{ #category : #accessing }
BioSoftwareCatalog class >> classifications: anObject [
	Classifications := anObject
]

{ #category : #accessing }
BioSoftwareCatalog class >> defaultUpdateOnDemand [

	self subclassResponsibility
]

{ #category : #'initialize - release' }
BioSoftwareCatalog class >> initializeClassifications [
	" Private - Add software items to the receiver's catalog "

	" Answer a <Collection> of qualifiers to be used for classifying software items. Tags were taken from the following sites:
http://biowulf.nih.gov/apps/
http://www.ccmb.med.umich.edu/bioinf-core/tools	
http://bioinformatics.ca/links_directory/
	"
	^  #('All Software')

	
]

{ #category : #'initialize - release' }
BioSoftwareCatalog class >> initializeSoftwareItems [
	" Private - Add software items to the receiver's catalog "

	| softwareItems |
	
	softwareItems := (NeoCSVReader on: self softwareListRaw readStream)
		separator: $;;
		upToEnd.
	self assert: (softwareItems allSatisfy: [ : item | item size = 4 ]).
	^ softwareItems collect: [ : entry | self newSoftwareItem: entry ]

	
]

{ #category : #accessing }
BioSoftwareCatalog class >> newSoftwareItem: entry [
	" Answer a new software item from entry Collection "
	
	^ BioSoftwareItem new 
		softwareName: entry first;
		description: entry second;
		link: entry third;
		classifications: (entry fourth findTokens: $,);
		yourself.
]

{ #category : #'initialize - release' }
BioSoftwareCatalog class >> release [
	" Release the receiver's registered software items "

	items := nil
]

{ #category : #accessing }
BioSoftwareCatalog class >> setUpdateOnDemand [

	updateOnDemand := true
]

{ #category : #accessing }
BioSoftwareCatalog class >> softwareList [
	" Answer a <Collection> of <BioSoftwareItem> "
	
	^ self updateOnDemand
		ifTrue: [ self initializeSoftwareItems ]
		ifFalse: [ items ifNil: [ items := self initializeSoftwareItems ] ]

]

{ #category : #accessing }
BioSoftwareCatalog class >> softwareListByCategory [
	" Answer a <Collection> of BioSoftwareItem "
	
	^ self softwareList do: [ : s | ]
	
]

{ #category : #accessing }
BioSoftwareCatalog class >> softwareListClassifications [
	" Answer a <Collection> of <BioSoftwareItem> "
	
	^ (self initializeClassifications reject: #isEmpty) asSortedCollection 
	
]

{ #category : #private }
BioSoftwareCatalog class >> softwareListRaw [
	" Private - Format of this CSV is: Name;Description;URL;Category1,Category2,etc"
	^ 'Pritchard Structure;The program structure is a free software package for using multi-locus genotype data to investigate population structure;http://pritchardlab.stanford.edu/software.html;Linkage,Phylogenetics
Eigenstrat / EigenSoft;The EIGENSOFT package combines functionality from our population genetics methods and EIGENSTRAT stratification correction method;http://www.hsph.harvard.edu/alkes-price/software/;Linkage,Phylogenetics
ChromoPainter / fineStructure;ChromoPainter is a tool for finding haplotypes in sequence data. fineSTRUCTURE is a fast and powerful algorithm for identifying population structure using dense sequencing data;http://paintmychromosomes.com/;Linkage,Phylogenetics
PLINK;Whole genome association analysis toolset;http://pngu.mgh.harvard.edu/~purcell/plink/;Linkage,Phylogenetics
Generic Genome Browser;GBrowse is a combination of database and interactive web pages for manipulating and displaying annotations on genomes;http://gmod.org/wiki/GBrowse;Genome Browser,Comparative Analysis
Abyss;Assembly By Short Sequences - a de novo, parallel, paired-end sequence assembler;http://www.bcgsc.ca/platform/bioinfo/software/abyss;NGS (Next-Generation Sequencing) read alignment,Assembly
ArrayExpressHTS;ArrayExpress High Throughput Sequencing Processing Pipeline;http://www.bioconductor.org/packages/2.12/bioc/html/ArrayExpressHTS.html;Gene Expression,Microarray
PSORT;PSORT family of programs for subcellular localization prediction as well as other datasets and resources relevant to localization prediction;http://www.psort.org;Protein,Localization and Targeting
Bowtie;An ultrafast memory-efficient short read aligner;http://bowtie-bio.sourceforge.net/;NGS (Next-Generation Sequencing) read alignment
BWA;Burrows-Wheeler Aligner (BWA is a program for aligning sequencing reads against a large reference genome (e.g. human genome). It has two major components, one for read shorter than 150bp and the other for longer reads;http://sourceforge.net/projects/bio-bwa/;NGS (Next-Generation Sequencing) read alignment
Celutil;Celutil is an utilty to read&write, compare, convert, query Affymetrix CEL file in binary & ASCII format, gzipped or not;http://www.bioinformatics.org/celutil/;Microarray
CLUMPP;CLUMPP is a program that deals with label switching and multimodality problems in population-genetic cluster analyses;http://www.stanford.edu/group/rosenberglab/clumpp.html;Linkage,Phylogenetics
Cufflinks;Transcript assembly, differential expression, and differential regulation for RNA-Seq;http://cufflinks.cbcb.umd.edu/;NGS (Next-Generation Sequencing) read alignment
DIYA;A modular and configurable open source pipeline software, written in Perl, used for the rapid annotation of bacterial genome sequences;http://sourceforge.net/projects/diyg/;Annotation
Glimmer3;Gene Locator and Interpolated Markov ModelER. A system for finding genes in microbial DNA, especially the genomes of bacteria, archaea, and viruses);http://ccb.jhu.edu/software/glimmer;Localization and Targeting
hmmer-3;Used for searching sequence databases for homologs of protein sequences, and for making protein sequence alignments. It implements methods using probabilistic models called profile hidden Markov models (profile HMMs);http://hmmer.janelia.org/;Sequence Analysis
InterProScan;Scan your sequence for matches against the InterPro collection of protein signature databases;http://www.ebi.ac.uk/Tools/pfa/iprscan/;Annotation
MMSEQ;Transcript and gene level expression analysis using multi-mapping RNA-seq reads;https://github.com/eturro/mmseq;Gene Expression
MrBayes;Bayesian Inference of Phylogeny;http://mrbayes.sourceforge.net/;Linkage,Phylogenetics
MUMmer;Ultra-fast alignment of large-scale DNA and protein sequences;http://mummer.sourceforge.net/;NGS (Next-Generation Sequencing) read alignment
Pathifier;Pathway-based personalized analysis of cancer with Pathifier;http://www.weizmann.ac.il/complex/compphys/software/yotam/pathifier/;Pathway
pftools;The pftools package contains all the software necessary to build protein and DNA generalized profiles and use them to scan and align sequences, and search databases;http://web.expasy.org/pftools/;Localization and Targeting
Phobius;A combined transmembrane topology and signal peptide predictor;http://phobius.sbc.su.se/;Protein,Localization and Targeting
RNAmmer;Consistent and rapid annotation of ribosomal RNA genes;http://www.cbs.dtu.dk/services/RNAmmer/;Annotation,Functional RNA
SAMMate;RNA-Seq assembly and analysis;http://sammate.sourceforge.net/;Assembly
SAMtools;SAM Tools provide various utilities for manipulating alignments in the SAM format, including sorting, merging, indexing and generating alignments in a per-position format;http://samtools.sourceforge.net/;NGS (Next-Generation Sequencing) read alignment
SOAPdenovo;Short Oligonucleotide Analysis Package;http://soap.genomics.org.cn/soapdenovo.html;NGS (Next-Generation Sequencing) read alignment
Trimmomatic;A flexible read trimming tool for Illumina NGS data;http://www.usadellab.org/cms/?page=trimmomatic;NGS (Next-Generation Sequencing) read alignment
tRNAscan-SE;Search for tRNA genes in genomic sequence;http://lowelab.ucsc.edu/tRNAscan-SE/;Functional RNA
Infernal;inference of RNA alignments;http://infernal.janelia.org/;Functional RNA
Bioconductor;Bioconductor provides tools for the analysis and comprehension of high-throughput genomic data. Bioconductor uses the R statistical programming language, and is open source and open development. It has two releases each year, 749 software packages, and an active user community;http://www.bioconductor.org/;Programming Library
BioPerl;BioPerl is a collection of Perl modules that facilitate the development of Perl scripts for bioinformatics applications;http://bioperl.org/;Programming Library
BioSmalltalk;BioSmalltalk is a collection of Smalltalk modules that facilitate the development of scripts for bioinformatics applications;http://code.google.com/p/biosmalltalk/;Programming Library
Biopython;Biopython is a collection of Python modules that facilitate the development of Python scripts for bioinformatics applications;http://biopython.org/;Programming Library
BioRuby;BioRuby is a collection of Ruby modules that facilitate the development of Ruby scripts for bioinformatics applications;http://bioruby.open-bio.org/;Programming Library'

]

{ #category : #accessing }
BioSoftwareCatalog class >> updateOnDemand [

	^ updateOnDemand
		ifNil: [ updateOnDemand := self defaultUpdateOnDemand ]
]

{ #category : #accessing }
BioSoftwareCatalog class >> updateOnDemand: anObject [
	updateOnDemand := anObject
]
