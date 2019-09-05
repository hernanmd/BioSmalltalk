"
Abstract superclass for specific genome downloaders

Instance Variables
	chr:		<Integer>


"
Class {
	#name : #BioNCBIGenomeDownloader,
	#superclass : #BioNCBIDownloader,
	#instVars : [
		'chr',
		'organismName',
		'version',
		'downloadFormats',
		'chromosomes',
		'fileListPrefix',
		'chrZeroPrefixed',
		'chrDirZeroPrefixed'
	],
	#category : 'BioNCBI-Genomes'
}

{ #category : #testing }
BioNCBIGenomeDownloader class >> isAlternative [

	^ false
]

{ #category : #'download - formats' }
BioNCBIGenomeDownloader >> asnFormatExtension [
	" Answer a <String> with the extension of ASN.1 file "

	^ '.asn.gz'



]

{ #category : #accessing }
BioNCBIGenomeDownloader >> beChrDirNotZeroPrefixed [
	" Set a <Boolean> specifying if chromosome numbers are prefixed with 0 "

	^ chrDirZeroPrefixed := false
]

{ #category : #accessing }
BioNCBIGenomeDownloader >> beChrDirZeroPrefixed [
	" Set a <Boolean> specifying if chromosome numbers directories are prefixed with 0 "

	^ chrDirZeroPrefixed := true
]

{ #category : #accessing }
BioNCBIGenomeDownloader >> beChrFileNotZeroPrefixed [
	" Set a <Boolean> specifying if chromosome numbers are prefixed with 0 "

	^ chrZeroPrefixed := false
]

{ #category : #accessing }
BioNCBIGenomeDownloader >> beChrFileZeroPrefixed [
	" Set a <Boolean> specifying if chromosome numbers are prefixed with 0 "

	^ chrZeroPrefixed := true
]

{ #category : #downloading }
BioNCBIGenomeDownloader >> buildFileList [
	" Private - Answer a <Collection> of files to download "

	self downloadFormats isEmpty 
		ifTrue: [ self downloadFormats: self defaultDownloadFormats ].
	^ self downloadFormats collect: [ : format |
		String streamContents: [ : stream | 
			stream
				nextPutAll: self fileListPrefix;
				nextPutAll: self version;
				nextPutAll: '_chr';
				nextPutAll: self chrAsString;
				nextPutAll: format ] ].
]

{ #category : #accessing }
BioNCBIGenomeDownloader >> chr [
	^ chr
]

{ #category : #accessing }
BioNCBIGenomeDownloader >> chr: anObject [
	chr := anObject
]

{ #category : #accessing }
BioNCBIGenomeDownloader >> chrAsString [
	" Private - Adapt because NCBI store directories as 01,02,...22 "
	
	(#('X' 'x' 'Y' 'y' 'MT' 'mt' 'Un' 'UN' 'un') includes: self chr) 
		ifTrue: [ ^ self chr asString ].
	^ ((self chr between: 1 and: 9) and: [ self isChrZeroPrefixed ])
		ifTrue: [ '0' , self chr asString ]
		ifFalse: [ self chr asString ]
]

{ #category : #accessing }
BioNCBIGenomeDownloader >> chrDirAsString [
	" Private - Adapt because NCBI store directories as 01,02 "
	
	(#('X' 'x' 'Y' 'y' 'MT' 'mt' 'Un' 'UN' 'un') includes: self chr) 
		ifTrue: [ ^ self chr asString ].
	^ ((self chr between: 1 and: 9) and: [ self isChrDirZeroPrefixed ])
		ifTrue: [ '0' , self chr asString ]
		ifFalse: [ self chr asString ]
]

{ #category : #accessing }
BioNCBIGenomeDownloader >> chromosomes [
	" Answer a <Collection> of <String> each one representing a chromosome name to download "

	^ chromosomes
		ifNil: [ chromosomes := self defaultChromosomes ]

]

{ #category : #accessing }
BioNCBIGenomeDownloader >> chromosomes: anObject [
	^ chromosomes := anObject
]

{ #category : #defaults }
BioNCBIGenomeDownloader >> defaultChromosomes [

	^ 1 to: self maxChr

]

{ #category : #defaults }
BioNCBIGenomeDownloader >> defaultDirectory [
	" Answer a <String> with the receiver's server directory to CWD "
	
	^ String streamContents: [ : stream |
			stream
				nextPutAll: 'genomes/';
				nextPutAll: self organismName;
				nextPutAll: '/CHR_';
				nextPutAll: self chrDirAsString ]

]

{ #category : #defaults }
BioNCBIGenomeDownloader >> defaultDownloadFormats [
	" By default we download all types of formats found in the NCBI's FTP "

	^ { 
		self fastaFormatExtension .
		self gbkFormatExtension .
		self asnFormatExtension .
		self gbsFormatExtension .
		self mfaFormatExtension 
		}

]

{ #category : #defaults }
BioNCBIGenomeDownloader >> defaultFileListPrefix [

	self subclassResponsibility 

]

{ #category : #downloading }
BioNCBIGenomeDownloader >> downloadAllChromosomes [
	" Download all chromosomes found for the receiver "

	[ 
		self chromosomes
			do: [ : chrNum | 
				self chr: chrNum.
				self connectionSettings serverDirectory: self defaultDirectory.
				self download ]
			displayingProgress: 'Downloading all chromosomes for ' , self organismName
	]
		forkAt: Processor userBackgroundPriority 
		named: 'Downloading all chromosomes...' 
]

{ #category : #downloading }
BioNCBIGenomeDownloader >> downloadChromosome: chrString [
	" Download the chromosome number chrNumber in the current directory "

	self chr: chrString.
	[ 
		self connectionSettings serverDirectory: self defaultDirectory.
		self download 
	]
	 	forkAt: Processor userBackgroundPriority 
 		named: 'Downloading ' , self organismName , ' chromosome ' , self chrAsString.

]

{ #category : #downloading }
BioNCBIGenomeDownloader >> downloadChromosomes: chrInterval [
	" Download the chromosome number chrNumber in the current directory "

	[ 
		chrInterval 
			do: [ : chrId | 		
				self chr: chrId.			
				self connectionSettings serverDirectory: self defaultDirectory.
				self download  ]
			displayingProgress: 'Downloading ' , self organismName , ' chromosomes...' 
	]
 		forkAt: Processor userBackgroundPriority 
		named: 'Downloading ' , self organismName , ' chromosome '
]

{ #category : #downloading }
BioNCBIGenomeDownloader >> downloadFormats [
	" Answer a <Collection> of <String> with file formats to be downloaded "
	
	^ downloadFormats
		ifNil: [ downloadFormats := OrderedCollection new ]

]

{ #category : #downloading }
BioNCBIGenomeDownloader >> downloadFormats: aCollection [
	" Set the receiver's with aCollection containing <String> with download file formats "

	^ downloadFormats := aCollection
]

{ #category : #'download - formats' }
BioNCBIGenomeDownloader >> fastaFormatExtension [

	^ '.fa.gz'

]

{ #category : #downloading }
BioNCBIGenomeDownloader >> fileListPrefix [
	" Set a <String> with the prefix of the files to be downloaded "

	^ fileListPrefix
		ifNil: [ fileListPrefix := self defaultFileListPrefix ]

]

{ #category : #downloading }
BioNCBIGenomeDownloader >> fileListPrefix: prefixString [
	" Set a <String> with the prefix of the files to be downloaded "

	^ fileListPrefix := prefixString

]

{ #category : #downloading }
BioNCBIGenomeDownloader >> filesToDownload [
	" Answer a Collection with the files to download "

	^ self connect
		ifNotNil: [ :arg | self buildFileList ]
		ifNil: [ self informMessage: 'Connection failed' translated ]
]

{ #category : #'download - formats' }
BioNCBIGenomeDownloader >> gbkFormatExtension [
	" Answer a <String> with the extension of GenBank flat file format (annotation + sequence), compressed "

	^ '.gbk.gz'



]

{ #category : #'download - formats' }
BioNCBIGenomeDownloader >> gbsFormatExtension [
	" Answer a <String> with the extension of GenBank summary file format (annotation only), compressed ."

	^ '.gbs.gz'

]

{ #category : #initialization }
BioNCBIGenomeDownloader >> initialize [
	" Private - Initialize receiver's settings "
	
	super initialize.
	forceDownload := false.
	checkMD5 := false.
	self beChrFileZeroPrefixed.
	self beChrDirZeroPrefixed.
	self connectionSettings
			user: self defaultUser;
			password: self defaultPassword;
			serverAddress: self defaultServerName
]

{ #category : #testing }
BioNCBIGenomeDownloader >> isChrDirZeroPrefixed [
	" Answer a <Boolean> specifying if chromosome numbers are prefixed with 0 "

	^ chrDirZeroPrefixed
]

{ #category : #testing }
BioNCBIGenomeDownloader >> isChrZeroPrefixed [
	" Answer a <Boolean> specifying if chromosome numbers are prefixed with 0 "

	^ chrZeroPrefixed
]

{ #category : #accessing }
BioNCBIGenomeDownloader >> isUpdated: fileName [
	" Answer <true> if modification time of remote fileName is newer than modification time of receiver's copy of fileName "

	| fullName |
		
	fullName := (FileSystem workingDirectory / fileName) fullName.
	^ (self fileExists: fullName)
		and: [ (self openFileNamed: fileName) directoryEntry modificationTime < (self client getMdtm: fileName) ]
]

{ #category : #accessing }
BioNCBIGenomeDownloader >> latestVersionFound [
	" Answer a <String> with the receiver's latest found version in remote database "

	self subclassResponsibility 
]

{ #category : #accessing }
BioNCBIGenomeDownloader >> maxChr [
	" Answer maximum number of chromosomes for the receiver "

	^ self class maxChr
]

{ #category : #'download - formats' }
BioNCBIGenomeDownloader >> mfaFormatExtension [
	" Answer a <String> with the extension of masked FASTA file format, compressed."

	^ '.mfa.gz'

]

{ #category : #accessing }
BioNCBIGenomeDownloader >> organismName [
	" Answer a <String> with the receiver's organism name in the target database "
	
	^ organismName
]

{ #category : #accessing }
BioNCBIGenomeDownloader >> organismName: aString [
	" Set the receiver's organism name to aString "
	
	organismName := aString
]

{ #category : #'download - formats' }
BioNCBIGenomeDownloader >> setDownloadASN1 [
	" Set the receiver to download the ASN.1 format files "
	
	self downloadFormats add: self asnFormatExtension
]

{ #category : #'download - formats' }
BioNCBIGenomeDownloader >> setDownloadFasta [
	" Set the receiver to download the FASTA format files "
	
	self downloadFormats add: self fastaFormatExtension
]

{ #category : #'download - formats' }
BioNCBIGenomeDownloader >> setDownloadGBK [
	" Set the receiver to download the GBK format files "
	
	self downloadFormats add: self gbkFormatExtension
]

{ #category : #'download - formats' }
BioNCBIGenomeDownloader >> setDownloadGBS [
	" Set the receiver to download the GBS format files "
	
	self downloadFormats add: self gbsFormatExtension
]

{ #category : #'download - formats' }
BioNCBIGenomeDownloader >> setDownloadMFA [
	" Set the receiver to download the MFA format files "
	
	self downloadFormats add: self mfaFormatExtension
]

{ #category : #accessing }
BioNCBIGenomeDownloader >> version [
	" Answer a <String>. Specific to versioned genomes file names "
	
	^ version
		ifNil: [ version := self latestVersionFound ]
]

{ #category : #accessing }
BioNCBIGenomeDownloader >> version: aString [
	" Set a <String>. Specific to versioned genomes file names "
	
	^ version := aString
]
