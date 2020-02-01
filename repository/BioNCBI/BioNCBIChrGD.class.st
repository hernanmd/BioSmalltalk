"
Astract superclass with behavior for downloading Genomes with chromosomes.

"
Class {
	#name : #BioNCBIChrGD,
	#superclass : #BioNCBIGenomeDownloader,
	#instVars : [
		'chromosomes',
		'chr',
		'chrDirZeroPrefixed',
		'chrZeroPrefixed'
	],
	#category : #'BioNCBI-Genomes'
}

{ #category : #accessing }
BioNCBIChrGD >> beChrDirNotZeroPrefixed [
	" Set a <Boolean> specifying if chromosome numbers are prefixed with 0 "

	^ chrDirZeroPrefixed := false
]

{ #category : #accessing }
BioNCBIChrGD >> beChrDirZeroPrefixed [
	" Set a <Boolean> specifying if chromosome numbers directories are prefixed with 0 "

	^ chrDirZeroPrefixed := true
]

{ #category : #accessing }
BioNCBIChrGD >> beChrFileNotZeroPrefixed [
	" Set a <Boolean> specifying if chromosome numbers are prefixed with 0 "

	^ chrZeroPrefixed := false
]

{ #category : #accessing }
BioNCBIChrGD >> beChrFileZeroPrefixed [
	" Set a <Boolean> specifying if chromosome numbers are prefixed with 0 "

	^ chrZeroPrefixed := true
]

{ #category : #downloading }
BioNCBIChrGD >> buildFilePath [

	^ String streamContents: [ : stream |
		stream
			nextPutAll: self fileListPrefix;
			nextPutAll: self version;
			nextPutAll: '_chr';
			nextPutAll: self chrAsString ]

]

{ #category : #accessing }
BioNCBIChrGD >> chr [
	^ chr
]

{ #category : #accessing }
BioNCBIChrGD >> chr: anObject [
	chr := anObject
]

{ #category : #accessing }
BioNCBIChrGD >> chrAsString [
	" Private - Adapt because NCBI store directories as 01,02,...22 "
	
	(#('X' 'x' 'Y' 'y' 'MT' 'mt' 'Un' 'UN' 'un') includes: self chr) 
		ifTrue: [ ^ self chr asString ].
	^ ((self chr between: 1 and: 9) and: [ self isChrZeroPrefixed ])
		ifTrue: [ '0' , self chr asString ]
		ifFalse: [ self chr asString ]
]

{ #category : #accessing }
BioNCBIChrGD >> chrDirAsString [
	" Private - Adapt because NCBI store directories as 01,02 "
	
	(#('X' 'x' 'Y' 'y' 'MT' 'mt' 'Un' 'UN' 'un') includes: self chr) 
		ifTrue: [ ^ self chr asString ].
	^ ((self chr between: 1 and: 9) and: [ self isChrDirZeroPrefixed ])
		ifTrue: [ '0' , self chr asString ]
		ifFalse: [ self chr asString ]
]

{ #category : #accessing }
BioNCBIChrGD >> chromosomes [
	" Answer a <Collection> of <String> each one representing a chromosome name to download "

	^ chromosomes
		ifNil: [ chromosomes := self defaultChromosomes ]

]

{ #category : #accessing }
BioNCBIChrGD >> chromosomes: anObject [
	^ chromosomes := anObject
]

{ #category : #defaults }
BioNCBIChrGD >> defaultChromosomes [

	^ 1 to: self maxChr

]

{ #category : #defaults }
BioNCBIChrGD >> defaultDirectory [
	" Answer a <String> with the receiver's server directory to CWD "
	
	^ String streamContents: [ : stream |
			stream
				nextPutAll: super defaultDirectory;
				nextPutAll: self organismName;
				nextPutAll: '/CHR_';
				nextPutAll: self chrDirAsString ]

]

{ #category : #downloading }
BioNCBIChrGD >> downloadAllChromosomes [
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
BioNCBIChrGD >> downloadChromosome: chrString [
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
BioNCBIChrGD >> downloadChromosomes: chrInterval [
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

{ #category : #initialization }
BioNCBIChrGD >> initialize [
	" Private - See superimplementor's comment "

	self beChrFileZeroPrefixed.
	self beChrDirZeroPrefixed.
]

{ #category : #testing }
BioNCBIChrGD >> isChrDirZeroPrefixed [
	" Answer a <Boolean> specifying if chromosome numbers are prefixed with 0 "

	^ chrDirZeroPrefixed
]

{ #category : #testing }
BioNCBIChrGD >> isChrZeroPrefixed [
	" Answer a <Boolean> specifying if chromosome numbers are prefixed with 0 "

	^ chrZeroPrefixed
]

{ #category : #accessing }
BioNCBIChrGD >> maxChr [
	" Answer maximum number of chromosomes for the receiver "

	^ self class maxChr
]
