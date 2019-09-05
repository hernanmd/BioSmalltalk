Class {
	#name : #BioCutadaptWrapper,
	#superclass : #BioWrapperObject,
	#category : 'BioNGS-Trimming'
}

{ #category : #properties }
BioCutadaptWrapper >> adapter3Prime: aSequenceString [  
	" Set the adapter sequence to be aSequenceString "

	self propertyAt: 'a' ifAbsentPut: [ aSequenceString ]
]

{ #category : #properties }
BioCutadaptWrapper >> adapter3PrimeAnchored: aSequenceString [  
	" Set the adapter sequence to be aSequenceString "

	self propertyAt: 'a' ifAbsentPut: [ aSequenceString , '$' ]
]

{ #category : #properties }
BioCutadaptWrapper >> adapter5Prime: aSequenceString [  
	" Set the adapter sequence to be aSequenceString "

	self propertyAt: 'g' ifAbsentPut: [ aSequenceString ]
]

{ #category : #properties }
BioCutadaptWrapper >> adapter5PrimeAnchored: aSequenceString [  
	" Set the adapter sequence to be aSequenceString "

	self propertyAt: 'g' ifAbsentPut: [ '^' , aSequenceString ]
]

{ #category : #properties }
BioCutadaptWrapper >> adapter: aSequenceString [  
	" Set the 5' or 3' adapter (both possible) sequence to be aSequenceString "

	self propertyAt: 'b' ifAbsentPut: [ aSequenceString ]
]

{ #category : #properties }
BioCutadaptWrapper >> adapterLink: adapterSequenceString1 to: adapterSequenceString2 [
	" Set the 5' or 3' adapter (both possible) sequence to be aSequenceString "

	self propertyAt: 'a' ifAbsentPut: [ adapterSequenceString1 , '...' , adapterSequenceString2 ]
]

{ #category : #properties }
BioCutadaptWrapper >> adapterLinkNoAnchoring: adapterSequenceString1 to: adapterSequenceString2 [
	" Set the 5' or 3' adapter (both possible) sequence to be aSequenceString "

	self propertyAt: 'g' ifAbsentPut: [ adapterSequenceString1 , '...' , adapterSequenceString2 ]
]

{ #category : #programs }
BioCutadaptWrapper >> cutadapt [
	" Answer a <String> with the receiver's executable name "
	
	^ 'cutadapt'
]

{ #category : #programs }
BioCutadaptWrapper >> defaultProgramName [ 
	" Private - See superimplementor's comment "

	^ self programNamed: self cutadapt
]

{ #category : #options }
BioCutadaptWrapper >> discardTrimmed [
	" Throw away reads in which an adapter was found. "

	 ^ self addOption: 'discard-trimmed'
]

{ #category : #options }
BioCutadaptWrapper >> discardUntrimmed [
	" Throw away reads in which no adapter was found "

	 ^ self addOption: 'discard-untrimmed'
]

{ #category : #properties }
BioCutadaptWrapper >> input: fileName [  
	" Set the input file to fileName "

	self propertyAt: '' ifAbsentPut: [ fileName ]
]

{ #category : #options }
BioCutadaptWrapper >> matchReadWildcards [
	" Enable wildcards in reads "

	 ^ self addOption: 'match-read-wildcards'
]

{ #category : #properties }
BioCutadaptWrapper >> maximumLength: anInteger [
	" Throw away processed reads longer than anInteger bases "

	self propertyAt: 'M' ifAbsentPut: [ anInteger ]

]

{ #category : #properties }
BioCutadaptWrapper >> minimumLength: anInteger [
	" Throw away processed reads shorter than anInteger bases "

	self propertyAt: 'm' ifAbsentPut: [ anInteger ]

]

{ #category : #properties }
BioCutadaptWrapper >> minimumOverlapLength: aNumber [
	" Set the minimum overlap length to reduce the number of falsely trimmed bases "

	self propertyAt: 'O' ifAbsentPut: [ aNumber ]

]

{ #category : #properties }
BioCutadaptWrapper >> out: fileName [  
	" Set the output file to fileName "

	self propertyAt: 'o' ifAbsentPut: [ fileName ]
]

{ #category : #properties }
BioCutadaptWrapper >> propertyAt: keyName ifAbsentPut: aBlock [
	" See superimplementor's comment "

	keyName size = 1
		ifTrue: [ self propertySeparator: Character space ].
	super propertyAt: keyName ifAbsentPut: aBlock

]

{ #category : #properties }
BioCutadaptWrapper >> qualityBase64 [
	"  "

	self propertySeparator: $=.
	self propertyAt: 'quality-base' ifAbsentPut: [ 64 ]
]

{ #category : #properties }
BioCutadaptWrapper >> qualityCutOff: aNumberOrAssociation [
	" Trim low-quality ends from reads BEFORE adapter removal. By default only the 3' end of each read is trimmed, use an <Association> as paramter to trim the 5' end as well "

	self propertyAt: 'q' ifAbsentPut: [ aNumberOrAssociation asBioCutadaptParameter ]

]

{ #category : #properties }
BioCutadaptWrapper >> removeBases: aNumber [
	" Remove aNumber of bases from the beginning or end of each read. Applied before any adapter trimming "

	self propertyAt: 'u' ifAbsentPut: [ aNumber ]
]

{ #category : #properties }
BioCutadaptWrapper >> shortenReads: anInteger [
	" Shorten each read down to a certain length "

	self propertyAt: 'l' ifAbsentPut: [ anInteger ]
]

{ #category : #properties }
BioCutadaptWrapper >> tooLongOutput: aFilename [
	" Instead of throwing away the reads that are too long according to -M, write them to FILE (in FASTA/FASTQ format). "

	self propertySeparator: Character space.
	self propertyAt: 'too-long-output' ifAbsentPut: [ aFilename ]
]

{ #category : #properties }
BioCutadaptWrapper >> tooShortOutput: aFilename [
	" Instead of throwing away the reads that are too short according to -m, write them to FILE (in FASTA/FASTQ format). "

	self propertySeparator: Character space.
	self propertyAt: 'too-short-output' ifAbsentPut: [ aFilename ]
]

{ #category : #properties }
BioCutadaptWrapper >> untrimmedOutput: aFilename [
	" Write all reads without adapters to FILE (in FASTA/FASTQ format) instead of writing them to the regular output file "

	self propertySeparator: Character space.
	self propertyAt: 'untrimmed-output' ifAbsentPut: [ aFilename ]
]
