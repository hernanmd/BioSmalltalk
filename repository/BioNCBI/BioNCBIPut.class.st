"
http://www.ncbi.nlm.nih.gov/blast/Doc/node5.html
"
Class {
	#name : #BioNCBIPut,
	#superclass : #BioNCBICSCommand,
	#category : #'BioNCBI-Commands'
}

{ #category : #accessing }
BioNCBIPut >> autoFormatFull [
	" Determines whether to format results automatically "
	
	self clientUrl queryAt: 'AUTO_FORMAT' put: 'Fullauto'
]

{ #category : #accessing }
BioNCBIPut >> autoFormatOff [
	" Determines whether to format results automatically "
	
	self clientUrl queryAt: 'AUTO_FORMAT' put: 'Off'
]

{ #category : #accessing }
BioNCBIPut >> autoFormatSemiauto [
	" Determines whether to format results automatically "
	
	self clientUrl queryAt: 'AUTO_FORMAT' put: 'Semiauto'
]

{ #category : #'accessing private' }
BioNCBIPut >> baseUrl [
	" Private - See superimplementor's comment "
	
	^ self cmdString , '=Put'
]

{ #category : #accessing }
BioNCBIPut >> blastn [
	" BLASTN programs search nucleotide databases using a nucleotide query.
	The best way to identify an unknown sequence is to see if that sequence already exists in a public database. If the database sequence is a well-characterized sequence, then one will have access to a wealth of biological information. MEGABLAST, discontiguous-megablast, and blastn all can be used to accomplish this goal. However, MEGABLAST is specifically designed to efficiently find long alignments between very similar sequences and thus is the best tool to use to find the identical match to your query sequence. In addition to the expect value significance cut-off, MEGABLAST also provides an adjustable percent identity cut-off for the alignment, which provides cut-off in addition to the significance cut-off threshold set by Expect value.
	
	See http://www.ncbi.nlm.nih.gov/blast/producttable.shtml#mega for details
	 "
	
	self clientUrl queryAt: 'PROGRAM' put: 'blastn'

]

{ #category : #accessing }
BioNCBIPut >> blastp [
	" BLASTP programs search protein databases using a protein query.
	Standard protein-protein BLAST (blastp) is used for both identifying a query amino acid sequence and for finding similar sequences in protein databases. Like other BLAST programs, blastp is designed to find local regions of similarity. When sequence similarity spans the whole sequence, blastp will also report a global alignment, which is the preferred result for protein identification purposes.

For clear result in identification search, try taking off 'low complexity filter'. Unlike nucleotide BLAST, there is no comparable MEGABLAST for protein searches, so batch search via the web is not supported. To do batch protein BLAST, you can take a look at netblast (blastcl3)	 "
	
	self clientUrl queryAt: 'PROGRAM' put: 'blastp'

]

{ #category : #accessing }
BioNCBIPut >> blastx [
	" BLASTX search protein databases using a translated nucleotide query "
	
	self clientUrl queryAt: 'PROGRAM' put: 'blastx'

]

{ #category : #'accessing private' }
BioNCBIPut >> clientUrl [
	" Answer a GTNCBIUrl object "
	
	^ self client url
]

{ #category : #accessing }
BioNCBIPut >> compositionBasedStatisticsOff [
	" Do search with tweak parameter set to false "
	
	self clientUrl queryAt: 'COMPOSITION_BASED_STATISTICS' put: 'no'
]

{ #category : #accessing }
BioNCBIPut >> compositionBasedStatisticsOn [
	" Do search with tweak parameter set to true "
	
	self clientUrl queryAt: 'COMPOSITION_BASED_STATISTICS' put: 'yes'
]

{ #category : #accessing }
BioNCBIPut >> database: aString [
	" Set the database parameter. Database name aString should be a valid database name "
	
	self clientUrl queryAt: 'DATABASE' put: aString
]

{ #category : #accessing }
BioNCBIPut >> dbGeneticCode: aSmallInteger [
	" Database genetic code (PROGRAM=tblast[nx] only) "
	
	((aSmallInteger asNumber between: 1 and: 16) or: [ aSmallInteger asNumber = 21 or: [ aSmallInteger asNumber = 22 ] ])
		ifTrue: [ self clientUrl queryAt: 'DB_GENETIC_CODE' put: aSmallInteger asString ]
		ifFalse: [ self signalInvalidObject: aSmallInteger asString ]
]

{ #category : #'accessing private' }
BioNCBIPut >> doesNotUnderstand: aMessage [
	" Private - Redirect messages not understood to the GET command.
	This allows to have interchangeable message sends to the NCBI Client
	without having to specify put or get start/end modes "
	
	^ aMessage sendTo: self get
]

{ #category : #accessing }
BioNCBIPut >> endPointsOff [
	" Get only alignment endpoints in results (megablast only) "
	
	self clientUrl queryAt: 'ENDPOINTS' put: 'no' 

]

{ #category : #accessing }
BioNCBIPut >> endPointsOn [
	" Get only alignment endpoints in results (megablast only) "
	
	self clientUrl queryAt: 'ENDPOINTS' put: 'yes' 

]

{ #category : #accessing }
BioNCBIPut >> expectValue: aFloat [
	" Expect value "
	
	self clientUrl queryAt: 'EXPECT' put: aFloat asString

]

{ #category : #accessing }
BioNCBIPut >> filterHumanRepeats [
	" Filter (Human repeats)

This option masks Human repeats (LINE's, SINE's, plus retroviral repeasts) and is useful for human sequences that may contain these repeats. Filtering for repeats can increase the speed of a search especially with very long sequences (>100 kb) and against databases which contain large number of repeats (htgs). This filter should be checked for genomic queries to prevent potential problems that may arise from the numerous and often spurious matches to those repeat elements.

For more information please see 'Why does my search timeout on the BLAST servers?' in the BLAST Frequently Asked Questions. 

	From: http://www.ncbi.nlm.nih.gov/BLAST/blastcgihelp.shtml#filter "
	
	self clientUrl queryAt: 'FILTER' put: 'R'

]

{ #category : #accessing }
BioNCBIPut >> filterLowComplexity [
	" Filter (Low-complexity)

This function mask off segments of the query sequence that have low compositional complexity, as determined by the SEG program of Wootton and Federhen (Computers and Chemistry, 1993) or, for BLASTN, by the DUST program of Tatusov and Lipman. Filtering can eliminate statistically significant but biologically uninteresting reports from the blast output (e.g., hits against common acidic-, basic- or proline-rich regions), leaving the more biologically interesting regions of the query sequence available for specific matching against database sequences.

Filtering is only applied to the query sequence (or its translation products), not to database sequences. Default filtering is DUST for BLASTN, SEG for other programs.

It is not unusual for nothing at all to be masked by SEG, when applied to sequences in SWISS-PROT or refseq, so filtering should not be expected to always yield an effect. Furthermore, in some cases, sequences are masked in their entirety, indicating that the statistical significance of any matches reported against the unfiltered query sequence should be suspect. This will also lead to search error when default setting is used. 

	From: http://www.ncbi.nlm.nih.gov/BLAST/blastcgihelp.shtml#filter "
	
	self clientUrl queryAt: 'FILTER' put: 'L'

]

{ #category : #accessing }
BioNCBIPut >> filterMaskForLookup [
	" Filter (Mask for lookup table only)

BLAST searches consist of two phases, finding hits based upon a lookup table and then extending them. This option masks only for purposes of constructing the lookup table used by BLAST so that no hits are found based upon low-complexity sequence or repeats (if repeat filter is checked). The BLAST extensions are performed without masking and so they can be extended through low-complexity sequence.

	From: http://www.ncbi.nlm.nih.gov/BLAST/blastcgihelp.shtml#filter  "
	
	self clientUrl queryAt: 'FILTER' put: 'm'

]

{ #category : #accessing }
BioNCBIPut >> gapCosts: spacedFloatString [
	" Gap open and gap extend costs 
	
	The pull down menu shows the Gap Costs for the chosen Matrix. There can only be a limited number of options for these parameters. Increasing the Gap Costs will result in alignments which decrease the number of Gaps introduced.
	
	From: http://www.ncbi.nlm.nih.gov/BLAST/blastcgihelp.shtml#Reward-penalty"
	
	self clientUrl queryAt: 'GAPCOSTS' put: spacedFloatString

]

{ #category : #accessing }
BioNCBIPut >> geneticCode: aSmallInteger [
	" Set the query genetic code "
	
	((aSmallInteger asNumber between: 1 and: 16) or: [ aSmallInteger asNumber = 21 or: [ aSmallInteger asNumber = 22 ] ] )
		ifTrue: [ self clientUrl queryAt: 'GENETIC_CODE' put: aSmallInteger asString ]
		ifFalse: [ self signalInvalidObject: aSmallInteger asString ]
]

{ #category : #accessing }
BioNCBIPut >> hitListSize: aSmallInteger [
	" Set the number of hits to return to be aSmallInteger "
	
	self clientUrl queryAt: 'HITLIST_SIZE' put: aSmallInteger asString
]

{ #category : #accessing }
BioNCBIPut >> iThresh: aFloat [
	" Threshold for extending hits (PSI BLAST only) "
	
	self clientUrl queryAt: 'I_THRESH' put: aFloat asString
]

{ #category : #testing }
BioNCBIPut >> isPut [
	
	^ true
]

{ #category : #accessing }
BioNCBIPut >> layoutOneWindow [
	" Windows layout when use it in a browser "
	
	self clientUrl queryAt: 'LAYOUT' put: 'OneWindow'
]

{ #category : #accessing }
BioNCBIPut >> layoutTwoWindows [
	" Windows layout when use it in a browser "
	
	self clientUrl queryAt: 'LAYOUT' put: 'TwoWindows'
]

{ #category : #accessing }
BioNCBIPut >> lowerCaseMaskOff [
	" Enable masking of lower case in query "
	
	self clientUrl queryAt: 'LCASE_MASK' put: 'no'
]

{ #category : #accessing }
BioNCBIPut >> lowerCaseMaskOn [
	" Enable masking of lower case in query "
	
	self clientUrl queryAt: 'LCASE_MASK' put: 'yes'
]

{ #category : #accessing }
BioNCBIPut >> matrixName: aString [
	" Matrix name (protein search only) "
	
	self clientUrl queryAt: 'MATRIX_NAME' put: aString
]

{ #category : #accessing }
BioNCBIPut >> nucleotidePenalty: aSmallInteger [
	" Penalty for a nucleotide mismatch (blastn only) "
	
	self clientUrl queryAt: 'NUCL_PENALTY' put: aSmallInteger asString
]

{ #category : #accessing }
BioNCBIPut >> nucleotideReward: aSmallInteger [
	" Reward for a nucleotide match (blastn only) "
	
	self clientUrl queryAt: 'NUCL_REWARD' put: aSmallInteger asString
]

{ #category : #accessing }
BioNCBIPut >> percentOfIdentity: aSmallInteger [
	" Percent of identity cut-off threshold (megablast only) "
	
	(aSmallInteger asNumber between: 0 and: 100)
		ifTrue: [ self clientUrl queryAt: 'PERC_IDENT' put: aSmallInteger asString ]
		ifFalse: [ self signalInvalidObject: aSmallInteger asString ]
]

{ #category : #accessing }
BioNCBIPut >> phiPattern: aString [
	" Phi Blast pattern "
	
	self clientUrl queryAt: 'PHI_PATTERN' put: aString

]

{ #category : #'mandatory-fields' }
BioNCBIPut >> query: aString [
	" Sequence query (queries if MegaBlast page).
	aString is Accession(s), gi(s), or FASTA sequence(s) "
	
	self bioLog: 'Using query sequence: ' , aString asString.
	self client queryAt: 'QUERY' put: aString trimBoth withoutCRs
]

{ #category : #accessing }
BioNCBIPut >> queryBelieveDeflineOff [
	" Whether to believe defline in FASTA query "
	
	self clientUrl queryAt: 'QUERY_BELIEVE_DEFLINE' put: 'no'
]

{ #category : #accessing }
BioNCBIPut >> queryBelieveDeflineOn [
	" Whether to believe defline in FASTA query "
	
	self clientUrl queryAt: 'QUERY_BELIEVE_DEFLINE' put: 'yes'
]

{ #category : #accessing }
BioNCBIPut >> queryFile: aString [
	" Sequence query (queries if MegaBlast page).
	aString is Accession(s), gi(s), or FASTA sequence(s) "
	
	self clientUrl queryAt: 'QUERY_FILE' put: aString
]

{ #category : #accessing }
BioNCBIPut >> queryFrom: aSmallInteger [
	" Start of subsequence (one offset) "
	
	self clientUrl queryAt: 'QUERY_FROM' put: aSmallInteger asString
]

{ #category : #accessing }
BioNCBIPut >> queryTo: aSmallInteger [
	" End of subsequence (one offset) "
	
	self clientUrl queryAt: 'QUERY_TO' put: aSmallInteger asString
]

{ #category : #accessing }
BioNCBIPut >> searchSpaceLength: aSmallInteger [
	" Effective length of the search space "
	
	self clientUrl queryAt: 'SEARCHSP_EFF' put: aSmallInteger asString
]

{ #category : #accessing }
BioNCBIPut >> tblastn [
	" TBLASTN search translated nucleotide databases using a protein query.
	A tblastn search allows you to compare a protein sequence to the six-frame translations of a nucleotide database. It can be a very productive way of finding homologous protein coding regions in unannotated nucleotide sequences such as expressed sequence tags (ESTs) and draft genome records (HTG), located in the BLAST databases est and htgs, respectively.

ESTs are short, single-read cDNA sequences. They comprise the largest pool of sequence data for many organisms and contain portions of transcripts from many uncharacterized genes. Since ESTs have no annotated coding sequences, there are no corresponding protein translations in the BLAST protein databases. Hence a tblastn search is the only way to search for these potential coding regions at the protein level. The HTG sequences, draft sequences from various genome projects or large genomic clones, are another large source of unannotated coding regions.

Like all translating searches, the tblastn search is especially suited to working with error prone data like ESTs and draft genomic sequences from HTG because it combines BLAST statistics for hits to multiple reading frames and thus is robust to frame shifts introduced by sequencing error. "
	
	self clientUrl queryAt: 'PROGRAM' put: 'tblastn'

]

{ #category : #accessing }
BioNCBIPut >> tblastx [
	" TBLASTX search translated nucleotide databases using a translated nucleotide query.
	tblastx takes a nucleotide query sequence, translates it in all six frames, and compares those translations to the database sequences dynamically translated in all six frames. This effectively performs a more sensitive blastp search without doing the manual translation.

tblastx gets around the potential frame-shift and ambiguities that may prevent certain open reading frames from being detected. This is very useful in identifying potential proteins encoded by single pass read ESTs. In addition, it can be a good tool for identifying novel genes.

This type of search is computationally intensive and should be used only as last resort. Searching with large genomic queries is NOT recommended. For users with regular or batch need for this time of searches, the best way is to install standalone blast and perform the search locally. For more information on standalone blast, please read the documents for formatdb and standalone BLAST at:

    ftp.ncbi.nlm.nih.gov/blast/documents/formatdb.html
    ftp.ncbi.nlm.nih.gov/blast/documents/netblast.html	 "
	
	self clientUrl queryAt: 'PROGRAM' put: 'tblastn'

]

{ #category : #accessing }
BioNCBIPut >> threshold: aSmallInteger [
	" Threshold for extending hits "
	
	self clientUrl queryAt: 'THRESHOLD' put: aSmallInteger asString

]

{ #category : #accessing }
BioNCBIPut >> ungappedAlignmentOff [
	" Should the ungapped alignment be performed ? "
	
	self clientUrl queryAt: 'UNGAPPED_ALIGNMENT' put: 'no'

]

{ #category : #accessing }
BioNCBIPut >> ungappedAlignmentOn [
	" Should the ungapped alignment be performed ? "
	
	self clientUrl queryAt: 'UNGAPPED_ALIGNMENT' put: 'yes'

]

{ #category : #accessing }
BioNCBIPut >> wordSize: aSmallInteger [
	" Word size "
	
	self clientUrl queryAt: 'WORD_SIZE' put: aSmallInteger asString

]
