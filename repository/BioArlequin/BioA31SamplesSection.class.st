Class {
	#name : #BioA31SamplesSection,
	#superclass : #BioA31INISection,
	#category : #'BioArlequin-Sections'
}

{ #category : #accessing }
BioA31SamplesSection class >> matches: anObject [

	^ anObject isInteger or: [ anObject = self notationSection ]
]

{ #category : #accessing }
BioA31SamplesSection class >> notation [
	" Answer a String describing the receiver's section identifier "
	
	^ '[Samples]'
]

{ #category : #accessing }
BioA31SamplesSection class >> sampleDataId [

	^ 'SampleData' -> 'A list of haplotypes or genotypes and their frequencies as found in the sample, entered within braces. If the data type is set to FREQUENCY, one must only specify for each haplotype its identifier (a string of characters without blanks) and its sample frequency (either relative or absolute). In this case the haplotype should not be defined'
]

{ #category : #accessing }
BioA31SamplesSection class >> sampleNameId [

	^ 'SampleName' -> 'A name for each sample (This name will be used in the Structure sub-section to identify the different samples, which are part of a given genetic structure to test)'
]

{ #category : #accessing }
BioA31SamplesSection class >> sampleSizeId [

	^ 'SampleSize' -> 'The size of the sample (For haplotypic data, the sample size is equal to the haploid sample size. For genotypic data, the sample size should be equal to the number of diploid individuals present in the sample. When absolute frequencies are entered, the size of each sample will be checked against the sum of all haplotypic frequencies will check. If a discrepancy is found, a Warning message is issued in the log file, and the sample size is set to the sum of haplotype frequencies. When relative frequencies are specified, no such check is possible, and the sample size is used to convert relative frequencies to absolute frequencies'
]

{ #category : #accessing }
BioA31SamplesSection class >> sectionSpecs [
	" Answer a Collection with raw data related with the Arlequin input format "
	
	^ Array 
		with: (BioA31Spec newTitle: self sampleNameId isMandatory: true defaultValue: String new)
		with: (BioA31Spec newTitle: self sampleSizeId isMandatory: true defaultValue: 0)
		with: (BioA31Spec newTitle: self sampleDataId isMandatory: true defaultValue: String new format: '{}')
]

{ #category : #accessing }
BioA31SamplesSection >> addDNAGroups: groupCollection [

	groupCollection do: [ : group |
		self 
			buildDNASample: group data 
			title: group name ].
]

{ #category : #samples }
BioA31SamplesSection >> addSampleData: aSampleCollection [
	" Add aSampleCollection to the receiver "

	self iniFile 
		section: self sampleKeyNumber
		at: self class sampleDataId key
		put: aSampleCollection.


]

{ #category : #samples }
BioA31SamplesSection >> addSampleName: aString [
	" Add a sample named aString to the receiver "

	^ self iniFile 
			section: self newSampleKeyNumber
			at: self class sampleNameId key
			put: aString
		

]

{ #category : #samples }
BioA31SamplesSection >> addSampleSize: aNumber [

	self iniFile 
		section: self sampleKeyNumber
		at: self class sampleSizeId key
		put: aNumber asString	
]

{ #category : #accessing }
BioA31SamplesSection >> addSamples: aBioA31SampleCollection [ 
	" Add populations to the receiver from aBioaBioA31SampleCollection "

	aBioA31SampleCollection do: [ : sample |
		self 
			addSampleName: sample identifier;
			addSampleSize: sample frequency;
			addSampleData: sample sequence ]
]

{ #category : #accessing }
BioA31SamplesSection >> at: keyString put: valueString [

	" Specialized to support non-unique entries in a section "

	| properKey |
	properKey := self realKey: keyString.
	^ self iniFile
		  section: self sampleKeyNumber
		  at: properKey
		  put: valueString
]

{ #category : #accessing }
BioA31SamplesSection >> buildDNASample: params title: groupTitle [

	| bioA31SamplesSection |
	
	bioA31SamplesSection := self iniFile samplesSection.
	bioA31SamplesSection
			addSampleName: groupTitle;
			addSampleSize: params frequenciesSize;	
			addSampleData: (BioA31SampleCollection forDNA
					identifiers: params identifiers;
					frequencies: params frequencies;
"					sequences: params sequences"
					yourself);
			yourself.
]

{ #category : #accessing }
BioA31SamplesSection >> newSampleKeyNumber [
	"Answer the value of sampleKeyNumber"

	^ self iniFile newSampleKey
]

{ #category : #accessing }
BioA31SamplesSection >> sampleKeyNumber [
	"Answer the value of sampleKeyNumber"

	^ self iniFile sampleKeyNumber
]

{ #category : #writing }
BioA31SamplesSection >> writeLabelOn: aStream [
	(self shouldWriteLabelOn: aStream)
		ifTrue: [ 
			aStream
				nextPut: Character cr;
				nextPut: $[;
				nextPutAll: self class notation;
				nextPut: $];
				nextPut: Character cr ]
]

{ #category : #private }
BioA31SamplesSection >> writeOn: aStream [
	" Write the receiver's section on aStream "

	| delimiter |
	
	delimiter := self iniFile newProfileSection locusSeparator value.
	self writeLabelOn: aStream.
	self associationsDo: [ :assoc | 
		" Label key case "
		aStream tab;
			nextPutAll: assoc key;
			nextPut: $=.
		assoc value isString 
			" Value case "
			ifTrue: [ self writeQuoted: assoc on: aStream ]
			" Matrix case "
			ifFalse: [ assoc value 
						writeSamplesOn: aStream 
						delimiter: delimiter ] ]
					

]
