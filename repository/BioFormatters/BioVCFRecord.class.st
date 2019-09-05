"
Represents a set of calls at a site. Equivalent to a row in a VCF file.

The VCF fields CHROM, POS, ID, REF, ALT, QUAL, FILTER, INFO and FORMAT are available as accessor methods.

"
Class {
	#name : #BioVCFRecord,
	#superclass : #BioObject,
	#instVars : [
		'id',
		'position',
		'chromosome',
		'identifier',
		'refBase',
		'altBase',
		'quality',
		'filter',
		'formats',
		'samples',
		'infos'
	],
	#category : #'BioFormatters-Formatters-VCF'
}

{ #category : #examples }
BioVCFRecord class >> example01 [

	^ BioVCFRecord new
		chromosome: 20;
		position: 14370;
		id: #('rs6054257');
		yourself;
		inspect
]

{ #category : #examples }
BioVCFRecord class >> example02 [

	^ BioVCFRecord new
		chromosome: 20;
		position: 14370;
		id: #('rs6054257');
		refBase: 'G';
		altBase: 'A';
		quality: 29;
		setFilterAsPASSED;
		setInfoNS: 3;
		setInfoDP: 14;
		setInfoAF: 0.5;
		setInfoDB;
		setInfoH2;
		yourself;
		inspect
]

{ #category : #examples }
BioVCFRecord class >> example03 [
	" Example with FORMAT and INFO records "
	
	^ BioVCFRecord new
		chromosome: 20;
		position: 14370;
		id: #('rs6054257');
		refBase: 'G';
		altBase: 'A';
		quality: 29;
		setFilterAsPASSED;
		setInfoNS: 3;
		setInfoDP: 14;
		setInfoAF: 0.5;
		setInfoDB;
		setInfoH2;
		addFormatGT;
		addFormatGQ;
		addFormatDP;
		addFormatHQ;
		yourself;
		inspect
]

{ #category : #examples }
BioVCFRecord class >> example04 [
	" Example with FORMAT and INFO records "

	| genotypes |
	genotypes := { 
		BioVCFRecordSample example01 .
		BioVCFRecordSample example02 }.
	^ BioVCFRecord new
		chromosome: 20;
		position: 14370;
		id: #('rs6054257');
		refBase: 'G';
		altBase: 'A';
		quality: 29;
		setFilterAsPASSED;
		setInfoNS: 3;
		setInfoDP: 14;
		setInfoAF: 0.5;
		setInfoDB;
		setInfoH2;
		addFormatGT;
		addFormatGQ;
		addFormatDP;
		addFormatHQ;
		addGenotypes: genotypes;
		yourself;
		inspect
]

{ #category : #'accessing - format' }
BioVCFRecord >> addFormatDP [
	" Set read depth at this position for this sample (Integer) "

	self formats add: 'DP'

]

{ #category : #'accessing - format' }
BioVCFRecord >> addFormatEC [
	" Set the comma separated list of expected alternate allele counts for each alternate allele in the same order as listed in the ALT field (typically used in association analyses) (Integers) "

	self formats add: 'EC'

]

{ #category : #'accessing - format' }
BioVCFRecord >> addFormatFT [
	" Set sample genotype filter indicating if this genotype was 'called' (similar in concept to the FILTER field). Again, use PASS to indicate that all lters have been passed, a semi-colon separated list of codes for filters that fail, or `.' to indicate that filters have not been applied. These values should be described in the metainformation in the same way as FILTERs (String, no white-space or semi-colons permitted) "

	self formats add: 'FT'

]

{ #category : #'accessing - format' }
BioVCFRecord >> addFormatGL [
	" Set genotype likelihoods comprised of comma separated foating point log10-scaled likelihoods for all possible genotypes given the set of alleles dened in the REF and ALT fields. In presence of the GT field the same ploidy is expected and the canonical order is used; without GT eld, diploidy is assumed. If A is the allele in REF and B,C,... are the alleles as ordered in ALT, the ordering of genotypes for the likelihoods is given by: F(j/k) = (k*(k+1)/2)+j. In other words, for biallelic sites the ordering is: AA,AB,BB; for triallelic sites the ordering is: AA,AB,BB,AC,BC,CC, etc. For example: GT:GL 0/1:-323.03,-99.29,-802.53 (Floats) "

	self formats add: 'GL'

]

{ #category : #'accessing - format' }
BioVCFRecord >> addFormatGLE [
	" Set genotype likelihoods of heterogeneous ploidy, used in presence of uncertain copy number. For example:
GLE=0:-75.22,1:-223.42,0/0:-323.03,1/0:-99.29,1/1:-802.53 (String) "

	self formats add: 'GLE'
]

{ #category : #'accessing - format' }
BioVCFRecord >> addFormatGP [
	" Set the phred-scaled genotype posterior probabilities (and otherwise dened precisely as the GL field); intended to store imputed genotype probabilities (Floats) "

	self formats add: 'GP'

]

{ #category : #'accessing - format' }
BioVCFRecord >> addFormatGQ [
	" Set the conditional genotype quality, encoded as a phred quality 10log10 p (genotype call is wrong, conditioned on the site's being variant) (Integer) "

	self formats add: 'GQ'

]

{ #category : #'accessing - format' }
BioVCFRecord >> addFormatGT [
	" Set genotype, encoded as allele values separated by either of = or j. The allele values are 0 for the reference allele (what is in the REF eld), 1 for the first allele listed in ALT, 2 for the second allele list in ALT and so on. For diploid calls examples could be 0=1, 1 j 0, or 1=2, etc. For haploid calls, e.g. on Y, male nonpseudoautosomal X, or mitochondrion, only one allele value should be given; a triploid call might look like 0=0=1. If a call cannot be made for a sample at a given locus, `.' should be specified for each missing allele in the GT field (for example `:=:' for a diploid genotype and `.' for haploid genotype). The meanings of the separators are as follows (see the PS eld below for more details on incorporating phasing information into the genotypes):
	/ : genotype unphased 
	| : genotype phased "

	self formats add: 'GT'

]

{ #category : #'accessing - format' }
BioVCFRecord >> addFormatHQ [
	" Set the haplotype qualities, two comma separated phred qualities (Integers) "

	self formats add: 'HQ'

]

{ #category : #'accessing - format' }
BioVCFRecord >> addFormatMQ [
	" Set the RMS mapping quality, similar to the version in the INFO field. (Integer) "

	self formats add: 'MQ'

]

{ #category : #'accessing - format' }
BioVCFRecord >> addFormatPL [
	" Set the phred-scaled genotype likelihoods rounded to the closest integer (and otherwise defined precisely as
the GL field) (Integers) "

	self formats add: 'PL'

]

{ #category : #'accessing - format' }
BioVCFRecord >> addFormatPQ [
	" Set the phasing quality, the phred-scaled probability that alleles are ordered incorrectly in a heterozygote (against all other members in the phase set). We note that we have not yet included the specific measure for precisely defining 'phasing quality'; our intention for now is simply to reserve the PQ tag for future use as a measure of phasing quality. (Integer) "

	self formats add: 'PQ'

]

{ #category : #'accessing - format' }
BioVCFRecord >> addFormatPS [
	" Set the phase set. A phase set is dened as a set of phased genotypes to which this genotype belongs. Phased genotypes for an individual that are on the same chromosome and have the same PS value are in the same phased set. A phase set species multi-marker haplotypes for the phased genotypes in the set. All phased genotypes that do not contain a PS subeld are assumed to belong to the same phased set. If the genotype in the GT field is unphased, the corresponding PS field is ignored. The recommended convention is to use the position of the first variant in the set as the PS identier (although this is not required). (Non-negative 32-bit Integer) "

	self formats add: 'PS'

]

{ #category : #accessing }
BioVCFRecord >> addGenotypes: aCollection [
	" Add aCollection to the receiver's genotypes "
	
	
]

{ #category : #accessing }
BioVCFRecord >> altBase [
	" Answer a <String> of alterante base(s) - alternate non-reference alleles. These alleles do not have to be called in any of the samples. Options are base Strings made up of the bases A,C,G,T,N,*, (case insensitive) or  an  angle-bracketed  ID  String  (“<ID>”)  or  a  breakend  replacement  string  as  described  in  the  section  on breakends. The ‘*’ allele is reserved to indicate that the allele is missing due to a upstream deletion.  If there are no alternative alleles, then the missing value should be used.  Tools processing VCF files are not required to preserve case in the allele String, except for IDs, which are case sensitive. (String; no whitespace, commas, or angle-brackets are permitted in the ID String itself) "

	^ altBase
]

{ #category : #accessing }
BioVCFRecord >> altBase: aCollection [
	" Set a <String> of alterante base(s) - alternate non-reference alleles. Options are base Strings made up of the bases A,C,G,T,N,*, (case insensitive) or  an  angle-bracketed  ID  String  (“<ID>”)  or  a  breakend  replacement  string  as  described  in  the  section  on breakends. The ‘*’ allele is reserved to indicate that the allele is missing due to a upstream deletion.  If there are no alternative alleles, then the missing value should be used.  Tools processing VCF files are not required to preserve case in the allele String, except for IDs, which are case sensitive. (String; no whitespace, commas, or angle-brackets are permitted in the ID String itself) "

	self assert: (aCollection includesAnyOf: 'ACGTN,.').
	altBase := aCollection
]

{ #category : #converting }
BioVCFRecord >> asString [
	" Answer a <String> with the receiver's printed representation "

	^ String streamContents: [ : stream |
		stream
			nextPutAll: self chromosome asString;
			nextPut: self delimiter;
			nextPutAll: self position asString;
			nextPut: self delimiter;
			nextPutAll: self id asString;
			nextPut: self delimiter;
			nextPutAll: self refBase;
			nextPut: self delimiter;
			nextPutAll: self altBase;
			nextPut: self delimiter;
			nextPutAll: self infoString;
			nextPut: self delimiter;
			nextPutAll: self delimiter;
			nextPut: self delimiter;
			nextPutAll: self formatString;
			nextPut: self delimiter;
			nextPutAll: self genotypesString ]
]

{ #category : #accessing }
BioVCFRecord >> chromosome [
	" Answer a <Number> with the identifier from the reference genome or an angle-bracketed ID String (“<ID>”) pointing to a contig in the assembly file (cf.  the ##assembly line in the header).  All entries for a specific CHROM should form a contiguous block within the VCF file.  The colon symbol (:)  must be absent from all chromosome names to avoid parsing errors when dealing with breakends.  (String, no white-space permitted, Required). "

	^ chromosome
]

{ #category : #accessing }
BioVCFRecord >> chromosome: aNumberOrLetter [
	" Set a <Number> with the identifier from the reference genome or an angle-bracketed ID String (“<ID>”) pointing to a contig in the assembly file (cf.  the ##assembly line in the header).  All entries for a specific CHROM should form a contiguous block within the VCF file.  The colon symbol (:)  must be absent from all chromosome names to avoid parsing errors when dealing with breakends.  (String, no white-space permitted, Required). "

	chromosome := aNumberOrLetter
]

{ #category : #accessing }
BioVCFRecord >> delimiter [
	" Answer the <Character> used to delimit fields "
	
	^ Character tab
]

{ #category : #'accessing - filter' }
BioVCFRecord >> filter [
	" Answer a <String> with filter status: PASS if this position has passed all filters, i.e.  a call is made at this position.  Otherwise, if the site has not passed all filters, a semicolon-separated list of codes for filters that fail.  e.g.  “q10;s50” might indicate that at this site the quality is below 10 and the number of samples with data is below 50% of the total number of samples.  ‘0’ is reserved and should not be used as a filter String.  If filters have not been applied, then this field should be set to the missing value. (String, no white-space or semi-colons permitted "

	^ filter
]

{ #category : #'accessing - filter' }
BioVCFRecord >> filter: aString [
	" Set a <String> with filter status: PASS if this position has passed all filters, i.e.  a call is made at this position.  Otherwise, if the site has not passed all filters, a semicolon-separated list of codes for filters that fail.  e.g.  “q10;s50” might indicate that at this site the quality is below 10 and the number of samples with data is below 50% of the total number of samples.  ‘0’ is reserved and should not be used as a filter String.  If filters have not been applied, then this field should be set to the missing value. (String, no white-space or semi-colons permitted "

	filter := aString
]

{ #category : #accessing }
BioVCFRecord >> formats [
	" Answer a <Collection> of format identifiers "
	
	^ formats
		ifNil: [ formats := OrderedCollection new: 13 ]
]

{ #category : #accessing }
BioVCFRecord >> formats: anObject [
	formats := anObject
]

{ #category : #converting }
BioVCFRecord >> genotypesString [
	" Answer the genotype information for the receiver as a <String> "
	
	^ String streamContents: [ : stream |
			stream
				nextPutAll: nil  ]
]

{ #category : #accessing }
BioVCFRecord >> id [
	" Answer a <Collection> of unique identifiers where available.  If this is a dbSNP variant it is encouraged to use the rs number(s).  No identifier should be present in more than one data record.  If there is no identifier available, then the missing value should be used.  (String, no white-space or semi-colons permitted) "

	^ id
]

{ #category : #accessing }
BioVCFRecord >> id: aCollection [
	" See #id "

	id := aCollection
]

{ #category : #accessing }
BioVCFRecord >> infoFields [

	^ Dictionary new 
		at: 'AA' put: 'ancestral allele';
		at: 'AC' put: 'allele count in genotypes, for each ALT allele, in the same order as listed';
		at: 'AF' put: 'allele frequency for each ALT allele in the same order as listed: use this when estimated from primary data, not called genotypes';
		at: 'AN' put: 'total number of alleles in called genotypes';
		at: 'BQ' put: 'RMS base quality at this position';
		at: 'CIGAR' put: 'cigar string describing how to align an alternate allele to the reference allele';
		at: 'DB' put: 'dbSNP membership';
		at: 'DP' put: 'combined depth across samples, e.g.  DP=154';
		at: 'END' put: 'end position of the variant described in this record (for use with symbolic alleles)';
		at: 'H2' put: 'membership in hapmap2';
		at: 'H3' put:  'membership in hapmap3';
		at: 'MQ' put: 'RMS mapping quality, e.g.  MQ=52';
		at: 'MQ0' put: 'Number of MAPQ == 0 reads covering this record';
		at: 'NS' put: 'Number of samples with data';
		at: 'SB' put: 'strand bias at this position';
		at: 'SOMATIC' put: 'indicates that the record is a somatic mutation, for cancer genomics';
		at: 'VALIDATED' put: 'validated by follow-up experiment';
		at: '1000G' put: 'membership in 1000 Genomes';
		yourself
]

{ #category : #accessing }
BioVCFRecord >> position [
	" Answer a <Number> with the reference position, with the 1st base having position 1.  Positions are sorted numerically, in increasing order, within each reference sequence CHROM. It is permitted to have multiple records with the
same POS. Telomeres are indicated by using positions 0 or N+1, where N is the length of the corresponding chromosome or contig.  (Integer, Required) "

	^ position
]

{ #category : #accessing }
BioVCFRecord >> position: aNumber [
	" Set a <Number> with the reference position, with the 1st base having position 1.  Positions are sorted numerically, in increasing order, within each reference sequence CHROM. It is permitted to have multiple records with the same POS. Telomeres are indicated by using positions 0 or N+1, where N is the length of the corresponding chromosome or contig.  (Integer, Required) "

	position := aNumber
]

{ #category : #accessing }
BioVCFRecord >> quality [
	" Answer a <Number> of Phred-scaled quality score for the assertion made in ALT. i.e. − 10 log10 prob(call in ALT is wrong).  If ALT is ‘.’  (no variant) then this is - 10 log10 prob(variant), and if ALT is not ‘.’  this is − 10 log10 prob(no variant).  If unknown, the missing value should be specified."

	^ quality
]

{ #category : #accessing }
BioVCFRecord >> quality: aNumber [
	" Set a <Number> of Phred-scaled quality score for the assertion made in ALT. i.e. − 10 log10 prob(call in ALT is wrong).  If ALT is ‘.’  (no variant) then this is - 10 log10 prob(variant), and if ALT is not ‘.’  this is − 10 log10 prob(no variant).  If unknown, the missing value should be specified."

	quality := aNumber
]

{ #category : #accessing }
BioVCFRecord >> refBase [
	" Answer a <String> of reference base(s). Each base must be one of A,C,G,T,N (case insensitive).  Multiple bases are permitted. The  value  in  the  POS  field  refers  to  the  position  of  the  first  base  in  the  String.   For  simple  insertions  and deletions in which either the REF or one of the ALT alleles would otherwise be null/empty, the REF and ALT Strings must include the base before the event (which must be reflected in the POS field),  unless the event occurs at position 1 on the contig in which case it must include the base after the event; this padding base is not required (although it is permitted) for e.g.  complex substitutions or other events where all alleles have at least one base represented in their Strings.  If any of the ALT alleles is a symbolic allele (an angle-bracketed ID String “<ID>”) then the padding base is required and POS denotes the coordinate of the base preceding the polymorphism.  Tools processing VCF files are not required to preserve case in the allele Strings.  (String, Required). "

	^ refBase
]

{ #category : #accessing }
BioVCFRecord >> refBase: aString [
	" Set a <String> of reference base(s): A,C,G,T,N"

	self assert: (aString includesAnyOf: 'ACTGN').
	refBase := aString
]

{ #category : #accessing }
BioVCFRecord >> samples [
	" Answer a <Collection> of <BioVCFRecordSample> with genotype calls "
	
	^ samples
		ifNil: [ samples := OrderedCollection new ]

]

{ #category : #'accessing - filter' }
BioVCFRecord >> setFilterAsPASSED [
	" Set a <String> with filter status: PASS as this position has passed all filters, i.e.  a call is made at this position.  "

	self filter: 'PASS'

]

{ #category : #'accessing - info' }
BioVCFRecord >> setInfoAF: aNumber [
	" Set aNumber of allele frequency for each ALT allele in the same order as listed: use this when estimated from primary data, not called genotypes"

	self info at: 'AF' put: aNumber
]

{ #category : #'accessing - info' }
BioVCFRecord >> setInfoAN: aNumber [
	" Set aNumber of total number of alleles in called genotypes "

	self info at: 'AN' put: aNumber
]

{ #category : #'accessing - info' }
BioVCFRecord >> setInfoCIGAR: aString [
	" Set aString cigar string describing how to align an alternate allele to the reference allele "

	self info at: 'CIGAR' put: aString
]

{ #category : #'accessing - info' }
BioVCFRecord >> setInfoDB [
	" Set dbSNP membership "

	self info at: 'DB' put: nil
]

{ #category : #'accessing - info' }
BioVCFRecord >> setInfoDP: aNumber [
	" Set aNumber of combined depth across samples"

	self info at: 'DP' put: aNumber
]

{ #category : #'accessing - info' }
BioVCFRecord >> setInfoH2 [
	" Set hapmap2 membership "
	
	self info at: 'H2' put: nil
]

{ #category : #'accessing - info' }
BioVCFRecord >> setInfoH3 [
	" Set hapmap3 membership "

	self info at: 'H3' put: nil
]

{ #category : #'accessing - info' }
BioVCFRecord >> setInfoNS: aNumber [
	" Set aNumber of samples with data"

	self info at: 'NS' put: aNumber
]

{ #category : #'accessing - info' }
BioVCFRecord >> setInfoRMS: aNumber [
	" Set aNumber of RMS mapping quality "

	self info at: 'RMS' put: aNumber
]
