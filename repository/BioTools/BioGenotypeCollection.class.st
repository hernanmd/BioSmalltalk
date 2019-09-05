"
Represents a collection of BioGenotype objects.

It can be instantiated from a given String with alleles separated by spaces, tabs or other common delimiters.

"
Class {
	#name : #BioGenotypeCollection,
	#superclass : #BioObject,
	#instVars : [
		'genotypes'
	],
	#category : #'BioTools-Biological'
}

{ #category : #'instance creation' }
BioGenotypeCollection class >> fromAlleles: aCollection [
	" Answer a new instance of the receiver without tokens between each allele, aCollection contains each genotype as a two-sized String : #('CC' 'CC' 'TC' 'TT') "
	
	^ self new
		initializeFromAlleles: aCollection;
		yourself

]

{ #category : #'instance creation' }
BioGenotypeCollection class >> fromSpacedAlleles: aString [
	" Answer a new instance of the receiver using a space tokenized <String> as input as contents "
	
	^ self new
		initializeFromSpacedAlleles: aString;
		yourself
]

{ #category : #'instance creation' }
BioGenotypeCollection class >> fromTabbedAlleles: aString [
	" Answer a new instance of the receiver using a space tokenized <String> as input as contents "
	
	^ self new
		initializeFromTabbedAlleles: aString;
		yourself
]

{ #category : #accessing }
BioGenotypeCollection >> collectionClass [

	^ OrderedCollection 
]

{ #category : #initialization }
BioGenotypeCollection >> findAllelesFrom: aCollection [

	^ aCollection 
		select: [ : aString | aString isAllele ]
		thenCollect: [ : genotypeString | BioGenotype withSpacedAlleles: genotypeString ]
]

{ #category : #accessing }
BioGenotypeCollection >> genotypes [

	^ genotypes
		ifNil: [ genotypes := self collectionClass new ]
]

{ #category : #accessing }
BioGenotypeCollection >> genotypes: anObject [
	genotypes := anObject
]

{ #category : #initialization }
BioGenotypeCollection >> initializeFromAlleles: aCollection [
	" Private - See class instance creation comment "

	self genotypes: (self collectionClass new: aCollection size).
	self genotypes addAll: (self findAllelesFrom: aCollection)
]

{ #category : #initialization }
BioGenotypeCollection >> initializeFromAlleles: aString spacing: aCharacter [
	" Private - See class instance creation comment "

	self genotypes: (self collectionClass new: (aString size / 2) rounded).
	(aString findTokens: aCharacter)
		pairsDo: [ : a : b |
			self genotypes add: (BioGenotype new
				alleleA: a;
				alleleB: b;
				yourself) ]
]

{ #category : #initialization }
BioGenotypeCollection >> initializeFromSpacedAlleles: aString [
	" Private - See class instance creation comment "

	self initializeFromAlleles: aString spacing: Character space

]

{ #category : #initialization }
BioGenotypeCollection >> initializeFromTabbedAlleles: aString [
	" Private - See class instance creation comment "

	self initializeFromAlleles: aString spacing: Character tab

]

{ #category : #accessing }
BioGenotypeCollection >> spaceAlleles [

	^ self genotypes collect: [ : geno | 
		String streamContents: [ : stream |
			stream 
				nextPut: geno alleleA;
				space;
				nextPut: geno alleleB  ] ]
]
