Class {
	#name : 'BioSequenceAnalysisTest',
	#superclass : 'BioAbstractTest',
	#category : 'BioTools-Tests-Core',
	#package : 'BioTools-Tests',
	#tag : 'Core'
}

{ #category : 'as yet unclassified' }
BioSequenceAnalysisTest >> dnaSequence: aString [

	^ BioSequence newDNA: aString
]

{ #category : 'as yet unclassified' }
BioSequenceAnalysisTest >> newSeqRecord [

	^ BioSeqRecord new
		  sequence: (self dnaSequence: 'ATCGATCG');
		  id: 'TEST001';
		  yourself
]

{ #category : 'as yet unclassified' }
BioSequenceAnalysisTest >> proteinSequence: aString [

	^ BioSequence newProtein: aString
]

{ #category : 'as yet unclassified' }
BioSequenceAnalysisTest >> rnaSequence: aString [

	^ BioSequence newRNA: aString
]

{ #category : 'as yet unclassified' }
BioSequenceAnalysisTest >> testATRatio [

	| seq |
	seq := self dnaSequence: 'AATT'.
	self assert: seq atRatio equals: 1.0.
	seq := self dnaSequence: 'GGCC'.
	self assert: seq atRatio equals: 0.0
]

{ #category : 'as yet unclassified' }
BioSequenceAnalysisTest >> testAnnotationPreservesAll [

	| rec |
	rec := self newSeqRecord.
	rec
		seqVersion: 1;
		keywords: #( 'keyword1' );
		dates: #( '01-JAN-2024' );
		species: 'Homo sapiens';
		primaryAccession: 'NM_001';
		secondaryAccessions: #( 'NM_001.1' );
		division: 'PRI';
		taxonomy: #( 'Eukaryota' ).
	self assert: rec seqVersion equals: 1.
	self assert: rec keywords first equals: 'keyword1'.
	self assert: rec dates first equals: '01-JAN-2024'.
	self assert: rec species equals: 'Homo sapiens'.
	self assert: rec primaryAccession equals: 'NM_001'
]

{ #category : 'as yet unclassified' }
BioSequenceAnalysisTest >> testComposition [

	| seq comp |
	seq := self dnaSequence: 'ATCGATCG'.
	comp := seq composition.
	self assert: (comp at: $A) equals: 2.
	self assert: (comp at: $T) equals: 2.
	self assert: (comp at: $C) equals: 2.
	self assert: (comp at: $G) equals: 2
]

{ #category : 'as yet unclassified' }
BioSequenceAnalysisTest >> testCompositionWithFrequencies [

	| seq comp |
	seq := self dnaSequence: 'AATT'.
	comp := seq compositionWithFrequencies.
	self assert: ((comp at: $A) at: #count) equals: 2.
	self assert: ((comp at: $A) at: #frequency) equals: 0.5
]

{ #category : 'as yet unclassified' }
BioSequenceAnalysisTest >> testDates [

	| rec |
	rec := self newSeqRecord.
	self assert: rec dates isEmpty.
	rec dates: #( '01-JAN-2024' '15-FEB-2024' ).
	self assert: rec dates size equals: 2
]

{ #category : 'as yet unclassified' }
BioSequenceAnalysisTest >> testDefinition [

	| rec |
	rec := self newSeqRecord.
	rec definition: 'Test sequence for unit testing'.
	self assert: rec definition equals: 'Test sequence for unit testing'
]

{ #category : 'as yet unclassified' }
BioSequenceAnalysisTest >> testDivision [

	| rec |
	rec := self newSeqRecord.
	rec division: 'PRI'.
	self assert: rec division equals: 'PRI'
]

{ #category : 'as yet unclassified' }
BioSequenceAnalysisTest >> testFeatureCount [

	| rec |
	rec := self newSeqRecord.
	self assert: rec featureCount equals: 0.
	rec addSeqFeature: (BioSequenceFeature new primaryTag: 'gene').
	rec addSeqFeature: (BioSequenceFeature new primaryTag: 'CDS').
	self assert: rec featureCount equals: 2
]

{ #category : 'as yet unclassified' }
BioSequenceAnalysisTest >> testGCRatio [

	| seq |
	seq := self dnaSequence: 'GGCC'.
	self assert: seq gcRatio equals: 1.0.
	seq := self dnaSequence: 'AATT'.
	self assert: seq gcRatio equals: 0.0.
	seq := self dnaSequence: 'ATGC'.
	self assert: seq gcRatio equals: 0.5
]

{ #category : 'as yet unclassified' }
BioSequenceAnalysisTest >> testKeywords [

	| rec |
	rec := self newSeqRecord.
	self assert: rec keywords isEmpty.
	rec keywords: #( 'hypothetical protein' 'complete cds' ).
	self assert: rec keywords size equals: 2.
	self assert: rec keywords first equals: 'hypothetical protein'
]

{ #category : 'as yet unclassified' }
BioSequenceAnalysisTest >> testNucleotideComposition [

	| seq comp |
	seq := self dnaSequence: 'AATTTGGC'.
	comp := seq nucleotideComposition.
	self assert: (comp at: $A) equals: 2.
	self assert: (comp at: $T) equals: 3.
	self assert: (comp at: $G) equals: 2.
	self assert: (comp at: $C) equals: 1
]

{ #category : 'as yet unclassified' }
BioSequenceAnalysisTest >> testNucleotideCompositionRNA [

	| seq comp |
	seq := self rnaSequence: 'AAUUUGGC'.
	comp := seq nucleotideComposition.
	self assert: (comp at: $A) equals: 2.
	self assert: (comp at: $U) equals: 3.
	self assert: (comp at: $G) equals: 2.
	self assert: (comp at: $C) equals: 1
]

{ #category : 'as yet unclassified' }
BioSequenceAnalysisTest >> testOrganism [

	| rec |
	rec := self newSeqRecord.
	rec organism: 'Drosophila melanogaster'.
	self assert: rec organism equals: 'Drosophila melanogaster'
]

{ #category : 'as yet unclassified' }
BioSequenceAnalysisTest >> testPrimaryAccession [

	| rec |
	rec := self newSeqRecord.
	rec primaryAccession: 'NM_12345'.
	self assert: rec primaryAccession equals: 'NM_12345'
]

{ #category : 'as yet unclassified' }
BioSequenceAnalysisTest >> testPrimaryAccessionDefaultsToId [

	| rec |
	rec := self newSeqRecord.
	"When no accession set, should return id"
	self assert: rec primaryAccession equals: 'TEST001'
]

{ #category : 'as yet unclassified' }
BioSequenceAnalysisTest >> testSecondaryAccessions [

	| rec |
	rec := self newSeqRecord.
	self assert: rec secondaryAccessions isEmpty.
	rec secondaryAccessions: #( 'NM_12345.1' 'NM_12345.2' ).
	self assert: rec secondaryAccessions size equals: 2
]

{ #category : 'as yet unclassified' }
BioSequenceAnalysisTest >> testSeqVersion [

	| rec |
	rec := self newSeqRecord.
	self assert: rec seqVersion isNil.
	rec seqVersion: 1.
	self assert: rec seqVersion equals: 1.
	rec seqVersion: 2.
	self assert: rec seqVersion equals: 2
]

{ #category : 'as yet unclassified' }
BioSequenceAnalysisTest >> testSequenceTypeDNA [

	| seq |
	seq := self dnaSequence: 'ATCG'.
	self assert: seq sequenceType equals: #DNA
]

{ #category : 'as yet unclassified' }
BioSequenceAnalysisTest >> testSequenceTypeProtein [

	| seq |
	seq := self proteinSequence: 'MVLSP'.
	self assert: seq sequenceType equals: #Protein
]

{ #category : 'as yet unclassified' }
BioSequenceAnalysisTest >> testSequenceTypeRNA [

	| seq |
	seq := self rnaSequence: 'AUCG'.
	self assert: seq sequenceType equals: #RNA
]

{ #category : 'as yet unclassified' }
BioSequenceAnalysisTest >> testSpecies [

	| rec |
	rec := self newSeqRecord.
	self assert: rec species isNil.
	rec species: 'Homo sapiens'.
	self assert: rec species equals: 'Homo sapiens'
]

{ #category : 'as yet unclassified' }
BioSequenceAnalysisTest >> testSpeciesName [

	| rec |
	rec := self newSeqRecord.
	rec speciesName: 'Mus musculus'.
	self assert: rec speciesName equals: 'Mus musculus'
]

{ #category : 'as yet unclassified' }
BioSequenceAnalysisTest >> testSpeciesNameFromOrganism [

	| rec |
	rec := self newSeqRecord.
	rec organism: 'Escherichia coli'.
	self assert: rec speciesName equals: 'Escherichia coli'
]

{ #category : 'as yet unclassified' }
BioSequenceAnalysisTest >> testTaxonomy [

	| rec |
	rec := self newSeqRecord.
	rec taxonomy:
		#( 'Eukaryota' 'Metazoa' 'Chordata' 'Craniata' 'Mammalia' ).
	self assert: rec taxonomy size equals: 5.
	self assert: rec taxonomy first equals: 'Eukaryota'
]
