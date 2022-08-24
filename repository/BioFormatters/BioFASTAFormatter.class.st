"
Format writer for FASTA objects. See class side for examples


"
Class {
	#name : #BioFASTAFormatter,
	#superclass : #BioFileFormatter,
	#category : #'BioFormatters-Formatters-FASTA'
}

{ #category : #accessing }
BioFASTAFormatter class >> description [
	" See superimplementor's comment "
	
	^ 'FASTA Writer'
]

{ #category : #examples }
BioFASTAFormatter class >> example01 [
	" The following example shows how to create a collection of fasta records and write them to a FASTA timestamped file "

	| fastaCollection |
	fastaCollection := BioFastaMultiRecord new
		addFastaRecord: (BioFastaRecord named: 'seqA' sequence: 'TACGAGAATAATTTCTCATCATCCAGCTTTAACACAAAATTCGCA');
		addFastaRecord: (BioFastaRecord named: 'seqB' sequence: 'CAGTTTTCGTTAAGAGAACTTAACATTTTCTTATGACGTAAATGA');
		addFastaRecord: (BioFastaRecord named: 'seqC' sequence: 'GAACTTAACATTTTCTTATGACGTAAATGAAGTTTATATATAAATTTCCTTTTTATTGGA
TAATATGCCTATGCCGCATAATTTTTATATCTTTCTCCTAACAAAACATTCGCTTGTAAA');
		yourself.
	BioFASTAFormatter new exportFrom: fastaCollection sequences.
]

{ #category : #accessing }
BioFASTAFormatter class >> formatExtension [
	"Answer a <String> corresponding for the receiver's file output format"

	^ 'fasta'
]

{ #category : #accessing }
BioFASTAFormatter class >> identifiers [
	"Answer a <Collection> of identifiers of the receiver"
	
	^ #('FASTA')
]

{ #category : #exporting }
BioFASTAFormatter >> dumpFeatureData: featureDictionary groupingFeature: aString [ 

	self stream 
		nextPut: $>;
		nextPutAll: (featureDictionary at: BioGBSeqCollection qualifierForAccessionWithVersion);
		bioCr;
		nextPutAll: (featureDictionary at: BioGBSeqCollection qualifierForAlignedSequence);
		bioCr
]

{ #category : #accessing }
BioFASTAFormatter >> exportFrom: aCollectionOrStream [
	" Write aCollection to the receiver's output file name "

	| outStream |
	self flag: #needsWork.
	aCollectionOrStream isString
		ifFalse: [ 
			outStream := WriteStream on: String new.
			(BioFastaMultiRecord from: aCollectionOrStream contents)
				dumpToStream: outStream ]
		ifTrue: [ outStream := aCollectionOrStream ].
	self 
		dumpToFileNamedFullPath: self outputFilename 
		contents: outStream contents

]

{ #category : #exporting }
BioFASTAFormatter >> exportFromBLAST: hitCollection [
	" Write a time-stamped file in the receiver's format from hitCollecction "
	
	| blastAlignLength |
	
	blastAlignLength := hitCollection first alignLength asNumber.
	stream := WriteStream on: (String new: (hitCollection size + 1) * (blastAlignLength + 1)).	
	hitCollection do: [: hitNode |
		stream 
			nextPut: $>;
			nextPutAll: hitNode hitDefinition;
			cr.
		hitNode hSequence do: [: letter |	stream nextPut: letter ].
		stream bioCr ].
	
	self dumpToFileNamed: self outputFilename contents: stream contents

]

{ #category : #exporting }
BioFASTAFormatter >> exportFromIlluminaAlleleReport: aFilename [
	"Write a time-stamped file in the receiver's format from aFilename"
	
	| fs |
	
	parser := self parserClass on: aFilename asFileReference readStream.
	parser 
		skipHeader; 
		delimiter: $;.
	fs := self newFileNamed: self outputFilename.

	parser do: [: row |
		fs 
			nextPut: $>;
			nextPutAll: row first;
			nextPut: $|;
			nextPutAll: row third;
			nextPut: $|;
			nextPutAll: row fourth;
			cr.
		row fifth do: [: letter | fs nextPut: letter ].
		fs bioCr ].
	fs close.
]

{ #category : #accessing }
BioFASTAFormatter >> exportFromReader: aBioReader [
	" Export recceiver to a file using aBioReader "

	self exportFrom: aBioReader itemsAsFasta. " collectHits "

]

{ #category : #accessing }
BioFASTAFormatter >> fileNamePrefix [
	" Answer a String for prefixing the output file name "
	
	^ 'BioST-Exported-FASTA_'
]

{ #category : #accessing }
BioFASTAFormatter >> formatExtension [
	"Answer a <String> corresponding for the receiver's file output format"

	^ 'fa'

]

{ #category : #exporting }
BioFASTAFormatter >> parserClass [

	^ NeoCSVReader 
]

{ #category : #'initialize-release' }
BioFASTAFormatter >> sizeFrom: collection [

	^  collection sum: [: d | d sum: #size ]
]

{ #category : #accessing }
BioFASTAFormatter >> validate: aCollection [ 
	" See superimplementor's comment "
	
	isValid := aCollection allSatisfy: #isValidForFastaFormat.
	super validate: aCollection

	
]

{ #category : #accessing }
BioFASTAFormatter >> writeClassifiedRowsFrom: data [
	" Private - Assume data is a <Dictionary> with each Association a pair <String> -> <OrderedCollection>
	features contain all possible features in data. if data at specific feature is absent, then use a dash to specify null value "

	data associationsDo: [: assoc |
		assoc value do: [ : dict | 
			self dumpFeatureData: dict groupingFeature: assoc key ] ].
]
