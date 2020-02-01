"
Abstract superclass for downloading Genomes from the NCBI FTP servers. 
Subclasses implement specific organism genome downloaders.




"
Class {
	#name : #BioNCBIGenomeDownloader,
	#superclass : #BioNCBIDownloader,
	#instVars : [
		'organismName',
		'version',
		'downloadFormats',
		'fileListPrefix'
	],
	#category : #'BioNCBI-Genomes'
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

{ #category : #downloading }
BioNCBIGenomeDownloader >> buildFileList [
	" Private - Answer a <Collection> of files to download appending formats to each file name "

	self downloadFormats isEmpty and: [ self downloadFormats: self defaultDownloadFormats ].
	^ self downloadFormats collect: [ : format |
		String streamContents: [ : stream | 
			stream
				nextPutAll: self buildFilePath;
				nextPutAll: format ] ].
]

{ #category : #downloading }
BioNCBIGenomeDownloader >> buildFilePath [
	" Answer a <String> representing the path to the file to download "

	self subclassResponsibility 
]

{ #category : #defaults }
BioNCBIGenomeDownloader >> defaultCDSDownloadFormats [
	" By default we download all types of formats found in the NCBI's FTP "

	^ 	{ 
			self featureCDSFromGenomicFormatExtension .
			self featureCDSTranslatedFormatExtension
		}

]

{ #category : #defaults }
BioNCBIGenomeDownloader >> defaultDirectory [
	" Answer a <String> with the receiver's server directory to CWD "
	
	^ 'genomes/'

]

{ #category : #defaults }
BioNCBIGenomeDownloader >> defaultDownloadFormats [
	" By default we download all types of formats found in the NCBI's FTP "

	^ Array streamContents: [ : stream |
		stream nextPutAll: self defaultGenomicDownloadFormats]

]

{ #category : #defaults }
BioNCBIGenomeDownloader >> defaultFeaturesDownloadFormats [
	" By default we download all types of formats found in the NCBI's FTP "

	^ 	{ 
			self featureTableFormatExtension .
			self featureCountFormatExtension
		}

]

{ #category : #defaults }
BioNCBIGenomeDownloader >> defaultFileListPrefix [

	self subclassResponsibility 

]

{ #category : #defaults }
BioNCBIGenomeDownloader >> defaultGenomicDownloadFormats [
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
BioNCBIGenomeDownloader >> defaultProteinDownloadFormats [
	" By default we download all types of formats found in the NCBI's FTP "

	^ Array empty

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

{ #category : #defaults }
BioNCBIGenomeDownloader >> featureCDSFromGenomicFormatExtension [

	^ '_cds_from_genomic.fna.gz'
]

{ #category : #defaults }
BioNCBIGenomeDownloader >> featureCDSTranslatedFormatExtension [

	^ '_translated_cds.faa.gz'

]

{ #category : #defaults }
BioNCBIGenomeDownloader >> featureCountFormatExtension [

	^ '_feature_count.txt.gz'

]

{ #category : #'download - formats' }
BioNCBIGenomeDownloader >> featureTableFormatExtension [

	^ '_feature_table.txt.gz'

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

{ #category : #defaults }
BioNCBIGenomeDownloader >> gbffFormatExtension [

	^ '_genomic.gbff.gz'
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

{ #category : #defaults }
BioNCBIGenomeDownloader >> gffFormatExtension [

	^ '_genomic.gff.gz'
]

{ #category : #defaults }
BioNCBIGenomeDownloader >> gpffFormatExtension [

	^ '_protein.gpff'
]

{ #category : #defaults }
BioNCBIGenomeDownloader >> gtfFormatExtension [

	^ '_genomic.gtf.gz'
]

{ #category : #initialization }
BioNCBIGenomeDownloader >> initialize [
	" Private - Initialize receiver's settings "
	
	super initialize.
	forceDownload := false.
	checkMD5 := false.
	self connectionSettings
			user: self defaultUser;
			password: self defaultPassword;
			serverAddress: self defaultServerName
]

{ #category : #accessing }
BioNCBIGenomeDownloader >> isUpdated: fileName [
	" Answer <true> if modification time of remote fileName is newer than modification time of receiver's copy of fileName "

	| fullName |
		
	fullName := (FileSystem workingDirectory / fileName) fullName.
	^ (self fileExists: fullName) and: [ fileName asFileReference modificationTime < (self client getMdtm: fileName) ]
]

{ #category : #accessing }
BioNCBIGenomeDownloader >> latestVersionFound [
	" Answer a <String> with the receiver's latest found version in remote database "

	self subclassResponsibility 
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
