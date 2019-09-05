Class {
	#name : #BioVCFRecordWriter,
	#superclass : #BioObject,
	#instVars : [
		'vcfRecord',
		'formatStream',
		'infoStream'
	],
	#category : 'BioFormatters-Formatters-VCF'
}

{ #category : #'accessing - format' }
BioVCFRecordWriter >> appendFormatDelimiter [
	self hasFormatField
		ifTrue: [ self formatStream nextPut: $: ]
]

{ #category : #'accessing - info' }
BioVCFRecordWriter >> appendInfoDelimiter [
	self hasInfoFields
		ifTrue: [ self infoStream nextPut: $; ]
]

{ #category : #'accessing - format' }
BioVCFRecordWriter >> formatStream [
	" Answer a <Stream> with additional information. See #formatString "

	^ formatStream
		ifNil: [ formatStream := WriteStream on: String empty ]

]

{ #category : #'accessing - format' }
BioVCFRecordWriter >> formatString [
	" Answer a <String> with format information. "

	^ self formatStream contents
]

{ #category : #testing }
BioVCFRecordWriter >> hasFormatField [
	" Answer <true> if the receiver has set any of the format fields "
	
	^ self formatString notEmpty
]

{ #category : #testing }
BioVCFRecordWriter >> hasInfoFields [
	" Answer <true> if the receiver has set any of the info fields "
	
	^ self infoString notEmpty
]

{ #category : #'accessing - info' }
BioVCFRecordWriter >> info: aString [
	" Set a <String> with additional information:  (String, no white-space, semi-colons, or equals-signs permitted;  commas are permitted only as delimiters for lists of values) INFO fields are encoded as a semicolon-separated series of short keys with optional values in the format: <key> = <data>[,data].  Arbitrary keys are permitted "

	self deny: (aString includesAnyOf: ' ;=').
	infoStream := WriteStream on: aString
]

{ #category : #'accessing - info' }
BioVCFRecordWriter >> infoStream [
	" Answer a <Stream> with additional information. See #infoString "

	^ infoStream 
		ifNil: [ infoStream := WriteStream on: String empty ]

]

{ #category : #'accessing - info' }
BioVCFRecordWriter >> infoString [
	" Answer a <String> with additional information: (String, no white-space, semi-colons, or equals-signs permitted;  commas are permitted only as delimiters for lists of values) INFO fields are encoded as a semicolon-separated series of short keys with optional values in the format: <key> = <data>[,data].  Arbitrary keys are permitted, although the following sub-fields are reserved (albeit optional) "

	^ self infoStream asString
]

{ #category : #'accessing - format' }
BioVCFRecordWriter >> printFormatDP [
	" Set read depth at this position for this sample (Integer) "

	self appendFormatDelimiter.
	self formatStream nextPutAll: 'DP'

]

{ #category : #'accessing - format' }
BioVCFRecordWriter >> printFormatEC [
	" Set the comma separated list of expected alternate allele counts for each alternate allele in the same order as listed in the ALT field (typically used in association analyses) (Integers) "

	self appendFormatDelimiter.
	self formatStream nextPutAll: 'EC'

]

{ #category : #'accessing - format' }
BioVCFRecordWriter >> printFormatFT [
	" Set sample genotype filter indicating if this genotype was 'called' (similar in concept to the FILTER field). Again, use PASS to indicate that all lters have been passed, a semi-colon separated list of codes for filters that fail, or `.' to indicate that filters have not been applied. These values should be described in the metainformation in the same way as FILTERs (String, no white-space or semi-colons permitted) "

	self appendFormatDelimiter.
	self formatStream nextPutAll: 'FT'

]

{ #category : #'accessing - format' }
BioVCFRecordWriter >> printFormatGL [
	" Set genotype likelihoods comprised of comma separated foating point log10-scaled likelihoods for all possible genotypes given the set of alleles dened in the REF and ALT fields. In presence of the GT field the same ploidy is expected and the canonical order is used; without GT eld, diploidy is assumed. If A is the allele in REF and B,C,... are the alleles as ordered in ALT, the ordering of genotypes for the likelihoods is given by: F(j/k) = (k*(k+1)/2)+j. In other words, for biallelic sites the ordering is: AA,AB,BB; for triallelic sites the ordering is: AA,AB,BB,AC,BC,CC, etc. For example: GT:GL 0/1:-323.03,-99.29,-802.53 (Floats) "

	self appendFormatDelimiter.
	self formatStream nextPutAll: 'GL'

]

{ #category : #'accessing - format' }
BioVCFRecordWriter >> printFormatGLE [
	" Set genotype likelihoods of heterogeneous ploidy, used in presence of uncertain copy number. For example:
GLE=0:-75.22,1:-223.42,0/0:-323.03,1/0:-99.29,1/1:-802.53 (String) "

	self appendFormatDelimiter.
	self formatStream nextPutAll: 'GLE'
]

{ #category : #'accessing - format' }
BioVCFRecordWriter >> printFormatGP [
	" Set the phred-scaled genotype posterior probabilities (and otherwise dened precisely as the GL field); intended to store imputed genotype probabilities (Floats) "

	self appendFormatDelimiter.
	self formatStream nextPutAll: 'GP'

]

{ #category : #'accessing - format' }
BioVCFRecordWriter >> printFormatGQ [
	" Set the conditional genotype quality, encoded as a phred quality 10log10 p (genotype call is wrong, conditioned on the site's being variant) (Integer) "

	self appendFormatDelimiter.
	self formatStream nextPutAll: 'GQ'

]

{ #category : #'accessing - format' }
BioVCFRecordWriter >> printFormatGT [
	" Set genotype, encoded as allele values separated by either of = or j. The allele values are 0 for the reference allele (what is in the REF eld), 1 for the first allele listed in ALT, 2 for the second allele list in ALT and so on. For diploid calls examples could be 0=1, 1 j 0, or 1=2, etc. For haploid calls, e.g. on Y, male nonpseudoautosomal X, or mitochondrion, only one allele value should be given; a triploid call might look like 0=0=1. If a call cannot be made for a sample at a given locus, `.' should be specified for each missing allele in the GT field (for example `:=:' for a diploid genotype and `.' for haploid genotype). The meanings of the separators are as follows (see the PS eld below for more details on incorporating phasing information into the genotypes):
	/ : genotype unphased 
	| : genotype phased "

	self appendFormatDelimiter.
	self formatStream nextPutAll: 'GT'

]

{ #category : #'accessing - format' }
BioVCFRecordWriter >> printFormatHQ [
	" Set the haplotype qualities, two comma separated phred qualities (Integers) "

	self appendFormatDelimiter.
	self formatStream nextPutAll: 'HQ'

]

{ #category : #'accessing - format' }
BioVCFRecordWriter >> printFormatMQ [
	" Set the RMS mapping quality, similar to the version in the INFO field. (Integer) "

	self appendFormatDelimiter.
	self formatStream nextPutAll: 'MQ'

]

{ #category : #'accessing - format' }
BioVCFRecordWriter >> printFormatPL [
	" Set the phred-scaled genotype likelihoods rounded to the closest integer (and otherwise defined precisely as
the GL field) (Integers) "

	self appendFormatDelimiter.
	self formatStream nextPutAll: 'PL'

]

{ #category : #'accessing - format' }
BioVCFRecordWriter >> printFormatPQ [
	" Set the phasing quality, the phred-scaled probability that alleles are ordered incorrectly in a heterozygote (against all other members in the phase set). We note that we have not yet included the specific measure for precisely defining 'phasing quality'; our intention for now is simply to reserve the PQ tag for future use as a measure of phasing quality. (Integer) "

	self appendFormatDelimiter.
	self formatStream nextPutAll: 'PQ'

]

{ #category : #'accessing - format' }
BioVCFRecordWriter >> printFormatPS [
	" Set the phase set. A phase set is dened as a set of phased genotypes to which this genotype belongs. Phased genotypes for an individual that are on the same chromosome and have the same PS value are in the same phased set. A phase set species multi-marker haplotypes for the phased genotypes in the set. All phased genotypes that do not contain a PS subeld are assumed to belong to the same phased set. If the genotype in the GT field is unphased, the corresponding PS field is ignored. The recommended convention is to use the position of the first variant in the set as the PS identier (although this is not required). (Non-negative 32-bit Integer) "

	self appendFormatDelimiter.
	self formatStream nextPutAll: 'PS'

]

{ #category : #'accessing - info' }
BioVCFRecordWriter >> printInfoAF: aNumber [
	" Set aNumber of allele frequency for each ALT allele in the same order as listed: use this when estimated from primary data, not called genotypes"

	self appendInfoDelimiter.
	self infoStream 
		nextPutAll: 'AF=';
		nextPutAll: aNumber asString 
]

{ #category : #'accessing - info' }
BioVCFRecordWriter >> printInfoAN: aNumber [
	" Set aNumber of total number of alleles in called genotypes "

	self appendInfoDelimiter.
	self infoStream 
		nextPutAll: 'AN=';
		nextPutAll: aNumber asString 
]

{ #category : #'accessing - info' }
BioVCFRecordWriter >> printInfoCIGAR: aString [
	" Set aString cigar string describing how to align an alternate allele to the reference allele "

	self appendInfoDelimiter.
	self infoStream
		nextPutAll: 'CIGAR=';
		nextPutAll: aString
]

{ #category : #'accessing - info' }
BioVCFRecordWriter >> printInfoDB [
	" Set dbSNP membership "

	self appendInfoDelimiter.
	self infoStream 
		nextPutAll: 'DB'
]

{ #category : #'accessing - info' }
BioVCFRecordWriter >> printInfoDP: aNumber [
	" Set aNumber of combined depth across samples"

	self appendInfoDelimiter.
	self infoStream 
		nextPutAll: 'DP=';
		nextPutAll: aNumber asString 
]

{ #category : #'accessing - info' }
BioVCFRecordWriter >> printInfoH2 [
	" Set hapmap2 membership "

	self appendInfoDelimiter.
	self infoStream 
		nextPutAll: 'H2'
]

{ #category : #'accessing - info' }
BioVCFRecordWriter >> printInfoH3 [
	" Set hapmap3 membership "

	self appendInfoDelimiter.
	self infoStream 
		nextPutAll: 'H3'
]

{ #category : #'accessing - info' }
BioVCFRecordWriter >> printInfoNS: aNumber [
	" Set aNumber of samples with data"

	self appendInfoDelimiter.
	self infoStream
		nextPutAll: 'NS=';
		nextPutAll: aNumber asString 
]

{ #category : #'accessing - info' }
BioVCFRecordWriter >> printInfoRMS: aNumber [
	" Set aNumber of RMS mapping quality "

	self appendInfoDelimiter.
	self infoStream
		nextPutAll: 'RMS=';
		nextPutAll: aNumber asString 
]

{ #category : #accessing }
BioVCFRecordWriter >> vcfRecord [
	^ vcfRecord
]

{ #category : #accessing }
BioVCFRecordWriter >> vcfRecord: anObject [
	vcfRecord := anObject
]
