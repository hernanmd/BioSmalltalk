"
LAMP is a software package for the inference of locus-specific ancestry in recently admixed populations. It includes a few versions as described below.

LAMP-LD takes the genotypes of admixed individuals as well as reference haplotype panels approximating the mixing ancestral populations, and outputs the estimated number of alleles from each ancestry in each locus for each individual.

The LAMP-LD package also includes the program LAMP-HAP, which processes haplotype data when high-quality phasing is available, and utilizes trio nuclear family designs to improve estimation accuracy.

LAMP-LD is based on a window-based processing combined within a hierarchical Hidden Markov Model. It can process 2,3 or 5 mixing populations, and its short per-sample processing time makes it suitable for analyzing large datasets of dense SNP panels. 

This wrapper REPLACES the need to run the perl script run_LAMPLD.pl provided by the software. See class side for examples.


"
Class {
	#name : #BioLAMPLDWrapper,
	#superclass : #BioWrapperObject,
	#instVars : [
		'windowSizes',
		'positionsFileName'
	],
	#category : 'BioLAMPLD-Core'
}

{ #category : #accessing }
BioLAMPLDWrapper class >> availablePlatforms [
	" Private - See superimplementor's comment "
	
	^ #('Unix')
]

{ #category : #defaults }
BioLAMPLDWrapper class >> defaultProgramName [
	" Private - See superimplementor's comment "

	^ self unolanc2way
]

{ #category : #examples }
BioLAMPLDWrapper class >> example1 [
	" Warning - This software is only available for Unix platforms "
	
	| samplesDir |

	self platformCheck ifFalse: [ ^ self invalidPlatform ].
	samplesDir := BioLAMPLDWrapper testFilesFullDirectoryName / '2-way'.
	BioLAMPLDWrapper new
		unolanc2way;
		windowSize: 50;
		nrFounders: 2;
		positionsFile: 	(samplesDir / 'chr.pos') fullName;
		addPopFile: 		(samplesDir / 'pop1.hap') fullName atOrder: 1;
		addPopFile: 		(samplesDir / 'pop2.hap') fullName atOrder: 2;
		genosFile:		(samplesDir / 'genofile.gen') fullName;
		outputFile:		'lamp-ld_example1.out';
		execute.
	
]

{ #category : #examples }
BioLAMPLDWrapper class >> example2 [
	" Warning - This software is only available for Unix platforms "
	
	| samplesDir |
	
	self platformCheck ifFalse: [ ^ self invalidPlatform ].
	samplesDir := BioLAMPLDWrapper testFilesFullDirectoryName / '2-way'.
	BioLAMPLDWrapper new
		unolanc2way;
		windowSizes: (30 to: 150);
		nrFounders: 2;
		positionsFile: 	(samplesDir / 'chr.pos') fullName;
		addPopFile: 		(samplesDir / 'pop1.hap') fullName atOrder: 1;
		addPopFile: 		(samplesDir / 'pop2.hap') fullName atOrder: 2;	
		genosFile:		(samplesDir / 'genofile.gen') fullName;
		executeWS.
	
]

{ #category : #examples }
BioLAMPLDWrapper class >> example3 [
	" Warning - This software is only available for Unix platforms "
	
	| samplesDir |
	
	self platformCheck ifFalse: [ ^ self invalidPlatform ].
	samplesDir := BioLAMPLDWrapper testFilesFullDirectoryName / '3-way'.
	BioLAMPLDWrapper new
		unolanc;
		windowSizes: (30 to: 150);
		nrFounders: 2;
		positionsFile: 		(samplesDir / 'chr1.pos') fullName;
		addPopFile: 		(samplesDir / 'EUR_haps.ref') fullName atOrder: 1;
		addPopFile: 		(samplesDir / 'NA_haps.ref') fullName atOrder: 2;
		addPopFile: 		(samplesDir / 'YRI_haps.ref') atOrder: 3;
		genosFile:		(samplesDir / 'trio.gen') fullName;
		executeWS.
	
]

{ #category : #accessing }
BioLAMPLDWrapper class >> softwareName [
	" See superimplementor's comment "

	^ 'LAMP-LD'
]

{ #category : #testing }
BioLAMPLDWrapper class >> testFilesFullDirectoryName [

	^ super testFilesFullDirectoryName / 'lamp-ld' / 'input_files'
]

{ #category : #programs }
BioLAMPLDWrapper class >> unolanc2way [
	" Answer a <String> for program name for 2 admixed samples "
	" USAGE:: unolanc2way <win-size> <nr-founders> <SNP-file> <CEU-haps> <YRI-haps> <ADMX-geno> <out-file> "

	^ 'unolanc2way'
]

{ #category : #accessing }
BioLAMPLDWrapper class >> url [
	" See superimplementor's comment "

	^ 'http://bogdan.bioinformatics.ucla.edu/software/lamp/'
]

{ #category : #options }
BioLAMPLDWrapper >> addPopFile: aFilename atOrder: nth [
	" Add ancestry haplotypes file name aFilename "

	self parameters at: 3 + nth put: aFilename
]

{ #category : #programs }
BioLAMPLDWrapper >> convertLAMPLDOut [
	" Answer a <String> for program name for expanding the LAMP-LD .out format "

	^ 'convertLAMPLDout.pl'
]

{ #category : #defaults }
BioLAMPLDWrapper >> defaultParametersCollector [
	" Answer a <Collection> acting as holder for receiver's parameters "

	^ Array new: 7
]

{ #category : #'accessing - private' }
BioLAMPLDWrapper >> execSelectorForUnix [
	" Private - Answer a <Symbol> representing a selector for performing a message in a Unix-box "
	
	^ #executeMonitoring:
]

{ #category : #'accessing - public' }
BioLAMPLDWrapper >> execute: ws [
	" Execute the receiver for ws value of window size "
	
	self windowSize: ws.
	self execute.
]

{ #category : #'accessing - public' }
BioLAMPLDWrapper >> executeWS [
	" Run the receiver for each value of window size "

	self windowSizes do: [ : ws | self execute: ws ]
]

{ #category : #options }
BioLAMPLDWrapper >> genosFile: aFilename [
	" Configure receiver's admix genotypes file name "

	self parameters at: 6 put: aFilename
]

{ #category : #programs }
BioLAMPLDWrapper >> gettriophase [
	" Answer a <String> for program name "

	^ 'gettriophase'

]

{ #category : #programs }
BioLAMPLDWrapper >> haplanc [
	" Answer a <String> for program name "

	^ 'haplanc'

]

{ #category : #options }
BioLAMPLDWrapper >> nrFounders: aNumber [
	" Configure receiver's number of states "

	self parameters at: 2 put: aNumber asString
]

{ #category : #accessing }
BioLAMPLDWrapper >> outputFile: aFilename [
	" Set the receiver's output file name to be aFilename "

	self parameters at: 7 put: aFilename
]

{ #category : #options }
BioLAMPLDWrapper >> positionsFile: aFilename [
	" Configure receiver's positions file name "

	self positionsFileName: aFilename.
	self parameters at: 3 put: aFilename
]

{ #category : #options }
BioLAMPLDWrapper >> positionsFileIn: basesDivider [
	" Convert receiver's positions file name to basesDivider (megabases or kilobases) "

	| outPosFile outputFilename baseDir baseFilename baseExtension fileRef extendedFilename |
	
	fileRef := self positionsFileName asFileReference.
	baseDir := fileRef parent pathString , self slash.
	baseFilename := fileRef basenameWithoutExtension.
	baseExtension := fileRef extension.
	extendedFilename := '_' ,  basesDivider asString.
	outputFilename := baseDir , baseFilename , extendedFilename , '.' , baseExtension.
	
	outPosFile := outputFilename asFileReference writeStream.
	[ fileRef contents lines 
		collect: [ : line | 
			outPosFile 
				nextPutAll: (line asNumber // basesDivider) asString;
				nextPutTerminator ] ]
	ensure: [ outPosFile close ]
]

{ #category : #options }
BioLAMPLDWrapper >> positionsFileInGb [
	" Convert receiver's positions file name to basesDivider (megabases or kilobases) "

	self positionsFileIn: 10000
]

{ #category : #options }
BioLAMPLDWrapper >> positionsFileInKb [
	" Convert receiver's positions file name to basesDivider (megabases or kilobases) "

	self positionsFileIn: 100
]

{ #category : #options }
BioLAMPLDWrapper >> positionsFileInMb [
	" Convert receiver's positions file name to basesDivider (megabases or kilobases) "

	self positionsFileIn: 1000
]

{ #category : #accessing }
BioLAMPLDWrapper >> positionsFileName [
	" Answer a <String> with the file path of the receiver's position file "
	
	^ positionsFileName
]

{ #category : #accessing }
BioLAMPLDWrapper >> positionsFileName: aString [
	" Set the receiver's position file to aString file path "

	positionsFileName := aString
]

{ #category : #'accessing - private' }
BioLAMPLDWrapper >> propertySeparator [
	" Answer a <Character> with receiver's options separator "

	^ Character space
]

{ #category : #programs }
BioLAMPLDWrapper >> trainhmm [
	" Answer a <String> for program name "

	^ 'trainhmm'

]

{ #category : #programs }
BioLAMPLDWrapper >> unolanc [
	" Answer a <String> for program name for 3 admixed samples "
	" USAGE:: unolanc <win-size> <nr-founders> <SNP-file> <CEU-haps> <YRI-haps> <NA-haps> <ADMX-geno> <out-file> <trainedhmm> "

	^ 'unolanc'
]

{ #category : #programs }
BioLAMPLDWrapper >> unolanc2way [
	" Answer a <String> for program name for 2 admixed samples "
	" USAGE:: unolanc2way <win-size> <nr-founders> <SNP-file> <CEU-haps> <YRI-haps> <ADMX-geno> <out-file> "

	^ self class unolanc2way 
]

{ #category : #programs }
BioLAMPLDWrapper >> unolanc5way [
	" Answer a <String> for program name for 5 admixed samples "
	" USAGE:: unolanc5way <win-size> <nr-founders> <SNP-file> <ANC1-haps> <ANC2-haps> <ANC3-haps>  <ANC4-haps> <ANC5-haps> <ADMX-geno> <out-file> "

	^ 'unolanc5way'
]

{ #category : #accessing }
BioLAMPLDWrapper >> url [
	" Private - See superimplementor's comment "

	^ 'http://bogdan.bioinformatics.ucla.edu/software/lamp/'
]

{ #category : #options }
BioLAMPLDWrapper >> windowSize: aNumber [
	" Configure receiver's window size "

	self parameters at: 1 put: aNumber asString
]

{ #category : #accessing }
BioLAMPLDWrapper >> windowSizes [
	" Answer an <Interval> used to run the receiver through several window sizes "

	^ windowSizes
]

{ #category : #options }
BioLAMPLDWrapper >> windowSizes: anInterval [
	" Configure receiver's window size "

	windowSizes := anInterval
]
