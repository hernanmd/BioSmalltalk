"
PLINK wrapper requires the plink executable file to be in the PATH.  To check it is in the PATH open and command prompt or terminal and type: 

which plink

Subclasses should implement specific PLINK versions features.

Usage example:

BioPLINKWrapper new 
	file: 'myInputFile'; 	""Do not specify .ped extension !""
	out: 'myOutputFile';	"" Do not specify output extension ""
	noWeb;
	makeBed;
	execute.
"
Class {
	#name : #BioPLINKWrapper,
	#superclass : #BioWrapperObject,
	#category : #'BioWrappers-Popgen'
}

{ #category : #defaults }
BioPLINKWrapper class >> defaultProgramName [
	" Answer a <String> "

	^ self plink
]

{ #category : #'instance creation' }
BioPLINKWrapper class >> fromAxiomPLINK: pedFilename [
	" Set a new instance of the receiver configured for reading from PLINK files exported from Affymetrix Axiom Analysis Suite "
	
	^ self new
		initializeFromAxiomPLINK: pedFilename;
		yourself.
		
]

{ #category : #programs }
BioPLINKWrapper class >> plink [
	" Answer a <String> with the command line name "

	^ 'plink'
]

{ #category : #testing }
BioPLINKWrapper class >> testFilesFullDirectoryName [
	" See superimplementor's comment "

	^ super testFilesFullDirectoryName / 'pedmap'
]

{ #category : #options }
BioPLINKWrapper >> aec [
	" Allow nonstandard chromosome IDs, this is the same as --allow-extra-chr option "

	 ^ self addOption: 'aec'
]

{ #category : #options }
BioPLINKWrapper >> aecAsZero [
	" Allow nonstandard chromosome IDs. The '0' modifier causes these chromosome codes to be treated as if they had been set to zero. (This is sometimes necessary to produce reports readable by older software.) "

	self propertyAt: 'aec' ifAbsentPut: [ 0 ]
]

{ #category : #options }
BioPLINKWrapper >> autosome [

	 ^ self addOption: 'autosome'
]

{ #category : #'properties - filtering' }
BioPLINKWrapper >> autosomeNum: aNumber [  

	self propertyAt: 'autosome-num' ifAbsentPut: [ aNumber asString , 'no-y no-xy no-mt' ]
]

{ #category : #properties }
BioPLINKWrapper >> bcf: fileName [  
	" Set the input to a (possibly gzipped) BCF2 fileName "

	self propertyAt: 'bcf' ifAbsentPut: [ self buildPath: fileName ]
]

{ #category : #properties }
BioPLINKWrapper >> bfile: fileName [  
	" Set the input binary file to fileName, without extension "

	self 
		propertyAt: 'bfile' 
		ifAbsentPut: [ self buildPath: fileName ]
]

{ #category : #'properties - filtering' }
BioPLINKWrapper >> chr: aCollectionOrInterval [  
	" Set the output to filter chromosome aCollectionOrInterval "

	self propertyAt: 'chr' ifAbsentPut: [ aCollectionOrInterval asPLINKParameter ]
]

{ #category : #'properties - filtering' }
BioPLINKWrapper >> chrSet: chrNumber [  
	" Set the output to filter chromosome aNumberOrCharacter.
	 The first parameter specifies the number of diploid autosome pairs if positive, or haploid chromosomes if negative"

	self assert: [ chrNumber <= 95 ] description: 'Maximum chromosome number is currently limited to 95'.
	self propertyAt: 'chr-set' ifAbsentPut: [ chrNumber ]
]

{ #category : #'options - organisms' }
BioPLINKWrapper >> cow [
	" Add cow option to PLINK "

	 ^ self addOption: 'cow'
]

{ #category : #'options - organisms' }
BioPLINKWrapper >> dog [
	" Add dog option to PLINK "

	 ^ self addOption: 'dog'
]

{ #category : #'properties - filtering' }
BioPLINKWrapper >> exclude: aFilename [
	" Accepts aFilename text file with a list of variant IDs (usually one per line, but it's okay for them to just be separated by spaces), and exclude all unlisted variants from the current analysis. Note that this is slightly different from PLINK 1.07's behavior when the main input fileset contains duplicate variant IDs: PLINK 1.9 removes all matches, while PLINK 1.07 just removes one of the matching variants. If your intention is to resolve duplicates, you should now use --bmerge instead of --exclude. "

	self propertyAt: 'exclude' ifAbsentPut: [ self buildPath: aFilename ]
]

{ #category : #executing }
BioPLINKWrapper >> execSplitChrs [
	" Execute the receiver for each chromosome from the first chromosome to last chromosome accordingly to the receiver's configured organism "
	
	| filenamePrefix |
	
	filenamePrefix := self out.
	(1 to: self findMaxChrNum) 
		do: [ : chrNum |
			self 
				out: (self cwd , filenamePrefix , chrNum asString);
				chr: chrNum;
				execute ]
		displayingProgress: 'Splitting chromosomes...'
]

{ #category : #executing }
BioPLINKWrapper >> execSplitChrsFrom: chrStart [
	" Execute the receiver for each chromosome from chrStart to last chromosome accordingly to the receiver's configured organism "

	| filenamePrefix |
	
	filenamePrefix := self out.
	(chrStart to: self findMaxChrNum) do: [ : chrNum |
		self 
			out: (self cwd , filenamePrefix , chrNum asString);		
			chr: chrNum;
			execute ]
		displayingProgress: 'Splitting chromosomes...'

]

{ #category : #executing }
BioPLINKWrapper >> execSplitChrsFrom: chrStart to: chrEnd [
	" Execute the receiver for each chromosome from chrStart to chrEnd "

	| filenamePrefix |
	
	filenamePrefix := self out.
	(chrStart to: chrEnd) do: [ : chrNum |
		self 
			out: (self cwd , filenamePrefix , chrNum asString);		
			chr: chrNum;
			execute ]
		displayingProgress: 'Splitting chromosomes...'
]

{ #category : #executing }
BioPLINKWrapper >> execSplitFams [
	" Execute the receiver splitting each family "
	
	self famNames do: [ : famName |
		self 
			keepFam: famName;
			execute ]
]

{ #category : #'properties - filtering' }
BioPLINKWrapper >> extract: aFilename [
	" Removes all unlisted variants from the current dataset using aFilename (usually one variant ID per line, but it's okay for them to just be separated by spaces). "

	self propertyAt: 'extract' ifAbsentPut: [ self buildPath: aFilename ]
]

{ #category : #properties }
BioPLINKWrapper >> file: fileName [  
	" Set the input file to fileName "

	self propertyAt: 'file' ifAbsentPut: [ self buildPath: fileName ]
]

{ #category : #'options - filtering' }
BioPLINKWrapper >> filterCases [
	" Includes only cases in the current analysis "

	 ^ self addOption: 'filter-cases'
]

{ #category : #'options - filtering' }
BioPLINKWrapper >> filterControls [
	" Includes only controls in the current analysis "

	 ^ self addOption: 'filter-controls'
]

{ #category : #'options - filtering' }
BioPLINKWrapper >> filterFemales [
	" Includes only females in the current analysis "

	 ^ self addOption: 'filter-females'
]

{ #category : #'options - filtering' }
BioPLINKWrapper >> filterFounders [
	" Excludes all samples with at least one known parental ID from the current analysis (note that it is not necessary for that parent to be in the current dataset) "

	 ^ self addOption: 'filter-founders'
]

{ #category : #'options - filtering' }
BioPLINKWrapper >> filterMales [
	" Includes only males in the current analysis "

	 ^ self addOption: 'filter-males'
]

{ #category : #'options - filtering' }
BioPLINKWrapper >> filterNonFounders [
	" Includes all samples with at least one known parental ID from the current analysis "

	 ^ self addOption: 'filter-founders'
]

{ #category : #private }
BioPLINKWrapper >> findMaxChrNum [
	" Answer <Number> representing the maximum chromosome number for the receiver's configured organism. If none found, then answer Human default "
	
	^ self options 
		detect: [ : opt | self validOrganisms includes: opt ]
		ifFound: [ : o | BioSpeciesLists faoSpeciesWithChr at: o capitalized ]
		ifNone: [ 23 ]
]

{ #category : #'properties - filtering' }
BioPLINKWrapper >> fromBp: bpNumber [
	" Set the lower limit variant ID to bpNumber "

	self propertyAt: 'from-bp' ifAbsentPut: [ bpNumber ]
]

{ #category : #'properties - filtering' }
BioPLINKWrapper >> fromKb: kbNumber [
	" Set the lower limit variant ID to kbNumber "

	self propertyAt: 'from-kb' ifAbsentPut: [ kbNumber ]
]

{ #category : #'properties - filtering' }
BioPLINKWrapper >> fromMb: mbNumber [
	" Set the lower limit variant ID to mbNumber "

	self propertyAt: 'from-mb' ifAbsentPut: [ mbNumber ]
]

{ #category : #'properties - filtering' }
BioPLINKWrapper >> gene: aCollection [  
	" If variants have been assigned to sets (via --set/--make-set), takes aCollection of set names and removes all variants not in one of the named sets "

	self propertyAt: 'gene' ifAbsentPut: [ aCollection joinUsing: ' ' ]
]

{ #category : #'properties - filtering' }
BioPLINKWrapper >> geneAll [
	" Removes variants which aren't in any set (this used to happen automatically in some situations) "

	 ^ self addOption: 'geneAll'
]

{ #category : #'properties - filtering' }
BioPLINKWrapper >> geno: aFloat [  
	" Exclude individuals with genotyping error rate greater than aFloat "

	self propertyAt: 'geno' ifAbsentPut: [ aFloat ]
]

{ #category : #options }
BioPLINKWrapper >> hardy [
	" Writes a list of genotype counts and Hardy-Weinberg equilibrium exact test statistics "

	self addOption: 'hardy'
]

{ #category : #'properties - filtering' }
BioPLINKWrapper >> hardyMidP [
	" Writes a list of genotype counts and Hardy-Weinberg equilibrium exact test statistics. A mid-p adjustment is applied. 
	
	When the samples are case/control, three separate sets of Hardy-Weinberg equilibrium statistics are computed: one considering both cases and controls, one considering only cases, and one considering only controls. These are distinguished by 'ALL', 'AFF', and 'UNAFF' in the TEST column, respectively. If the phenotype is quantitative or nonexistent instead, there is just one line per variant, labeled 'ALL(QT)' or 'ALL(NP)' respectively.

By default, only founders are considered when generating this report, so if you are working with e.g. a sibling-only dataset, you won't get any results"

	self propertyAt: 'hardy' ifAbsentPut: [ 'midp' ]
]

{ #category : #'options - organisms' }
BioPLINKWrapper >> horse [
	" Add dog option to PLINK "

	 ^ self addOption: 'horse'
]

{ #category : #'properties - filtering' }
BioPLINKWrapper >> hwe: pValue [
	" Removes variants with Hardy-Weinberg equilibrium exact test p-value below the provided threshold.

	Only founders are considered by this test; use --nonfounders to change this.
	Also, with case/control data, cases and missing phenotypes are normally ignored; override this with 'include-nonctrl'. "

	self propertyAt: 'hwe' ifAbsentPut: [ pValue ]
]

{ #category : #initialization }
BioPLINKWrapper >> initializeFromAxiomPLINK: pedFilename [

	| newFilename aasMapFile aasPedFile fileNamePrefix |
	
	aasMapFile := (pedFilename , '.map') asFileReference.
	aasPedFile := (pedFilename , '.ped') asFileReference.
	fileNamePrefix := 'newFmt_'.
	newFilename := aasPedFile parent pathString , 
			DiskStore delimiter asString , 
			fileNamePrefix , 
			aasPedFile basenameWithoutExtension.

	self dumpToFileNamedFullPath: (newFilename , '.map')  contents: (aasMapFile tailn: 5).
	self dumpToFileNamedFullPath: (newFilename , '.ped')  contents: (aasPedFile tailn: 2).
	self file: newFilename.


]

{ #category : #'properties - filtering' }
BioPLINKWrapper >> keep: fileName [  
	" Accepts a space/tab-delimited fileName text file with family IDs in the first column and within-family IDs in the second column, and removes all unlisted samples from the current analysis "

	fileName asFileReference exists 
		ifFalse: [ fileName asFileReference writeStreamDo: [ : stream | stream nextPutAll: fileName ] ].
	self propertyAt: 'keep' ifAbsentPut: [ self buildPath: fileName ]
]

{ #category : #'properties - filtering' }
BioPLINKWrapper >> keepClusterNames: aCollection [  
	" If samples are assigned to clusters (via --within/--family), --keep-clusters and --keep-cluster-names can be used individually or in combination to define a list of clusters to keep; all samples not in one of those clusters are then removed from the current analysis. --keep-clusters accepts a text file with one cluster name per line, and --keep-cluster-names takes a space-delimited sequence of cluster names on the command line. "

	self propertyAt: 'keep-cluster-names' ifAbsentPut: [ aCollection joinUsing: ' ' ]
]

{ #category : #'properties - filtering' }
BioPLINKWrapper >> keepClusters: fileName [  
	" If samples are assigned to clusters (via --within/--family), --keep-clusters and --keep-cluster-names can be used individually or in combination to define a list of clusters to keep; all samples not in one of those clusters are then removed from the current analysis. --keep-clusters accepts a text file with one cluster name per line, and --keep-cluster-names takes a space-delimited sequence of cluster names on the command line. "

	self propertyAt: 'keep-clusters' ifAbsentPut: [ self buildPath: fileName ]
]

{ #category : #'properties - filtering' }
BioPLINKWrapper >> keepFam: fileName [  
	" Set the family to keep to fileName "

	fileName asFileReference exists 
		ifFalse: [ fileName asFileReference writeStreamDo: [ : stream | stream nextPutAll: fileName ] ].
	self propertyAt: 'keep-fam' ifAbsentPut: [ fileName ]
]

{ #category : #'properties - filtering' }
BioPLINKWrapper >> keepFams: aCollection [
	" Keep families in aCollection "

	| famIDFile |
	(famIDFile := 'FIDs.txt') asFileReference writeStreamDo: [ : stream |
		aCollection do: [ : famName | 
			stream 
				nextPutAll: famName; 
				nextPutTerminator ] ].
	self propertyAt: 'keep-fam' ifAbsentPut: [ famIDFile ].

]

{ #category : #'properties - filtering' }
BioPLINKWrapper >> maf: aFloat [  
	" Exclude individuals with minor allele frequency greater than aFloat "

	self propertyAt: 'maf' ifAbsentPut: [ aFloat ]
]

{ #category : #options }
BioPLINKWrapper >> makeBed [
	" Add option to generate BED, BIM and FAM files "

	 ^ self addOption: 'make-bed'
]

{ #category : #'properties - filtering' }
BioPLINKWrapper >> mind: aFloat [  
	" Exclude individuals with genotyping error greater than aFloat "

	self propertyAt: 'mind' ifAbsentPut: [ aFloat ]
]

{ #category : #properties }
BioPLINKWrapper >> missingGenotype: aCharacter [  
	" Missing genotype calls are normally assumed to be represented by '0' in .ped and similar files; you can change this to most other (nonspace) characters with --missing-genotype. However,  "

	self deny: [ { $A . $C . $G . $T . $1 . $2 . $3 . $4 } includes: aCharacter ] description: '1, 2, 3, 4, A, C, G, and T are disallowed'.
	self propertyAt: 'missing-genotype' ifAbsentPut: [ aCharacter ]
]

{ #category : #'options - organisms' }
BioPLINKWrapper >> mouse [
	" Add mouse option to PLINK "

	 ^ self addOption: 'mouse'
]

{ #category : #options }
BioPLINKWrapper >> noFid [
	" Add no family ID option to PLINK "

	 ^ self addOption: 'no-fid'
]

{ #category : #options }
BioPLINKWrapper >> noParents [
	" Add no-parents option to PLINK "

	 ^ self addOption: 'no-parents'
]

{ #category : #options }
BioPLINKWrapper >> noPheno [
	" Add no-pheno option to PLINK "

	 ^ self addOption: 'no-pheno'
]

{ #category : #options }
BioPLINKWrapper >> noSex [
	" Add no-sex option to PLINK "

	 ^ self addOption: 'no-sex'
]

{ #category : #'options - filtering' }
BioPLINKWrapper >> nonFounders [
	" By default, nonfounders are not counted by --freq{x} or --maf/--max-maf/--hwe. Use the --nonfounders flag to include them "

	 ^ self addOption: 'nonfounders'
]

{ #category : #'properties - filtering' }
BioPLINKWrapper >> notChr: aCollectionOrInterval [
	" Is the reverse of #chr: variants on listed chromosome(s) are excluded "

	self propertyAt: 'not-chr' ifAbsentPut: [ aCollectionOrInterval asPLINKParameter ]
]

{ #category : #modes }
BioPLINKWrapper >> out [
	" Answer a <String> with the output file name "

	^ self propertyAt: 'out'
]

{ #category : #properties }
BioPLINKWrapper >> out: fileName [  
	" Set the output file to fileName "

	self propertyAt: 'out' put: fileName
]

{ #category : #programs }
BioPLINKWrapper >> plink [
	" Answer a <String> with the command line name "

	^ self class plink
]

{ #category : #'accessing - private' }
BioPLINKWrapper >> propertySeparator [
	" Private - See superclass comment "

	^ Character space
]

{ #category : #'properties - recoding' }
BioPLINKWrapper >> recode12 [
	" Set the output code format to 12 "

	self propertyAt: 'recode' ifAbsentPut: [ '12' ]
]

{ #category : #'properties - recoding' }
BioPLINKWrapper >> recodeHV [
	" Set the output code format to HaploView "

	self propertyAt: 'recode' ifAbsentPut: [ 'hv' ]
]

{ #category : #'properties - recoding' }
BioPLINKWrapper >> recodeStructure [
	" Set the output code format to Pritchard Structure "

	self propertyAt: 'recode' ifAbsentPut: [ 'structure' ]
]

{ #category : #'properties - recoding' }
BioPLINKWrapper >> recodeTab [
	" Set the output code format to TAB "

	self propertyAt: 'recode' ifAbsentPut: [ 'tab' ]
]

{ #category : #properties }
BioPLINKWrapper >> referenceAlleles: fileName [ 
	" Set the reference alleles to fileName "

	self propertyAt: 'reference-allele' ifAbsentPut: [ self buildPath: fileName ]
]

{ #category : #'properties - filtering' }
BioPLINKWrapper >> remove: fileName [  
	" Accepts a space/tab-delimited fileName text file with family IDs in the first column and within-family IDs in the second column, and removes all listed samples from the current analysis "

	fileName asFileReference exists 
		ifFalse: [ fileName asFileReference writeStreamDo: [ : stream | stream nextPutAll: fileName ] ].
	self propertyAt: 'remove' ifAbsentPut: [ self buildPath: fileName ]
]

{ #category : #'properties - filtering' }
BioPLINKWrapper >> removeClusterNames: aCollection [  
	" Removes all samples in clusters named on aCollection "

	self propertyAt: 'remove-cluster-names' ifAbsentPut: [ aCollection joinUsing: ' ' ]
]

{ #category : #'properties - filtering' }
BioPLINKWrapper >> removeClusters: fileName [  
	" Removes all samples in clusters named in a file "

	self propertyAt: 'remove-cluster' ifAbsentPut: [ self buildPath: fileName ]
]

{ #category : #'properties - filtering' }
BioPLINKWrapper >> removeFam: fileName [  
	" Set the family to remove to fileName "

	fileName asFileReference exists 
		ifFalse: [ fileName asFileReference writeStreamDo: [ : stream | stream nextPutAll: fileName ] ].
	self propertyAt: 'remove-fam' ifAbsentPut: [ self buildPath: fileName ]
]

{ #category : #'properties - filtering' }
BioPLINKWrapper >> removeFams: aCollection [
	" remove families in aCollection "

	| famIDFile |
	(famIDFile := 'FIDs.txt') asFileReference writeStreamDo: [ : stream |
		aCollection do: [ : famName | 
			stream 
				nextPutAll: famName; 
				nextPutTerminator ] ].
	self propertyAt: 'remove-fam' ifAbsentPut: [ famIDFile ].

]

{ #category : #'options - organisms' }
BioPLINKWrapper >> rice [
	" Add rice option to PLINK "

	 ^ self addOption: 'rice'
]

{ #category : #'options - organisms' }
BioPLINKWrapper >> sheep [
	" Add sheep option to PLINK "

	 ^ self addOption: 'sheep'
]

{ #category : #'properties - filtering' }
BioPLINKWrapper >> toBp: bpNumber [
	" Set the upper limit variant ID to mbNumber "

	self propertyAt: 'to-bp' ifAbsentPut: [ bpNumber ]
]

{ #category : #'properties - filtering' }
BioPLINKWrapper >> toKb: kbNumber [
	" Set the upper limit variant ID to mbNumber "

	self propertyAt: 'to-kb' ifAbsentPut: [ kbNumber ]
]

{ #category : #'properties - filtering' }
BioPLINKWrapper >> toMb: mbNumber [
	" Set the upper limit variant ID to mbNumber "

	self propertyAt: 'to-mb' ifAbsentPut: [ mbNumber ]
]

{ #category : #'properties - recoding' }
BioPLINKWrapper >> transpose [
	" Set up a transposed output "

	self propertyAt: 'recode' ifAbsentPut: [ 'transpose' ]
]

{ #category : #private }
BioPLINKWrapper >> validOrganisms [
	" Answer a <Collection> of <String> with valid organisms names for the receiver "

	| ro |
	
	ro := self class organization.
	^ ro listAtCategoryNamed: 'options - organisms'
]

{ #category : #properties }
BioPLINKWrapper >> vcf: fileName [  
	" Set the input to a (possibly gzipped) VCF fileName "

	self propertyAt: 'vcf' ifAbsentPut: [ self buildPath: fileName ]
]

{ #category : #options }
BioPLINKWrapper >> zeroCms [
	" Zero out all centimorgan positions in the output fileset. This saves disk space and speeds up file I/O when you don't need the centimorgan values "

	 ^ self addOption: 'zeroCms'
]
