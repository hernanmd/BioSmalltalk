"
A BioFastaMultiRecord represents multiple FASTA sequence records and enables to perform operations on them as a whole.

Instance Variables
	sequences:		<Collection of BioFastaRecord>


"
Class {
	#name : #BioFastaMultiRecord,
	#superclass : #BioNamedObject,
	#instVars : [
		'records'
	],
	#category : #'BioTools-Core'
}

{ #category : #examples }
BioFastaMultiRecord class >> examplePlotHistogram [

	(BioParser parseMultiFastaFile: BioObject testFilesFullDirectoryName / 'ls_orchid.fasta') 
		plotHistogramBins: 20 
		xAxisLabel: 'Sequence lengths (bp)'
		yAxisLabel: 'Count' 
		color: Color red
]

{ #category : #'instance creation' }
BioFastaMultiRecord class >> from: aCollection [
	" Answer a new instance of the receiver with records taken from aCollection "
	
	^ self new initializeWith: aCollection
]

{ #category : #comparing }
BioFastaMultiRecord >> = aFastaMultiRecord [
	" Two multi fasta are equal if
	 (a) they are the same 'kind' of thing.
	 (b) they have the same name.
	 (c) for each fasta record, they have the same sequences in the same order "
	
	self == aFastaMultiRecord ifTrue: [ ^ true ].
	self class = aFastaMultiRecord class ifFalse: [ ^ false ].
	self size = aFastaMultiRecord size ifFalse: [ ^ false ] .
	self records with: aFastaMultiRecord records do: [ : record1 : record2 |
		record1 = record2 ifFalse: [ ^ false ] ].
	^ true
]

{ #category : #accessing }
BioFastaMultiRecord >> addFastaRecord: aBioFastaRecord [
	" Add aBioFastaRecord to the receiver. "
	
	self records add: aBioFastaRecord
]

{ #category : #alignment }
BioFastaMultiRecord >> alignWithMAFFTTo: outputFilename [

	^ BioMAFFTWrapper new 
		auto;
		maxiterate: 1000;
		input: self;
		addOutputParameter: outputFilename;
		execute.
]

{ #category : #accessing }
BioFastaMultiRecord >> alphabet: aBioAlphabetClass [
	" Set the receiver's fasta records alphabet to aBioAlphabetClass "
	
	^ self records do: [ : record | record alphabet: aBioAlphabetClass ]

]

{ #category : #converting }
BioFastaMultiRecord >> asAlignment [
	" Answer a <BioAlignment> representation of the receiver "
	
	| aln |
	
	aln := BioAlignment new.
	self do: [ : fastaRec | aln addFastaRecord: fastaRec ].
	^ aln
		 
]

{ #category : #alignment }
BioFastaMultiRecord >> asMAFFTWrapperInput: aBioMAFFTWrapper [

	self dumpToStream: 'in.tmp' asFileReference writeStream.
	aBioMAFFTWrapper addParameter: 'in.tmp'
]

{ #category : #converting }
BioFastaMultiRecord >> asString [
	" Answer the String representation of the receiver." 	
	
	^ String streamContents: [ : stream |
		self records do: [ : record | stream nextPutAll: record asString ] ]
]

{ #category : #alignment }
BioFastaMultiRecord >> average [
	"Answer a <Number> with the average length of sequences in the receiver"
	
	^ self length / self size
]

{ #category : #accessing }
BioFastaMultiRecord >> collect: aBlock [
	" Evaluate aBlock with each of the receiver's fasta record as the argument. "
	
	^ self records collect: aBlock
]

{ #category : #accessing }
BioFastaMultiRecord >> contents [
	" Answer the receiver's current records "

	^ self
]

{ #category : #accessing }
BioFastaMultiRecord >> do: aBlock [
	" Evaluate aBlock with each of the receiver's fasta record as the argument "
	
	self records do: aBlock
]

{ #category : #accessing }
BioFastaMultiRecord >> dumpToStream: aStream [
	" Private - Write the receiver's contents into aStream "
	
	self records dumpToStream: aStream
]

{ #category : #accessing }
BioFastaMultiRecord >> gcContent [
	" Answer a <Dictionary> with the FASTA identifier as key and the resulting GC content as value "
	
	^ (self collect: [ : fr | fr sequenceName ->  fr gcContent ]) asDictionary
]

{ #category : #accessing }
BioFastaMultiRecord >> groupedBySeqLength [
	" Answer a <Collection> of <BioFastaRecord> grouped by sequence length "
	
	^ self records groupedBy: #size
]

{ #category : #testing }
BioFastaMultiRecord >> hasGaps [
	" Answer <true> if any of the receiver's records contains any gap "
	
	^ self records anySatisfy: #hasGaps
]

{ #category : #testing }
BioFastaMultiRecord >> hasSameLength [
	" Answer <true> if all sequences in the receiver has the same size "
	
	| seqSize |
	seqSize := self sequences anyOne size.
	^ self sequences allSatisfy: [ : each | each size = seqSize ]
]

{ #category : #comparing }
BioFastaMultiRecord >> hash [
	" Private - hash is implemented because #= is implemented "

	^ self records hash bitXor: self size hash
]

{ #category : #comparing }
BioFastaMultiRecord >> includes: aFastaRecord [
	" Answer whether aFastaRecord is one of the receiver's elements. "
	
	^ self records includes: aFastaRecord
]

{ #category : #testing }
BioFastaMultiRecord >> includesName: aString [
	" Answer whether the receiver contains a sequence named aString. "
	
	^ self sequenceNames includes: aString
]

{ #category : #'initialize-release' }
BioFastaMultiRecord >> initializeWith: aCollection [
	" Private - Set the receiver's fasta records from aMultiFastaString "
	
	self records addAll: (aCollection collect: #asFastaRecord)

]

{ #category : #testing }
BioFastaMultiRecord >> isEmpty [
	" Answer whether the receiver contains any elements. "
	
	^ self records isEmpty
]

{ #category : #testing }
BioFastaMultiRecord >> isFastaMultiRecord [
	" See superimplementor's comment "

	^ true
]

{ #category : #testing }
BioFastaMultiRecord >> isSorted [
	" Answer <true> if the receiver is sorted by sequence name "
	
	^ self records isSorted
]

{ #category : #accessing }
BioFastaMultiRecord >> length [
	"Answer a <Number> representing the length of the total sequences combined in the receiver"
	
	^ self sequences sum: #length
]

{ #category : #comparing }
BioFastaMultiRecord >> like: aFastaMultiRecord [
	" Two multi fasta are alike if
	 (a) they are equal
	 (b) for each fasta record, they have the same sequences in any order "
	
	self 			== aFastaMultiRecord 			ifTrue: [ ^ true ].
	self class 	= aFastaMultiRecord class 	ifFalse: [ ^ false ].
	self size 	= aFastaMultiRecord size 	ifFalse: [ ^ false ] .
	self records allSatisfy: [ : record | aFastaMultiRecord includes: record ].
	^ true
]

{ #category : #accessing }
BioFastaMultiRecord >> molecularWeight [
	" Answer the receiver's DNA Molecular Weight "
	
	^ self collect: #molecularWeight
]

{ #category : #accessing }
BioFastaMultiRecord >> occurrencesOfLetters [
	" Answer a <Dictionary> of occurrence mappings for the receiver "
	
	^ (self collect: [ : fr | fr sequenceName ->  fr occurrencesOfLetters ]) asDictionary
]

{ #category : #plot }
BioFastaMultiRecord >> plotGcSkewInt [
	"Plot the receiver's sequences GC skew"

	| sequenceCharts canvas shapes |
	
	canvas := RSCanvas new.
	sequenceCharts := self sequences collect: [ : sequence |  sequence chartGcSkewInt ].
	shapes := RSGroup new.
	shapes addAll: sequenceCharts.
	RSGridLayout on: shapes.
	canvas @ RSCanvasController.
	^ canvas
]

{ #category : #printing }
BioFastaMultiRecord >> printOn: aStream [
	" Private - See superimplementor's comment "
	
	super printOn: aStream.
	aStream 
		nextPutAll: self size between: $( and: $).
]

{ #category : #accessing }
BioFastaMultiRecord >> records [
	" Answer a <Collection> of <BioFastaRecord> with the receiver's sequences "

	^ records
		ifNil: [ records := OrderedCollection new ]
]

{ #category : #accessing }
BioFastaMultiRecord >> records: anObject [
	records := anObject
]

{ #category : #accessing }
BioFastaMultiRecord >> renameFromDictionary: aDictionary [
	" Take aDictionary and rename each record accordingly "
	
	self do: [ : fastaRecord |
		| newName |
		newName := String streamContents: [ : stream |
			stream 
				nextPutAll: fastaRecord name;
				space;
				nextPutAll: (aDictionary at: fastaRecord sequenceNameWithoutDelimiter) ].
		fastaRecord name: newName ]
]

{ #category : #accessing }
BioFastaMultiRecord >> reverseComplement [
	" Answer a copy of the receiver's sequence complemented and with element order reversed. "
	
	^ self class basicNew initializeWith: (self records collect: #reverseComplement)

]

{ #category : #accessing }
BioFastaMultiRecord >> select: aBlock [
	" Evaluate aBlock with each of the receiver's fasta records as the argument. 
	Collect into a new collection like the receiver, only those elements for 
	which aBlock evaluates to true. Answer the new collection. "
	
	| newInstance |
	
	(newInstance := self class new) records: (self records select: aBlock).
	^ newInstance
]

{ #category : #accessing }
BioFastaMultiRecord >> sequenceNames [
	" Answer a <Collection> with receiver's sequence headers "
	
	^ self records collect: #sequenceName
]

{ #category : #accessing }
BioFastaMultiRecord >> sequenceStrings [
	" Answer a <Collection> with receiver's sequence strings "
	
	^ self records collect: #sequenceString
]

{ #category : #accessing }
BioFastaMultiRecord >> sequences [
	" Answer a <Collection> of <BioSequence> with the receiver's sequences "

	^ self records collect: #sequence
]

{ #category : #accessing }
BioFastaMultiRecord >> size [
	" Answer an <Integer> with the number of records in the receiver "
	
	^ self records size
]

{ #category : #converting }
BioFastaMultiRecord >> sort [
	" Sort records by sequence name. Answer a new instance of the receiver "
	
	| newFastaCollection |
	
	newFastaCollection := self class basicNew.
	newFastaCollection records: (self records asSortedCollection: [ : a : b | a name < b name ]).
	^ newFastaCollection
]
