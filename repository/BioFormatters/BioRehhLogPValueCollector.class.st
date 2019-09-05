"
Depends on NeoCSV package to read the input files.

Input file name : iHS or Rsb exported from rehh functions,

Can dump to UCSC bed file format, to input in the Genome Browser ""add custom track"".

    Implementation Points
"
Class {
	#name : #BioRehhLogPValueCollector,
	#superclass : #BioFileFormatter,
	#instVars : [
		'logpCol',
		'gpeaks',
		'nbases',
		'ylim',
		'bedFormatter',
		'chrNumber'
	],
	#category : #'BioFormatters-Formatters'
}

{ #category : #examples }
BioRehhLogPValueCollector class >> example01 [

	26 to: 29 do: [ :chrNumber | 

		| inputFilename outputFilename |
		inputFilename := 'chr_' , chrNumber asString , '_-test.brang.brah.rsb.txt'.
		outputFilename := 'brang.brah.peaks_chr' , chrNumber asString , '.bed'.

		BioRehhLogPValueCollector new
			cwd: (BioObject testFilesFullDirectoryName / 'rehh') fullName;
			ylim: 2.0;
			nbases: 1000000;
			chrNumber: chrNumber;
			inputFile: inputFilename;
			outputFilename: outputFilename;
			collectPeaks;
			dumpAsUCSCBedFile ]
]

{ #category : #examples }
BioRehhLogPValueCollector class >> example02 [

	26 to: 29 do: [ :chrNumber | 

		| inputFilename outputFilename |
		inputFilename := 'chr_' , chrNumber asString , '_-test.brang.brah.rsb.txt'.
		outputFilename := 'brang.brah.peaks_chr' , chrNumber asString , '.bed'.

		BioRehhLogPValueCollector new
			cwd: (BioObject testFilesFullDirectoryName / 'rehh') fullName;
			ylim: 2.0;
			nbases: 1000000;
			chrNumber: chrNumber;
			inputFile: inputFilename;
			outputFilename: outputFilename;
			collectPeaks;
			dumpAsEnsembleBedFile ]
]

{ #category : #examples }
BioRehhLogPValueCollector class >> example03 [

	26 to: 29 do: [ :chrNumber | 

		| inputFilename outputFilename |
		inputFilename := 'chr_' , chrNumber asString , '_-test.brang.brah.rsb.txt'.
		outputFilename := 'brang.brah.peaks_chr' , chrNumber asString , '.bed'.

		BioRehhLogPValueCollector new
			cwd: (BioObject testFilesFullDirectoryName / 'rehh') fullName;
			ylim: 2.0;
			nbases: 1000000;
			chrNumber: chrNumber;
			inputFile: inputFilename;
			outputFilename: outputFilename;
			collectPeaks;
			dumpAsEnsembleBedFileBothStrands ]
]

{ #category : #accessing }
BioRehhLogPValueCollector >> bedFormatter [
	^ bedFormatter
		ifNil: [ bedFormatter := BioBEDFormatter new ]
]

{ #category : #accessing }
BioRehhLogPValueCollector >> bedFormatter: anObject [
	bedFormatter := anObject
]

{ #category : #accessing }
BioRehhLogPValueCollector >> chrNumber [
	^ chrNumber
]

{ #category : #accessing }
BioRehhLogPValueCollector >> chrNumber: anObject [
	chrNumber := anObject
]

{ #category : #private }
BioRehhLogPValueCollector >> collectLogPPeaks [

	| index lpstart |
	
	self gpeaks: OrderedCollection new.
	index := 1.
	[ index + 1 = self logpCol size ] whileFalse: [ 
		| pend pstart |
		pend := self logpCol at: index + 1.
		pstart := self logpCol at: index.
		(pend third asNumber - pstart third asNumber > self nbases)
			ifTrue: [ 
				lpstart ifNil: [ 
					self gpeaks add: pstart.
					lpstart := pstart second ].			
				self gpeaks add: pend ]
			ifFalse: [ lpstart := nil ].
		index := index + 1 ].
]

{ #category : #private }
BioRehhLogPValueCollector >> collectLogPValues [
	" For each SNP in the input file, build a <Collection> with valid (not null) -log10(p-value) which are greater than configured ylim value "

	self logpCol: (self inputFile asFileReference readStreamDo: [ : aStream |
		(NeoCSVReader on: aStream)
			separator: Character space;
			skipHeader;
			select: [ : record | record fourth notNil and: [ record fourth ~= 'NA' and: [ record fourth asFloat >= self ylim ] ] ] ]).
]

{ #category : #private }
BioRehhLogPValueCollector >> collectPeaks [
	" See class comments "

	self 
		collectLogPValues;
		collectLogPPeaks
]

{ #category : #private }
BioRehhLogPValueCollector >> dumpAsEnsembleBedFile [

	| chrStr |
	
	chrStr := 'chr' , self chrNumber asString.
	self bedFormatter
		outputFilename: self outputFilename;
		addCTrackName: chrStr;
		addCTrackVisibility: 2;
		setItemRgbOn;
		dumpHeaders.
	self dumpUCSCBedPeaks: chrStr
]

{ #category : #private }
BioRehhLogPValueCollector >> dumpAsEnsembleBedFileBothStrands [

	| chrStr index |
	chrStr := 'chr' , self chrNumber asString.
	self bedFormatter 
		outputFilename: self outputFilename;
		addCTrackName: chrStr;
		addCTrackVisibility: 2;
		addCTrackColorByStrand: { 100 . 50 . 25 . 150 . 200 . 250 };
		setItemRgbOn;
		dumpHeaders.
	index := 1.
	self gpeaks pairsDo: [ : s : e |
		self bedFormatter 
			addCFChr: chrStr start: s third end: e third;
			addCFName: 'PR_' , index asString;			
			addCFScore: 960;
			addCFStrand: $+;
			nextPutTerminator.
		index := index + 1.			
		self bedFormatter 
			addCFChr: chrStr start: s third end: e third;
			addCFName: 'PR_' , index asString;			
			addCFScore: 960;
			addCFStrand: $-;
			nextPutTerminator.
		index := index + 1 ].
	self bedFormatter flush.
]

{ #category : #private }
BioRehhLogPValueCollector >> dumpAsUCSCBedFile [

	| chrStr |
	chrStr := 'chr' , self chrNumber asString.
	self bedFormatter 
		outputFilename: self outputFilename;
		setCTrackBrowserShowAll;
		addCTrackName: chrStr;
		addCTrackVisibility: 2;
		setItemRgbOn;
		dumpHeaders.
	self dumpUCSCBedPeaks: chrStr
]

{ #category : #private }
BioRehhLogPValueCollector >> dumpUCSCBedPeaks: chrStr [

	| index |
	index := 1.
	self gpeaks pairsDo: [ : s : e |
		self bedFormatter 
			addCFChr: chrStr start: s third end: e third;
			addCFName: 'PR_' , index asString;
			addCFScore: 960;
			addCFStrand: $+;
			nextPutTerminator.
		index := index + 1 ].
	self bedFormatter flush.
]

{ #category : #accessing }
BioRehhLogPValueCollector >> gpeaks [
	^ gpeaks
]

{ #category : #accessing }
BioRehhLogPValueCollector >> gpeaks: anObject [
	gpeaks := anObject
]

{ #category : #accessing }
BioRehhLogPValueCollector >> logpCol [
	^ logpCol
]

{ #category : #accessing }
BioRehhLogPValueCollector >> logpCol: anObject [
	logpCol := anObject
]

{ #category : #accessing }
BioRehhLogPValueCollector >> nbases [
	^ nbases
]

{ #category : #accessing }
BioRehhLogPValueCollector >> nbases: anObject [
	nbases := anObject
]

{ #category : #accessing }
BioRehhLogPValueCollector >> ylim [
	^ ylim
]

{ #category : #accessing }
BioRehhLogPValueCollector >> ylim: anObject [
	ylim := anObject
]
