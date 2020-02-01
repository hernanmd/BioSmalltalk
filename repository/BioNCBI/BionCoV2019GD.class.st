"
One-liner to download the latest build of the nCoV-2019 genome.
Genome files are currently downloaded on the Pharo image directory.

Usage Example:

BionCoV2019GD new download.
"
Class {
	#name : #BionCoV2019GD,
	#superclass : #BioNCBIGenomeDownloader,
	#category : #'BioNCBI-Genomes'
}

{ #category : #downloading }
BionCoV2019GD >> buildFilePath [
	" Private - See superimplementor's comment "

	^ self fileListPrefix
]

{ #category : #defaults }
BionCoV2019GD >> defaultDirectory [
	" Answer a <String> with the receiver's server directory to CWD "
	
	^ 'genomes/refseq/viral/Wuhan_seafood_market_pneumonia_virus/latest_assembly_versions/GCF_009858895.2_ASM985889v3/'

]

{ #category : #defaults }
BionCoV2019GD >> defaultDownloadFormats [
	" By default we download all types of formats found in the NCBI's FTP "

	^ Array streamContents: [ : stream |
		stream 
			nextPutAll: self defaultGenomicDownloadFormats;
			nextPutAll: self defaultProteinDownloadFormats;
			nextPutAll: self defaultFeaturesDownloadFormats;
			nextPutAll: self defaultCDSDownloadFormats ]

]

{ #category : #defaults }
BionCoV2019GD >> defaultFileListPrefix [
	" Private - See superimplementor's comment "
	
	^ 'GCF_009858895.2_ASM985889v3'.

]

{ #category : #defaults }
BionCoV2019GD >> defaultGenomicDownloadFormats [
	" By default we download all types of formats found in the NCBI's FTP "

	^ { 
		self fastaFormatExtension .
		self gbffFormatExtension .
		self gffFormatExtension .
		self gtfFormatExtension
		}

]

{ #category : #downloading }
BionCoV2019GD >> download [

	self connectionSettings serverDirectory: self defaultDirectory.
	super download
]

{ #category : #accessing }
BionCoV2019GD >> fastaFormatExtension [

	^ '_genomic.fna.gz'
]
